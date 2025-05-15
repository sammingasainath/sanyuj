package com.sensorapi.sensor_api

import android.Manifest
import android.content.pm.PackageManager
import android.os.Build
import android.os.Bundle
import android.util.Log
import androidx.core.content.ContextCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    private val TAG = "SensorAPI"
    
    // Unified sensor management - initialize immediately to avoid lifecycle issues
    private val sensorApiManager by lazy { SensorApiManager(this) }
    
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        
        // Check and request activity recognition permission if needed
        checkAndRequestPermissions()
    }
    
    private fun checkAndRequestPermissions() {
        val permissionManager = sensorApiManager.getPermissionManager()
        if (!permissionManager.hasActivityRecognitionPermission()) {
            permissionManager.requestActivityRecognitionPermission(this)
        }
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        // Register Flutter plugins
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        
        // Setup method channel
        sensorApiManager.setupMethodChannel(flutterEngine)
        
        // Setup all event channels
        sensorApiManager.setupEventChannels(flutterEngine)
    }
    
    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<out String>,
        grantResults: IntArray
    ) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        
        when (requestCode) {
            PermissionManager.ACTIVITY_RECOGNITION_PERMISSION_CODE -> {
                if (grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    // Permission granted - the event channels will handle this automatically
                    Log.d(TAG, "Activity recognition permission granted")
                } else {
                    Log.w(TAG, "Activity recognition permission denied")
                }
            }
        }
    }
    
    override fun onPause() {
        super.onPause()
        
        // All onCancel handlers in the individual sensors will handle unregistering
        // No need to explicitly unregister here as that would bypass the individual
        // sensor handler logic, which includes wake lock handling
    }
    
    override fun onDestroy() {
        super.onDestroy()
        
        // Ensure all sensors are unregistered and resources released
        sensorApiManager.unregisterAllSensors()
    }
}
