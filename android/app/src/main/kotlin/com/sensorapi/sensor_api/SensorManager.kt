package com.sensorapi.sensor_api

import android.content.Context
import android.hardware.SensorManager
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel

/**
 * Central manager for all sensors
 */
class SensorApiManager(private val context: Context) {
    private val sensorManager: SensorManager = context.getSystemService(Context.SENSOR_SERVICE) as SensorManager
    private val permissionManager = PermissionManager(context)
    
    // All sensor handlers
    private val proximitySensorHandler = ProximitySensorHandler(context, sensorManager)
    private val lightSensorHandler = LightSensorHandler(context, sensorManager)
    private val pressureSensorHandler = PressureSensorHandler(context, sensorManager)
    private val stepCounterSensorHandler = StepCounterSensorHandler(context, sensorManager)
    private val stepDetectorSensorHandler = StepDetectorSensorHandler(context, sensorManager)
    private val rotationVectorSensorHandler = RotationVectorSensorHandler(context, sensorManager)
    private val orientationSensorHandler = OrientationSensorHandler(context, sensorManager)
    private val gravitySensorHandler = GravitySensorHandler(context, sensorManager)
    private val linearAccelerationSensorHandler = LinearAccelerationSensorHandler(context, sensorManager)
    private val gameRotationVectorSensorHandler = GameRotationVectorSensorHandler(context, sensorManager)
    private val geomagneticRotationVectorSensorHandler = GeomagneticRotationVectorSensorHandler(context, sensorManager)
    
    // Uncalibrated sensor handlers
    private val accelerometerUncalibratedSensorHandler = AccelerometerUncalibratedSensorHandler(context, sensorManager)
    private val magneticFieldUncalibratedSensorHandler = MagneticFieldUncalibratedSensorHandler(context, sensorManager)
    private val gyroscopeUncalibratedSensorHandler = GyroscopeUncalibratedSensorHandler(context, sensorManager)
    
    // New sensor handlers
    // TODO: Implement these sensor handlers
    /*
    private val cameraSensorHandler = CameraSensorHandler(context, sensorManager)
    private val microphoneSensorHandler = MicrophoneSensorHandler(context, sensorManager)
    private val gpsSensorHandler = GpsSensorHandler(context, sensorManager)
    private val touchSensorHandler = TouchSensorHandler(context, sensorManager)
    */
    
    // Channel names
    companion object {
        const val METHOD_CHANNEL = "com.sensorapi/sensors"
        const val PROXIMITY_CHANNEL = "com.sensorapi/proximity"
        const val LIGHT_CHANNEL = "com.sensorapi/light"
        const val PRESSURE_CHANNEL = "com.sensorapi/pressure"
        const val STEP_COUNTER_CHANNEL = "com.sensorapi/step_counter"
        const val STEP_DETECTOR_CHANNEL = "com.sensorapi/step_detector"
        const val ROTATION_VECTOR_CHANNEL = "com.sensorapi/rotation_vector"
        const val ORIENTATION_CHANNEL = "com.sensorapi/orientation"
        const val GRAVITY_CHANNEL = "com.sensorapi/gravity"
        const val LINEAR_ACCELERATION_CHANNEL = "com.sensorapi/linear_acceleration"
        const val DEVICE_ORIENTATION_CHANNEL = "com.sensorapi/device_orientation"
        const val GAME_ROTATION_VECTOR_CHANNEL = "com.sensorapi/game_rotation_vector"
        const val GEOMAGNETIC_ROTATION_VECTOR_CHANNEL = "com.sensorapi/geomagnetic_rotation_vector"
        
        // Uncalibrated sensor channel names
        const val ACCELEROMETER_UNCALIBRATED_CHANNEL = "com.sensorapi/accelerometer_uncalibrated"
        const val MAGNETIC_FIELD_UNCALIBRATED_CHANNEL = "com.sensorapi/magnetic_field_uncalibrated"
        const val GYROSCOPE_UNCALIBRATED_CHANNEL = "com.sensorapi/gyroscope_uncalibrated"
        
        // Direct access channels for basic sensors
        const val DIRECT_ACCELEROMETER_CHANNEL = "com.sensorapi/direct_accelerometer"
        const val DIRECT_GYROSCOPE_CHANNEL = "com.sensorapi/direct_gyroscope"
        const val DIRECT_MAGNETOMETER_CHANNEL = "com.sensorapi/direct_magnetometer"
        
        // New sensor channel names
        const val CAMERA_CHANNEL = "com.sensorapi/camera"
        const val MICROPHONE_CHANNEL = "com.sensorapi/microphone"
        const val GPS_CHANNEL = "com.sensorapi/gps"
        const val TOUCH_CHANNEL = "com.sensorapi/touch"
    }
    
    /**
     * Setup method channel for sensor information
     */
    fun setupMethodChannel(flutterEngine: FlutterEngine) {
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, METHOD_CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "getAvailableSensors" -> {
                    val sensors = mutableListOf<String>()
                    if (proximitySensorHandler.isAvailable()) sensors.add("Proximity")
                    if (lightSensorHandler.isAvailable()) sensors.add("Light")
                    if (pressureSensorHandler.isAvailable()) sensors.add("Pressure")
                    if (stepCounterSensorHandler.isAvailable()) sensors.add("StepCounter")
                    if (stepDetectorSensorHandler.isAvailable()) sensors.add("StepDetector")
                    if (rotationVectorSensorHandler.isAvailable()) sensors.add("RotationVector")
                    if (orientationSensorHandler.isAvailable()) sensors.add("Orientation")
                    if (gravitySensorHandler.isAvailable()) sensors.add("Gravity")
                    if (linearAccelerationSensorHandler.isAvailable()) sensors.add("LinearAcceleration")
                    if (gameRotationVectorSensorHandler.isAvailable()) sensors.add("GameRotationVector")
                    if (geomagneticRotationVectorSensorHandler.isAvailable()) sensors.add("GeomagneticRotationVector")
                    
                    // Add uncalibrated sensors
                    if (accelerometerUncalibratedSensorHandler.isAvailable()) sensors.add("AccelerometerUncalibrated")
                    if (magneticFieldUncalibratedSensorHandler.isAvailable()) sensors.add("MagneticFieldUncalibrated")
                    if (gyroscopeUncalibratedSensorHandler.isAvailable()) sensors.add("GyroscopeUncalibrated")
                    
                    // Add new sensors
                    /*
                    if (cameraSensorHandler.isAvailable()) sensors.add("Camera")
                    if (microphoneSensorHandler.isAvailable()) sensors.add("Microphone")
                    if (gpsSensorHandler.isAvailable()) sensors.add("GPS")
                    if (touchSensorHandler.isAvailable()) sensors.add("Touch")
                    */
                    
                    result.success(sensors)
                }
                "hasSensor" -> {
                    val sensorType = call.argument<String>("type") ?: ""
                    val hasSensor = when (sensorType) {
                        "accelerometer" -> sensorManager.getSensorList(android.hardware.Sensor.TYPE_ACCELEROMETER).isNotEmpty()
                        "gyroscope" -> sensorManager.getSensorList(android.hardware.Sensor.TYPE_GYROSCOPE).isNotEmpty()
                        "magnetometer" -> sensorManager.getSensorList(android.hardware.Sensor.TYPE_MAGNETIC_FIELD).isNotEmpty()
                        "proximity" -> sensorManager.getSensorList(android.hardware.Sensor.TYPE_PROXIMITY).isNotEmpty()
                        "light" -> sensorManager.getSensorList(android.hardware.Sensor.TYPE_LIGHT).isNotEmpty()
                        "pressure" -> sensorManager.getSensorList(android.hardware.Sensor.TYPE_PRESSURE).isNotEmpty()
                        "stepcounter" -> sensorManager.getSensorList(android.hardware.Sensor.TYPE_STEP_COUNTER).isNotEmpty()
                        "stepdetector" -> sensorManager.getSensorList(android.hardware.Sensor.TYPE_STEP_DETECTOR).isNotEmpty()
                        else -> false
                    }
                    result.success(hasSensor)
                }
                "forceSensorDetection" -> {
                    // This method will try to force-activate sensors by temporarily registering listeners
                    // This can sometimes wake up sensors on problematic devices
                    
                    // Try to force-activate accelerometer
                    val accelerometer = sensorManager.getDefaultSensor(android.hardware.Sensor.TYPE_ACCELEROMETER)
                    if (accelerometer != null) {
                        val tempListener = object : android.hardware.SensorEventListener {
                            override fun onSensorChanged(event: android.hardware.SensorEvent?) {}
                            override fun onAccuracyChanged(sensor: android.hardware.Sensor?, accuracy: Int) {}
                        }
                        
                        sensorManager.registerListener(
                            tempListener,
                            accelerometer,
                            android.hardware.SensorManager.SENSOR_DELAY_NORMAL
                        )
                        android.os.Handler(android.os.Looper.getMainLooper()).postDelayed({
                            sensorManager.unregisterListener(tempListener)
                        }, 500)
                    }
                    
                    // Try to force-activate gyroscope
                    val gyroscope = sensorManager.getDefaultSensor(android.hardware.Sensor.TYPE_GYROSCOPE)
                    if (gyroscope != null) {
                        val tempListener = object : android.hardware.SensorEventListener {
                            override fun onSensorChanged(event: android.hardware.SensorEvent?) {}
                            override fun onAccuracyChanged(sensor: android.hardware.Sensor?, accuracy: Int) {}
                        }
                        
                        sensorManager.registerListener(
                            tempListener,
                            gyroscope,
                            android.hardware.SensorManager.SENSOR_DELAY_NORMAL
                        )
                        android.os.Handler(android.os.Looper.getMainLooper()).postDelayed({
                            sensorManager.unregisterListener(tempListener)
                        }, 500)
                    }
                    
                    // Try to force-activate magnetometer
                    val magnetometer = sensorManager.getDefaultSensor(android.hardware.Sensor.TYPE_MAGNETIC_FIELD)
                    if (magnetometer != null) {
                        val tempListener = object : android.hardware.SensorEventListener {
                            override fun onSensorChanged(event: android.hardware.SensorEvent?) {}
                            override fun onAccuracyChanged(sensor: android.hardware.Sensor?, accuracy: Int) {}
                        }
                        
                        sensorManager.registerListener(
                            tempListener,
                            magnetometer,
                            android.hardware.SensorManager.SENSOR_DELAY_NORMAL
                        )
                        android.os.Handler(android.os.Looper.getMainLooper()).postDelayed({
                            sensorManager.unregisterListener(tempListener)
                        }, 500)
                    }
                    
                    // Return success regardless - this is a best-effort attempt
                    result.success(true)
                }
                else -> result.notImplemented()
            }
        }
    }
    
    /**
     * Setup all event channels
     */
    fun setupEventChannels(flutterEngine: FlutterEngine) {
        // Basic sensors
        setupSensorChannel(flutterEngine, PROXIMITY_CHANNEL, proximitySensorHandler)
        setupSensorChannel(flutterEngine, LIGHT_CHANNEL, lightSensorHandler)
        setupSensorChannel(flutterEngine, PRESSURE_CHANNEL, pressureSensorHandler)
        
        // Motion sensors
        setupSensorChannel(flutterEngine, STEP_COUNTER_CHANNEL, stepCounterSensorHandler)
        setupSensorChannel(flutterEngine, STEP_DETECTOR_CHANNEL, stepDetectorSensorHandler)
        
        // Orientation sensors
        setupSensorChannel(flutterEngine, ROTATION_VECTOR_CHANNEL, rotationVectorSensorHandler)
        setupSensorChannel(flutterEngine, ORIENTATION_CHANNEL, orientationSensorHandler)
        setupSensorChannel(flutterEngine, GRAVITY_CHANNEL, gravitySensorHandler)
        setupSensorChannel(flutterEngine, LINEAR_ACCELERATION_CHANNEL, linearAccelerationSensorHandler)
        setupSensorChannel(flutterEngine, GAME_ROTATION_VECTOR_CHANNEL, gameRotationVectorSensorHandler)
        setupSensorChannel(flutterEngine, GEOMAGNETIC_ROTATION_VECTOR_CHANNEL, geomagneticRotationVectorSensorHandler)
        
        // Uncalibrated sensors
        setupSensorChannel(flutterEngine, ACCELEROMETER_UNCALIBRATED_CHANNEL, accelerometerUncalibratedSensorHandler)
        setupSensorChannel(flutterEngine, MAGNETIC_FIELD_UNCALIBRATED_CHANNEL, magneticFieldUncalibratedSensorHandler)
        setupSensorChannel(flutterEngine, GYROSCOPE_UNCALIBRATED_CHANNEL, gyroscopeUncalibratedSensorHandler)
        
        // Setup direct access channels for basic sensors
        setupDirectAccelerometerChannel(flutterEngine)
        setupDirectGyroscopeChannel(flutterEngine)
        setupDirectMagnetometerChannel(flutterEngine)
        
        // New sensors
        /*
        setupSensorChannel(flutterEngine, CAMERA_CHANNEL, cameraSensorHandler)
        setupSensorChannel(flutterEngine, MICROPHONE_CHANNEL, microphoneSensorHandler)
        setupSensorChannel(flutterEngine, GPS_CHANNEL, gpsSensorHandler)
        setupSensorChannel(flutterEngine, TOUCH_CHANNEL, touchSensorHandler)
        */
    }
    
    /**
     * Generic method to setup a sensor channel
     */
    private fun setupSensorChannel(flutterEngine: FlutterEngine, channelName: String, handler: EventChannel.StreamHandler) {
        EventChannel(flutterEngine.dartExecutor.binaryMessenger, channelName).setStreamHandler(handler)
    }
    
    /**
     * Setup direct access accelerometer channel
     */
    private fun setupDirectAccelerometerChannel(flutterEngine: FlutterEngine) {
        val accelerometer = sensorManager.getDefaultSensor(android.hardware.Sensor.TYPE_ACCELEROMETER)
        if (accelerometer != null) {
            EventChannel(flutterEngine.dartExecutor.binaryMessenger, DIRECT_ACCELEROMETER_CHANNEL).setStreamHandler(
                object : EventChannel.StreamHandler {
                    private var listener: android.hardware.SensorEventListener? = null
                    
                    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                        if (events == null) return
                        
                        listener = object : android.hardware.SensorEventListener {
                            override fun onSensorChanged(event: android.hardware.SensorEvent?) {
                                if (event?.sensor?.type == android.hardware.Sensor.TYPE_ACCELEROMETER) {
                                    val data = mapOf(
                                        "x" to event.values[0],
                                        "y" to event.values[1],
                                        "z" to event.values[2],
                                        "timestamp" to System.currentTimeMillis()
                                    )
                                    events.success(data)
                                }
                            }
                            
                            override fun onAccuracyChanged(sensor: android.hardware.Sensor?, accuracy: Int) {
                                // Do nothing
                            }
                        }
                        
                        sensorManager.registerListener(
                            listener,
                            accelerometer,
                            android.hardware.SensorManager.SENSOR_DELAY_NORMAL
                        )
                    }
                    
                    override fun onCancel(arguments: Any?) {
                        listener?.let { sensorManager.unregisterListener(it) }
                        listener = null
                    }
                }
            )
        }
    }
    
    /**
     * Setup direct access gyroscope channel
     */
    private fun setupDirectGyroscopeChannel(flutterEngine: FlutterEngine) {
        val gyroscope = sensorManager.getDefaultSensor(android.hardware.Sensor.TYPE_GYROSCOPE)
        if (gyroscope != null) {
            EventChannel(flutterEngine.dartExecutor.binaryMessenger, DIRECT_GYROSCOPE_CHANNEL).setStreamHandler(
                object : EventChannel.StreamHandler {
                    private var listener: android.hardware.SensorEventListener? = null
                    
                    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                        if (events == null) return
                        
                        listener = object : android.hardware.SensorEventListener {
                            override fun onSensorChanged(event: android.hardware.SensorEvent?) {
                                if (event?.sensor?.type == android.hardware.Sensor.TYPE_GYROSCOPE) {
                                    val data = mapOf(
                                        "x" to event.values[0],
                                        "y" to event.values[1],
                                        "z" to event.values[2],
                                        "timestamp" to System.currentTimeMillis()
                                    )
                                    events.success(data)
                                }
                            }
                            
                            override fun onAccuracyChanged(sensor: android.hardware.Sensor?, accuracy: Int) {
                                // Do nothing
                            }
                        }
                        
                        sensorManager.registerListener(
                            listener,
                            gyroscope,
                            android.hardware.SensorManager.SENSOR_DELAY_NORMAL
                        )
                    }
                    
                    override fun onCancel(arguments: Any?) {
                        listener?.let { sensorManager.unregisterListener(it) }
                        listener = null
                    }
                }
            )
        }
    }
    
    /**
     * Setup direct access magnetometer channel
     */
    private fun setupDirectMagnetometerChannel(flutterEngine: FlutterEngine) {
        val magnetometer = sensorManager.getDefaultSensor(android.hardware.Sensor.TYPE_MAGNETIC_FIELD)
        if (magnetometer != null) {
            EventChannel(flutterEngine.dartExecutor.binaryMessenger, DIRECT_MAGNETOMETER_CHANNEL).setStreamHandler(
                object : EventChannel.StreamHandler {
                    private var listener: android.hardware.SensorEventListener? = null
                    
                    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                        if (events == null) return
                        
                        listener = object : android.hardware.SensorEventListener {
                            override fun onSensorChanged(event: android.hardware.SensorEvent?) {
                                if (event?.sensor?.type == android.hardware.Sensor.TYPE_MAGNETIC_FIELD) {
                                    val data = mapOf(
                                        "x" to event.values[0],
                                        "y" to event.values[1],
                                        "z" to event.values[2],
                                        "timestamp" to System.currentTimeMillis()
                                    )
                                    events.success(data)
                                }
                            }
                            
                            override fun onAccuracyChanged(sensor: android.hardware.Sensor?, accuracy: Int) {
                                // Do nothing
                            }
                        }
                        
                        sensorManager.registerListener(
                            listener,
                            magnetometer,
                            android.hardware.SensorManager.SENSOR_DELAY_NORMAL
                        )
                    }
                    
                    override fun onCancel(arguments: Any?) {
                        listener?.let { sensorManager.unregisterListener(it) }
                        listener = null
                    }
                }
            )
        }
    }
    
    /**
     * Unregister all sensors
     */
    fun unregisterAllSensors() {
        sensorManager.unregisterListener(proximitySensorHandler)
        sensorManager.unregisterListener(lightSensorHandler)
        sensorManager.unregisterListener(pressureSensorHandler)
        sensorManager.unregisterListener(stepCounterSensorHandler)
        sensorManager.unregisterListener(stepDetectorSensorHandler)
        sensorManager.unregisterListener(rotationVectorSensorHandler)
        sensorManager.unregisterListener(orientationSensorHandler)
        sensorManager.unregisterListener(gravitySensorHandler)
        sensorManager.unregisterListener(linearAccelerationSensorHandler)
        sensorManager.unregisterListener(gameRotationVectorSensorHandler)
        sensorManager.unregisterListener(geomagneticRotationVectorSensorHandler)
        
        // Unregister uncalibrated sensors
        sensorManager.unregisterListener(accelerometerUncalibratedSensorHandler)
        sensorManager.unregisterListener(magneticFieldUncalibratedSensorHandler)
        sensorManager.unregisterListener(gyroscopeUncalibratedSensorHandler)
        
        // No need to unregister the new sensors as they don't implement SensorEventListener
        // They handle their own cleanup in onCancel
    }
    
    /**
     * Get permission manager
     */
    fun getPermissionManager(): PermissionManager {
        return permissionManager
    }
    
    /**
     * Get touch sensor handler
     */
    /*
    fun getTouchSensorHandler(): TouchSensorHandler {
        return touchSensorHandler
    }
    */
} 