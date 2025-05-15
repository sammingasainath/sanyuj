package com.sensorapi.sensor_api

import android.Manifest
import android.app.Activity
import android.content.Context
import android.content.pm.PackageManager
import android.os.Build
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat

/**
 * Manages permission requests for sensors
 */
class PermissionManager(private val context: Context) {
    
    companion object {
        const val ACTIVITY_RECOGNITION_PERMISSION_CODE = 100
    }
    
    /**
     * Checks if activity recognition permission is granted
     */
    fun hasActivityRecognitionPermission(): Boolean {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            ContextCompat.checkSelfPermission(
                context,
                Manifest.permission.ACTIVITY_RECOGNITION
            ) == PackageManager.PERMISSION_GRANTED
        } else {
            // For Android 9 and below, no permission is required
            true
        }
    }
    
    /**
     * Requests activity recognition permission
     */
    fun requestActivityRecognitionPermission(activity: Activity) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            if (!hasActivityRecognitionPermission()) {
                ActivityCompat.requestPermissions(
                    activity,
                    arrayOf(Manifest.permission.ACTIVITY_RECOGNITION),
                    ACTIVITY_RECOGNITION_PERMISSION_CODE
                )
            }
        }
    }
} 