import 'package:freezed_annotation/freezed_annotation.dart';
import 'additional_sensors.dart';

part 'sensor_data.freezed.dart';
part 'sensor_data.g.dart';

@freezed
abstract class SensorData with _$SensorData {
  const factory SensorData({
    required String sensorName,
    required String sensorType,
    required List<double> values,
    required DateTime timestamp,
    String? tenantId,
  }) = _SensorData;

  factory SensorData.fromJson(Map<String, dynamic> json) =>
      _$SensorDataFromJson(json);
}

@freezed
abstract class AccelerometerData with _$AccelerometerData {
  const factory AccelerometerData({
    required double x,
    required double y,
    required double z,
    required DateTime timestamp,
    String? tenantId,
  }) = _AccelerometerData;

  factory AccelerometerData.fromJson(Map<String, dynamic> json) =>
      _$AccelerometerDataFromJson(json);
}

@freezed
abstract class GyroscopeData with _$GyroscopeData {
  const factory GyroscopeData({
    required double x,
    required double y,
    required double z,
    required DateTime timestamp,
    String? tenantId,
  }) = _GyroscopeData;

  factory GyroscopeData.fromJson(Map<String, dynamic> json) =>
      _$GyroscopeDataFromJson(json);
}

@freezed
abstract class MagnetometerData with _$MagnetometerData {
  const factory MagnetometerData({
    required double x,
    required double y,
    required double z,
    required DateTime timestamp,
    String? tenantId,
  }) = _MagnetometerData;

  factory MagnetometerData.fromJson(Map<String, dynamic> json) =>
      _$MagnetometerDataFromJson(json);
}

@freezed
abstract class ProximityData with _$ProximityData {
  const factory ProximityData({
    required double distance,
    required bool isNear,
    required DateTime timestamp,
    String? tenantId,
  }) = _ProximityData;

  factory ProximityData.fromJson(Map<String, dynamic> json) =>
      _$ProximityDataFromJson(json);
}

@freezed
abstract class LightSensorData with _$LightSensorData {
  const factory LightSensorData({
    required double illuminance,
    required DateTime timestamp,
    String? tenantId,
  }) = _LightSensorData;

  factory LightSensorData.fromJson(Map<String, dynamic> json) =>
      _$LightSensorDataFromJson(json);
}

@freezed
abstract class PressureData with _$PressureData {
  const factory PressureData({
    required double pressure,
    required DateTime timestamp,
    String? tenantId,
  }) = _PressureData;

  factory PressureData.fromJson(Map<String, dynamic> json) =>
      _$PressureDataFromJson(json);
}

@freezed
abstract class CombinedSensorData with _$CombinedSensorData {
  const factory CombinedSensorData({
    // Basic sensors
    AccelerometerData? accelerometer,
    GyroscopeData? gyroscope,
    MagnetometerData? magnetometer,
    ProximityData? proximity,
    LightSensorData? light,
    PressureData? pressure,

    // Additional sensors
    StepCounterData? stepCounter,
    StepDetectorData? stepDetector,
    RotationVectorData? rotationVector,
    OrientationData? orientation,
    GravityData? gravity,
    LinearAccelerationData? linearAcceleration,
    GameRotationVectorData? gameRotationVector,
    GeomagneticRotationVectorData? geomagneticRotationVector,

    required DateTime timestamp,
    String? tenantId,
  }) = _CombinedSensorData;

  factory CombinedSensorData.fromJson(Map<String, dynamic> json) =>
      _$CombinedSensorDataFromJson(json);
}

@freezed
abstract class SensorApiResponse with _$SensorApiResponse {
  const factory SensorApiResponse({
    required bool success,
    required String message,
    dynamic data,
  }) = _SensorApiResponse;

  factory SensorApiResponse.fromJson(Map<String, dynamic> json) =>
      _$SensorApiResponseFromJson(json);
}
