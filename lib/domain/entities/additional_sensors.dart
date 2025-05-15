import 'package:freezed_annotation/freezed_annotation.dart';
import 'sensor_data.dart';

part 'additional_sensors.freezed.dart';
part 'additional_sensors.g.dart';

/// Step counter sensor data
@freezed
abstract class StepCounterData with _$StepCounterData {
  const factory StepCounterData({
    required int steps,
    required DateTime timestamp,
    String? tenantId,
  }) = _StepCounterData;

  factory StepCounterData.fromJson(Map<String, dynamic> json) =>
      _$StepCounterDataFromJson(json);
}

/// Step detector sensor data
@freezed
abstract class StepDetectorData with _$StepDetectorData {
  const factory StepDetectorData({
    required bool detected,
    required DateTime timestamp,
    String? tenantId,
  }) = _StepDetectorData;

  factory StepDetectorData.fromJson(Map<String, dynamic> json) =>
      _$StepDetectorDataFromJson(json);
}

/// Rotation vector sensor data
@freezed
abstract class RotationVectorData with _$RotationVectorData {
  const factory RotationVectorData({
    required double x,
    required double y,
    required double z,
    required double w, // cos(θ/2), where θ is the rotation angle
    required DateTime timestamp,
    String? tenantId,
  }) = _RotationVectorData;

  factory RotationVectorData.fromJson(Map<String, dynamic> json) =>
      _$RotationVectorDataFromJson(json);
}

/// Orientation sensor data (azimuth, pitch, roll)
@freezed
abstract class OrientationData with _$OrientationData {
  const factory OrientationData({
    required double azimuth, // Z-axis rotation in degrees (0-359)
    required double pitch, // X-axis rotation in degrees (-180 to 180)
    required double roll, // Y-axis rotation in degrees (-90 to 90)
    required DateTime timestamp,
    String? tenantId,
  }) = _OrientationData;

  factory OrientationData.fromJson(Map<String, dynamic> json) =>
      _$OrientationDataFromJson(json);
}

/// Gravity sensor data
@freezed
abstract class GravityData with _$GravityData {
  const factory GravityData({
    required double x,
    required double y,
    required double z,
    required DateTime timestamp,
    String? tenantId,
  }) = _GravityData;

  factory GravityData.fromJson(Map<String, dynamic> json) =>
      _$GravityDataFromJson(json);
}

/// Linear acceleration sensor data (acceleration minus gravity)
@freezed
abstract class LinearAccelerationData with _$LinearAccelerationData {
  const factory LinearAccelerationData({
    required double x,
    required double y,
    required double z,
    required DateTime timestamp,
    String? tenantId,
  }) = _LinearAccelerationData;

  factory LinearAccelerationData.fromJson(Map<String, dynamic> json) =>
      _$LinearAccelerationDataFromJson(json);
}

/// Device orientation sensor data
@freezed
abstract class DeviceOrientationData with _$DeviceOrientationData {
  const factory DeviceOrientationData({
    required int
    orientation, // 0: portrait, 1: landscape left, 2: portrait upside down, 3: landscape right
    required DateTime timestamp,
    String? tenantId,
  }) = _DeviceOrientationData;

  factory DeviceOrientationData.fromJson(Map<String, dynamic> json) =>
      _$DeviceOrientationDataFromJson(json);
}

/// Game rotation vector sensor data
@freezed
abstract class GameRotationVectorData with _$GameRotationVectorData {
  const factory GameRotationVectorData({
    required double x,
    required double y,
    required double z,
    required double w,
    required DateTime timestamp,
    String? tenantId,
  }) = _GameRotationVectorData;

  factory GameRotationVectorData.fromJson(Map<String, dynamic> json) =>
      _$GameRotationVectorDataFromJson(json);
}

/// Geomagnetic rotation vector sensor data
@freezed
abstract class GeomagneticRotationVectorData
    with _$GeomagneticRotationVectorData {
  const factory GeomagneticRotationVectorData({
    required double x,
    required double y,
    required double z,
    required double w,
    required DateTime timestamp,
    String? tenantId,
  }) = _GeomagneticRotationVectorData;

  factory GeomagneticRotationVectorData.fromJson(Map<String, dynamic> json) =>
      _$GeomagneticRotationVectorDataFromJson(json);
}

/// Significant Motion sensor data
@freezed
abstract class SignificantMotionData with _$SignificantMotionData {
  const factory SignificantMotionData({
    required bool detected,
    required DateTime timestamp,
    String? tenantId,
  }) = _SignificantMotionData;

  factory SignificantMotionData.fromJson(Map<String, dynamic> json) =>
      _$SignificantMotionDataFromJson(json);
}

/// Stationary Detector sensor data
@freezed
abstract class StationaryDetectData with _$StationaryDetectData {
  const factory StationaryDetectData({
    required bool isStationary,
    required DateTime timestamp,
    String? tenantId,
  }) = _StationaryDetectData;

  factory StationaryDetectData.fromJson(Map<String, dynamic> json) =>
      _$StationaryDetectDataFromJson(json);
}

/// Wake Gesture sensor data
@freezed
abstract class WakeGestureData with _$WakeGestureData {
  const factory WakeGestureData({
    required bool detected,
    required DateTime timestamp,
    String? tenantId,
  }) = _WakeGestureData;

  factory WakeGestureData.fromJson(Map<String, dynamic> json) =>
      _$WakeGestureDataFromJson(json);
}

/// Pickup Detect sensor data
@freezed
abstract class PickupDetectData with _$PickupDetectData {
  const factory PickupDetectData({
    required bool detected,
    required DateTime timestamp,
    String? tenantId,
  }) = _PickupDetectData;

  factory PickupDetectData.fromJson(Map<String, dynamic> json) =>
      _$PickupDetectDataFromJson(json);
}

/// Accelerometer Uncalibrated sensor data
@freezed
abstract class AccelerometerUncalibratedData
    with _$AccelerometerUncalibratedData {
  const factory AccelerometerUncalibratedData({
    required double x,
    required double y,
    required double z,
    required double xBias,
    required double yBias,
    required double zBias,
    required DateTime timestamp,
    String? tenantId,
  }) = _AccelerometerUncalibratedData;

  factory AccelerometerUncalibratedData.fromJson(Map<String, dynamic> json) =>
      _$AccelerometerUncalibratedDataFromJson(json);
}

/// Magnetic Field Uncalibrated sensor data
@freezed
abstract class MagneticFieldUncalibratedData
    with _$MagneticFieldUncalibratedData {
  const factory MagneticFieldUncalibratedData({
    required double x,
    required double y,
    required double z,
    required double xBias,
    required double yBias,
    required double zBias,
    required DateTime timestamp,
    String? tenantId,
  }) = _MagneticFieldUncalibratedData;

  factory MagneticFieldUncalibratedData.fromJson(Map<String, dynamic> json) =>
      _$MagneticFieldUncalibratedDataFromJson(json);
}

/// Gyroscope Uncalibrated sensor data
@freezed
abstract class GyroscopeUncalibratedData with _$GyroscopeUncalibratedData {
  const factory GyroscopeUncalibratedData({
    required double x,
    required double y,
    required double z,
    required double xDrift,
    required double yDrift,
    required double zDrift,
    required DateTime timestamp,
    String? tenantId,
  }) = _GyroscopeUncalibratedData;

  factory GyroscopeUncalibratedData.fromJson(Map<String, dynamic> json) =>
      _$GyroscopeUncalibratedDataFromJson(json);
}

/// Enhanced combined sensor data with additional sensors
@freezed
abstract class EnhancedSensorData with _$EnhancedSensorData {
  const factory EnhancedSensorData({
    // Basic sensors
    required DateTime timestamp,
    String? tenantId,
    // Motion sensors
    AccelerometerData? accelerometer,
    GyroscopeData? gyroscope,
    MagnetometerData? magnetometer,
    // Environmental sensors
    ProximityData? proximity,
    LightSensorData? light,
    PressureData? pressure,
    // Activity sensors
    StepCounterData? stepCounter,
    StepDetectorData? stepDetector,
    // Position sensors
    RotationVectorData? rotationVector,
    OrientationData? orientation,
    GravityData? gravity,
    LinearAccelerationData? linearAcceleration,
    DeviceOrientationData? deviceOrientation,
    GameRotationVectorData? gameRotationVector,
    GeomagneticRotationVectorData? geomagneticRotationVector,
    // New sensors
    SignificantMotionData? significantMotion,
    StationaryDetectData? stationaryDetect,
    WakeGestureData? wakeGesture,
    PickupDetectData? pickupDetect,
    AccelerometerUncalibratedData? accelerometerUncalibrated,
    MagneticFieldUncalibratedData? magneticFieldUncalibrated,
    GyroscopeUncalibratedData? gyroscopeUncalibrated,
  }) = _EnhancedSensorData;

  factory EnhancedSensorData.fromJson(Map<String, dynamic> json) =>
      _$EnhancedSensorDataFromJson(json);

  /// Convert to a basic CombinedSensorData (with only the basic sensors)
  factory EnhancedSensorData.fromCombinedSensorData(
    CombinedSensorData combinedData,
  ) {
    return EnhancedSensorData(
      // Basic sensors
      accelerometer: combinedData.accelerometer,
      gyroscope: combinedData.gyroscope,
      magnetometer: combinedData.magnetometer,
      proximity: combinedData.proximity,
      light: combinedData.light,
      pressure: combinedData.pressure,

      // Additional sensors
      stepCounter: combinedData.stepCounter,
      stepDetector: combinedData.stepDetector,
      rotationVector: combinedData.rotationVector,
      orientation: combinedData.orientation,
      gravity: combinedData.gravity,
      linearAcceleration: combinedData.linearAcceleration,
      gameRotationVector: combinedData.gameRotationVector,
      geomagneticRotationVector: combinedData.geomagneticRotationVector,

      // New sensors
      significantMotion: combinedData.significantMotion,
      stationaryDetect: combinedData.stationaryDetect,
      wakeGesture: combinedData.wakeGesture,
      pickupDetect: combinedData.pickupDetect,
      accelerometerUncalibrated: combinedData.accelerometerUncalibrated,
      magneticFieldUncalibrated: combinedData.magneticFieldUncalibrated,
      gyroscopeUncalibrated: combinedData.gyroscopeUncalibrated,

      timestamp: combinedData.timestamp,
      tenantId: combinedData.tenantId,
    );
  }
}

/// Extension to convert EnhancedSensorData to CombinedSensorData
extension EnhancedSensorDataConverter on EnhancedSensorData {
  CombinedSensorData toCombinedSensorData() {
    return CombinedSensorData(
      // Basic sensors
      accelerometer: accelerometer,
      gyroscope: gyroscope,
      magnetometer: magnetometer,
      proximity: proximity,
      light: light,
      pressure: pressure,

      // Additional sensors
      stepCounter: stepCounter,
      stepDetector: stepDetector,
      rotationVector: rotationVector,
      orientation: orientation,
      gravity: gravity,
      linearAcceleration: linearAcceleration,
      gameRotationVector: gameRotationVector,
      geomagneticRotationVector: geomagneticRotationVector,

      // New sensors
      significantMotion: significantMotion,
      stationaryDetect: stationaryDetect,
      wakeGesture: wakeGesture,
      pickupDetect: pickupDetect,
      accelerometerUncalibrated: accelerometerUncalibrated,
      magneticFieldUncalibrated: magneticFieldUncalibrated,
      gyroscopeUncalibrated: gyroscopeUncalibrated,

      timestamp: timestamp,
      tenantId: tenantId,
    );
  }
}
