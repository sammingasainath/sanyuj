package com.sensorapi.sensor_api

import android.content.Context
import android.hardware.Sensor
import android.hardware.SensorEvent
import android.hardware.SensorManager
import android.util.Log

/**
 * Handler for accelerometer uncalibrated sensor
 */
class AccelerometerUncalibratedSensorHandler(
    context: Context,
    sensorManager: SensorManager
) : BaseSensorHandler(
    context,
    Sensor.TYPE_ACCELEROMETER_UNCALIBRATED,
    "AccelerometerUncalibrated",
    "com.sensorapi/accelerometer_uncalibrated",
    sensorManager
) {
    override fun onSensorChanged(event: SensorEvent?) {
        if (event != null) {
            val x = event.values[0]
            val y = event.values[1]
            val z = event.values[2]
            // Bias values are at indices 3, 4, 5
            val xBias = if (event.values.size > 3) event.values[3] else 0f
            val yBias = if (event.values.size > 4) event.values[4] else 0f
            val zBias = if (event.values.size > 5) event.values[5] else 0f
            
            val data = mapOf(
                "x" to x,
                "y" to y,
                "z" to z,
                "xBias" to xBias,
                "yBias" to yBias,
                "zBias" to zBias,
                "timestamp" to System.currentTimeMillis()
            )
            eventSink?.success(data)
        }
    }
}

/**
 * Handler for magnetic field uncalibrated sensor
 */
class MagneticFieldUncalibratedSensorHandler(
    context: Context,
    sensorManager: SensorManager
) : BaseSensorHandler(
    context,
    Sensor.TYPE_MAGNETIC_FIELD_UNCALIBRATED,
    "MagneticFieldUncalibrated",
    "com.sensorapi/magnetic_field_uncalibrated",
    sensorManager
) {
    override fun onSensorChanged(event: SensorEvent?) {
        if (event != null) {
            val x = event.values[0]
            val y = event.values[1]
            val z = event.values[2]
            // Bias values are at indices 3, 4, 5
            val xBias = if (event.values.size > 3) event.values[3] else 0f
            val yBias = if (event.values.size > 4) event.values[4] else 0f
            val zBias = if (event.values.size > 5) event.values[5] else 0f
            
            val data = mapOf(
                "x" to x,
                "y" to y,
                "z" to z,
                "xBias" to xBias,
                "yBias" to yBias,
                "zBias" to zBias,
                "timestamp" to System.currentTimeMillis()
            )
            eventSink?.success(data)
        }
    }
}

/**
 * Handler for gyroscope uncalibrated sensor
 */
class GyroscopeUncalibratedSensorHandler(
    context: Context,
    sensorManager: SensorManager
) : BaseSensorHandler(
    context,
    Sensor.TYPE_GYROSCOPE_UNCALIBRATED,
    "GyroscopeUncalibrated",
    "com.sensorapi/gyroscope_uncalibrated",
    sensorManager
) {
    override fun onSensorChanged(event: SensorEvent?) {
        if (event != null) {
            val x = event.values[0]
            val y = event.values[1]
            val z = event.values[2]
            // Drift values are at indices 3, 4, 5
            val xDrift = if (event.values.size > 3) event.values[3] else 0f
            val yDrift = if (event.values.size > 4) event.values[4] else 0f
            val zDrift = if (event.values.size > 5) event.values[5] else 0f
            
            val data = mapOf(
                "x" to x,
                "y" to y,
                "z" to z,
                "xDrift" to xDrift,
                "yDrift" to yDrift,
                "zDrift" to zDrift,
                "timestamp" to System.currentTimeMillis()
            )
            eventSink?.success(data)
        }
    }
} 