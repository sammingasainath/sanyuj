package com.sensorapi.sensor_api

import android.content.Context
import android.hardware.Sensor
import android.hardware.SensorEvent
import android.hardware.SensorEventListener
import android.hardware.SensorManager
import android.util.Log
import io.flutter.plugin.common.EventChannel

/**
 * Base class for all sensor handlers
 */
abstract class BaseSensorHandler(
    private val context: Context,
    private val sensorType: Int,
    private val sensorName: String,
    private val channelName: String,
    protected val sensorManager: SensorManager
) : EventChannel.StreamHandler, SensorEventListener {

    companion object {
        const val TAG = "SensorAPI"
    }

    protected var eventSink: EventChannel.EventSink? = null
    protected var sensor: Sensor? = null
    
    init {
        sensor = sensorManager.getDefaultSensor(sensorType)
    }
    
    fun isAvailable(): Boolean = sensor != null
    
    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        if (sensor != null) {
            eventSink = events
            registerSensor()
        } else {
            events?.error("UNAVAILABLE", "$sensorName sensor not available", null)
        }
    }
    
    override fun onCancel(arguments: Any?) {
        if (sensor != null) {
            sensorManager.unregisterListener(this, sensor)
            Log.d(TAG, "$sensorName sensor unregistered")
        }
        eventSink = null
    }
    
    protected open fun registerSensor() {
        sensorManager.registerListener(
            this,
            sensor,
            SensorManager.SENSOR_DELAY_NORMAL
        )
    }
    
    override fun onAccuracyChanged(sensor: Sensor?, accuracy: Int) {
        val accuracyName = when(accuracy) {
            SensorManager.SENSOR_STATUS_ACCURACY_HIGH -> "HIGH"
            SensorManager.SENSOR_STATUS_ACCURACY_MEDIUM -> "MEDIUM"
            SensorManager.SENSOR_STATUS_ACCURACY_LOW -> "LOW"
            SensorManager.SENSOR_STATUS_UNRELIABLE -> "UNRELIABLE"
            else -> "UNKNOWN"
        }
        Log.d(TAG, "$sensorName accuracy changed: $accuracy ($accuracyName)")
    }
}

/**
 * Handler for proximity sensor
 */
class ProximitySensorHandler(
    context: Context,
    sensorManager: SensorManager
) : BaseSensorHandler(
    context,
    Sensor.TYPE_PROXIMITY,
    "Proximity",
    "com.sensorapi/proximity",
    sensorManager
) {
    override fun onSensorChanged(event: SensorEvent?) {
        if (event != null) {
            val distance = event.values[0]
            val isNear = distance < sensor?.maximumRange ?: 5.0f
            val data = mapOf(
                "distance" to distance,
                "isNear" to isNear,
                "timestamp" to System.currentTimeMillis()
            )
            eventSink?.success(data)
        }
    }
}

/**
 * Handler for light sensor
 */
class LightSensorHandler(
    context: Context,
    sensorManager: SensorManager
) : BaseSensorHandler(
    context,
    Sensor.TYPE_LIGHT,
    "Light",
    "com.sensorapi/light",
    sensorManager
) {
    override fun onSensorChanged(event: SensorEvent?) {
        if (event != null) {
            val illuminance = event.values[0]
            val data = mapOf(
                "illuminance" to illuminance,
                "timestamp" to System.currentTimeMillis()
            )
            eventSink?.success(data)
        }
    }
}

/**
 * Handler for pressure sensor
 */
class PressureSensorHandler(
    context: Context,
    sensorManager: SensorManager
) : BaseSensorHandler(
    context,
    Sensor.TYPE_PRESSURE,
    "Pressure",
    "com.sensorapi/pressure",
    sensorManager
) {
    override fun onSensorChanged(event: SensorEvent?) {
        if (event != null) {
            val pressure = event.values[0]
            val data = mapOf(
                "pressure" to pressure,
                "timestamp" to System.currentTimeMillis()
            )
            eventSink?.success(data)
        }
    }
}

/**
 * Handler for rotation vector sensor
 */
class RotationVectorSensorHandler(
    context: Context,
    sensorManager: SensorManager
) : BaseSensorHandler(
    context,
    Sensor.TYPE_ROTATION_VECTOR,
    "RotationVector",
    "com.sensorapi/rotation_vector",
    sensorManager
) {
    override fun onSensorChanged(event: SensorEvent?) {
        if (event != null) {
            val x = event.values[0]
            val y = event.values[1]
            val z = event.values[2]
            val w = if (event.values.size >= 4) event.values[3] else 0f
            
            val data = mapOf(
                "x" to x,
                "y" to y,
                "z" to z,
                "w" to w,
                "timestamp" to System.currentTimeMillis()
            )
            eventSink?.success(data)
        }
    }
}

/**
 * Handler for orientation sensor
 */
class OrientationSensorHandler(
    context: Context,
    sensorManager: SensorManager
) : BaseSensorHandler(
    context,
    Sensor.TYPE_ORIENTATION,
    "Orientation",
    "com.sensorapi/orientation",
    sensorManager
) {
    override fun onSensorChanged(event: SensorEvent?) {
        if (event != null) {
            val azimuth = event.values[0]
            val pitch = event.values[1]
            val roll = event.values[2]
            
            val data = mapOf(
                "azimuth" to azimuth,
                "pitch" to pitch,
                "roll" to roll,
                "timestamp" to System.currentTimeMillis()
            )
            eventSink?.success(data)
        }
    }
}

/**
 * Handler for gravity sensor
 */
class GravitySensorHandler(
    context: Context,
    sensorManager: SensorManager
) : BaseSensorHandler(
    context,
    Sensor.TYPE_GRAVITY,
    "Gravity",
    "com.sensorapi/gravity",
    sensorManager
) {
    override fun onSensorChanged(event: SensorEvent?) {
        if (event != null) {
            val x = event.values[0]
            val y = event.values[1]
            val z = event.values[2]
            
            val data = mapOf(
                "x" to x,
                "y" to y,
                "z" to z,
                "timestamp" to System.currentTimeMillis()
            )
            eventSink?.success(data)
        }
    }
}

/**
 * Handler for linear acceleration sensor
 */
class LinearAccelerationSensorHandler(
    context: Context,
    sensorManager: SensorManager
) : BaseSensorHandler(
    context,
    Sensor.TYPE_LINEAR_ACCELERATION,
    "LinearAcceleration",
    "com.sensorapi/linear_acceleration",
    sensorManager
) {
    override fun onSensorChanged(event: SensorEvent?) {
        if (event != null) {
            val x = event.values[0]
            val y = event.values[1]
            val z = event.values[2]
            
            val data = mapOf(
                "x" to x,
                "y" to y,
                "z" to z,
                "timestamp" to System.currentTimeMillis()
            )
            eventSink?.success(data)
        }
    }
}

/**
 * Handler for game rotation vector sensor
 */
class GameRotationVectorSensorHandler(
    context: Context,
    sensorManager: SensorManager
) : BaseSensorHandler(
    context,
    Sensor.TYPE_GAME_ROTATION_VECTOR,
    "GameRotationVector",
    "com.sensorapi/game_rotation_vector",
    sensorManager
) {
    override fun onSensorChanged(event: SensorEvent?) {
        if (event != null) {
            val x = event.values[0]
            val y = event.values[1]
            val z = event.values[2]
            val w = if (event.values.size >= 4) event.values[3] else 0f
            
            val data = mapOf(
                "x" to x,
                "y" to y,
                "z" to z,
                "w" to w,
                "timestamp" to System.currentTimeMillis()
            )
            eventSink?.success(data)
        }
    }
}

/**
 * Handler for geomagnetic rotation vector sensor
 */
class GeomagneticRotationVectorSensorHandler(
    context: Context,
    sensorManager: SensorManager
) : BaseSensorHandler(
    context,
    Sensor.TYPE_GEOMAGNETIC_ROTATION_VECTOR,
    "GeomagneticRotationVector",
    "com.sensorapi/geomagnetic_rotation_vector",
    sensorManager
) {
    override fun onSensorChanged(event: SensorEvent?) {
        if (event != null) {
            val x = event.values[0]
            val y = event.values[1]
            val z = event.values[2]
            val w = if (event.values.size >= 4) event.values[3] else 0f
            
            val data = mapOf(
                "x" to x,
                "y" to y,
                "z" to z,
                "w" to w,
                "timestamp" to System.currentTimeMillis()
            )
            eventSink?.success(data)
        }
    }
} 