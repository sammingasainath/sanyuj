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
                    result.success(sensors)
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
    }
    
    /**
     * Generic method to setup a sensor channel
     */
    private fun setupSensorChannel(flutterEngine: FlutterEngine, channelName: String, handler: EventChannel.StreamHandler) {
        EventChannel(flutterEngine.dartExecutor.binaryMessenger, channelName).setStreamHandler(handler)
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
    }
    
    /**
     * Get permission manager
     */
    fun getPermissionManager(): PermissionManager {
        return permissionManager
    }
} 