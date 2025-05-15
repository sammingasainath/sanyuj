package com.sensorapi.sensor_api

import android.Manifest
import android.content.Context
import android.content.pm.PackageManager
import android.hardware.Sensor
import android.hardware.SensorEvent
import android.hardware.SensorManager
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.os.PowerManager
import android.util.Log
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import io.flutter.plugin.common.EventChannel
import java.util.Timer
import java.util.TimerTask

/**
 * Handler for step counter sensor
 */
class StepCounterSensorHandler(
    private val context: Context,
    sensorManager: SensorManager
) : BaseSensorHandler(
    context,
    Sensor.TYPE_STEP_COUNTER,
    "StepCounter",
    "com.sensorapi/step_counter",
    sensorManager
) {
    private var stepCount: Int = 0
    
    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        eventSink = events
        
        if (sensor != null) {
            // Check permission for Android 10+
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                if (ContextCompat.checkSelfPermission(
                        context,
                        Manifest.permission.ACTIVITY_RECOGNITION
                    ) == PackageManager.PERMISSION_GRANTED
                ) {
                    registerSensor()
                } else {
                    events?.error(
                        "PERMISSION_DENIED",
                        "Activity recognition permission not granted",
                        null
                    )
                    // Permission needs to be requested from the MainActivity
                }
            } else {
                // For Android 9 and below, no permission needed
                registerSensor()
            }
        } else {
            events?.error("UNAVAILABLE", "Step counter sensor not available", null)
        }
    }
    
    override fun onSensorChanged(event: SensorEvent?) {
        if (event != null) {
            stepCount = event.values[0].toInt()
            val data = mapOf(
                "steps" to stepCount,
                "timestamp" to System.currentTimeMillis()
            )
            eventSink?.success(data)
        }
    }
}

/**
 * Handler for step detector sensor with simulation fallback
 */
class StepDetectorSensorHandler(
    private val context: Context,
    sensorManager: SensorManager
) : BaseSensorHandler(
    context,
    Sensor.TYPE_STEP_DETECTOR,
    "StepDetector",
    "com.sensorapi/step_detector",
    sensorManager
) {
    private var wakeLock: PowerManager.WakeLock? = null
    private var stepDetectorTimer: Timer? = null
    private var lastHardwareStepTime: Long = 0
    private val STEP_DETECTOR_TIMEOUT_MS = 15000L // 15 seconds
    private var isStepDetectorSimulationActive = false
    private val mainHandler = Handler(Looper.getMainLooper())
    
    // Timer for simulating step detector events
    private var stepSimulationTimer: Timer? = null
    
    // Step detector state
    private var stepDetected: Boolean = false
    private var lastStepTimestamp: Long = 0
    
    // For batch processing
    private val MAX_REPORT_LATENCY_US = 5000000 // 5 seconds in microseconds
    
    init {
        // Initialize wake lock
        val powerManager = context.getSystemService(Context.POWER_SERVICE) as PowerManager
        wakeLock = powerManager.newWakeLock(
            PowerManager.PARTIAL_WAKE_LOCK,
            "SensorAPI::StepDetectorWakeLock"
        )
    }
    
    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        eventSink = events
        
        if (sensor != null) {
            // Detailed logging about the sensor first
            Log.d(TAG, "Step detector details: Name=${sensor?.name}, " +
                  "Vendor=${sensor?.vendor}, Type=${sensor?.type}, " +
                  "MinDelay=${sensor?.minDelay}μs, " +
                  "MaxDelay=${sensor?.maxDelay}μs, " +
                  "FIFO=${sensor?.fifoReservedEventCount} events, " +
                  "MaxFIFO=${sensor?.fifoMaxEventCount} events")
            
            // Check if it's MediaTek (MTK) and adjust accordingly
            val isMtkSensor = sensor?.vendor?.contains("MTK", ignoreCase = true) ?: false
            Log.d(TAG, "Using MediaTek specific optimizations: $isMtkSensor")
            
            // Check permission for Android 10+
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                if (ContextCompat.checkSelfPermission(
                        context,
                        Manifest.permission.ACTIVITY_RECOGNITION
                    ) == PackageManager.PERMISSION_GRANTED
                ) {
                    // Acquire wake lock to keep sensor active
                    try {
                        if (wakeLock?.isHeld == false) {
                            wakeLock?.acquire(10*60*1000L) // 10 minutes
                            Log.d(TAG, "Wake lock acquired for step detector")
                        }
                    } catch (e: Exception) {
                        Log.e(TAG, "Error acquiring wake lock: ${e.message}")
                    }
                    
                    registerSensor(isMtkSensor)
                    
                    // Start the timer to detect if hardware sensor is responsive
                    startStepDetectorFailureDetection()
                } else {
                    events?.error(
                        "PERMISSION_DENIED",
                        "Activity recognition permission not granted",
                        null
                    )
                    // Permission needs to be requested from the MainActivity
                }
            } else {
                // For Android 9 and below, no permission needed
                try {
                    if (wakeLock?.isHeld == false) {
                        wakeLock?.acquire(10*60*1000L) // 10 minutes
                        Log.d(TAG, "Wake lock acquired for step detector")
                    }
                } catch (e: Exception) {
                    Log.e(TAG, "Error acquiring wake lock: ${e.message}")
                }
                
                registerSensor(isMtkSensor)
                
                // Start the timer to detect if hardware sensor is responsive
                startStepDetectorFailureDetection()
            }
        } else {
            Log.e(TAG, "Step detector sensor not available on this device")
            events?.error("UNAVAILABLE", "Step detector sensor not available", null)
            
            // No hardware sensor, start simulation immediately
            startStepDetectorSimulation()
        }
    }
    
    override fun registerSensor() {
        registerSensor(false)
    }
    
    private fun registerSensor(isMtkSensor: Boolean) {
        // Remove any existing registration first
        sensorManager.unregisterListener(this, sensor)
        
        // Try multiple strategies to get the sensor working
        val strategies = mutableListOf<String>()
        
        if (isMtkSensor) {
            // For MediaTek sensors, try special batching configuration first
            Log.d(TAG, "Trying MediaTek specific registration with batching...")
            val success = sensorManager.registerListener(
                this,
                sensor,
                SensorManager.SENSOR_DELAY_GAME, // More frequent
                MAX_REPORT_LATENCY_US // Allow batch processing
            )
            strategies.add("MTK batch mode: $success")
            
            if (!success) {
                // If that fails, try another strategy
                Log.d(TAG, "MTK batch registration failed, trying normal registration...")
                val success2 = sensorManager.registerListener(
                    this,
                    sensor,
                    SensorManager.SENSOR_DELAY_FASTEST
                )
                strategies.add("MTK fastest mode: $success2")
            }
        } else {
            // For non-MTK sensors, try multiple strategies
            // 1. First attempt - fastest with no delay
            val success1 = sensorManager.registerListener(
                this,
                sensor,
                SensorManager.SENSOR_DELAY_FASTEST,
                0 // No delay
            )
            strategies.add("Fastest mode: $success1")
            
            // 2. Second attempt if first fails - game speed with batching
            if (!success1) {
                val success2 = sensorManager.registerListener(
                    this,
                    sensor,
                    SensorManager.SENSOR_DELAY_GAME,
                    MAX_REPORT_LATENCY_US
                )
                strategies.add("Game with batching: $success2")
            }
        }
        
        // Log registration outcomes
        Log.d(TAG, "Step detector registration attempts: $strategies")
        
        // Log available sensor details for debugging
        Log.d(TAG, "Step detector sensor details: " +
              "Name=${sensor?.name}, " +
              "Vendor=${sensor?.vendor}, " +
              "Version=${sensor?.version}, " +
              "Power=${sensor?.power} mA, " +
              "Resolution=${sensor?.resolution}, " +
              "MaxRange=${sensor?.maximumRange}")
    }
    
    override fun onCancel(arguments: Any?) {
        if (sensor != null) {
            sensorManager.unregisterListener(this, sensor)
            Log.d(TAG, "Step detector sensor unregistered")
        }
        
        // Release wake lock if it was acquired
        try {
            if (wakeLock?.isHeld == true) {
                wakeLock?.release()
                Log.d(TAG, "Wake lock released")
            }
        } catch (e: Exception) {
            Log.e(TAG, "Error releasing wake lock: ${e.message}")
        }
        
        // Stop any timers
        stopStepDetectorFailureDetection()
        stopStepDetectorSimulation()
        
        eventSink = null
    }
    
    // Try to trigger the sensor with a "force flush" operation for batched sensors
    private fun forceSensorUpdate() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            try {
                val flushed = sensorManager.flush(this)
                Log.d(TAG, "Forced sensor flush request: $flushed")
            } catch (e: Exception) {
                Log.e(TAG, "Error flushing sensor: ${e.message}")
            }
        }
    }
    
    override fun onSensorChanged(event: SensorEvent?) {
        if (event != null) {
            // This sensor returns 1.0 when a step is detected
            Log.d(TAG, "Step detector event received: ${event.values[0]}")
            if (event.values[0] > 0) {
                // Update the last hardware step time
                lastHardwareStepTime = System.currentTimeMillis()
                
                // If hardware is working, stop any simulation
                if (isStepDetectorSimulationActive) {
                    Log.i(TAG, "Hardware step detector working, stopping simulation")
                    stopStepDetectorSimulation()
                }
                
                stepDetected = true
                lastStepTimestamp = System.currentTimeMillis()
                val data = mapOf(
                    "detected" to true,
                    "timestamp" to lastStepTimestamp,
                    "simulated" to false
                )
                Log.d(TAG, "Real step detected! Sending to Flutter: $data")
                eventSink?.success(data)
            }
        }
    }
    
    // Function to start a timer that detects if the hardware step detector is not producing events
    private fun startStepDetectorFailureDetection() {
        // Cancel any existing timer
        stopStepDetectorFailureDetection()
        
        lastHardwareStepTime = System.currentTimeMillis()
        stepDetectorTimer = Timer()
        Log.d(TAG, "Starting hardware step detector failure detection with timeout: ${STEP_DETECTOR_TIMEOUT_MS}ms")
        stepDetectorTimer?.schedule(object : TimerTask() {
            override fun run() {
                val currentTime = System.currentTimeMillis()
                // If no hardware step event in timeout period and simulation not already active
                if (currentTime - lastHardwareStepTime > STEP_DETECTOR_TIMEOUT_MS && !isStepDetectorSimulationActive) {
                    // Try one last direct trigger before giving up
                    mainHandler.post {
                        forceSensorUpdate()
                        
                        // Wait a bit to see if the flush triggers any events
                        mainHandler.postDelayed({
                            // Check again if we've received any events
                            if (System.currentTimeMillis() - lastHardwareStepTime > STEP_DETECTOR_TIMEOUT_MS) {
                                Log.w(TAG, "Step detector hardware not responding for ${(System.currentTimeMillis() - lastHardwareStepTime)/1000}s, switching to simulation")
                                
                                // Try re-registering with different parameters once before giving up
                                sensorManager.unregisterListener(this@StepDetectorSensorHandler, sensor)
                                
                                mainHandler.postDelayed({
                                    val success = sensorManager.registerListener(
                                        this@StepDetectorSensorHandler,
                                        sensor,
                                        SensorManager.SENSOR_DELAY_NORMAL // Try normal speed as last resort
                                    )
                                    Log.d(TAG, "Last attempt registration: $success")
                                    
                                    // If still no response after a wait, give up and simulate
                                    mainHandler.postDelayed({
                                        if (System.currentTimeMillis() - lastHardwareStepTime > STEP_DETECTOR_TIMEOUT_MS) {
                                            startStepDetectorSimulation()
                                        }
                                    }, 2000)
                                }, 500)
                            }
                        }, 1000)
                    }
                }
            }
        }, STEP_DETECTOR_TIMEOUT_MS, STEP_DETECTOR_TIMEOUT_MS) // Check after timeout
    }
    
    private fun stopStepDetectorFailureDetection() {
        stepDetectorTimer?.cancel()
        stepDetectorTimer = null
    }
    
    // Function to start simulating step detector events
    private fun startStepDetectorSimulation() {
        // If simulation is already active, don't start another one
        if (isStepDetectorSimulationActive) return
        
        Log.i(TAG, "Starting step detector simulation")
        isStepDetectorSimulationActive = true
        
        // Clean up any existing timer
        stopStepDetectorSimulation()
        
        // Create a new timer that simulates steps
        stepSimulationTimer = Timer()
        
        // We'll use a different approach that doesn't require rescheduling the same TimerTask
        stepSimulationTimer?.scheduleAtFixedRate(object : TimerTask() {
            override fun run() {
                // Add some randomness to make it more natural (skip some "steps")
                if (Math.random() > 0.3) { // 70% chance of detecting a step
                    mainHandler.post {
                        if (eventSink != null) {
                            stepDetected = true
                            lastStepTimestamp = System.currentTimeMillis()
                            val data = mapOf(
                                "detected" to true,
                                "timestamp" to lastStepTimestamp,
                                "simulated" to true
                            )
                            Log.d(TAG, "Simulated step detected! Sending to Flutter: $data")
                            eventSink?.success(data)
                        }
                    }
                }
            }
        }, 1000, 1500) // First step after 1s, then roughly every 1.5s
    }
    
    private fun stopStepDetectorSimulation() {
        stepSimulationTimer?.cancel()
        stepSimulationTimer = null
        isStepDetectorSimulationActive = false
    }
}