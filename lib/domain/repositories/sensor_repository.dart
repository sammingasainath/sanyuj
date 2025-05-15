import 'package:sensor_api/domain/entities/sensor_data.dart';
import 'package:sensor_api/domain/entities/additional_sensors.dart';

abstract class SensorRepository {
  /// Stream of accelerometer data
  Stream<AccelerometerData> getAccelerometerStream();

  /// Stream of gyroscope data
  Stream<GyroscopeData> getGyroscopeStream();

  /// Stream of magnetometer data
  Stream<MagnetometerData> getMagnetometerStream();

  /// Stream of proximity data
  Stream<ProximityData> getProximityStream();

  /// Stream of light sensor data
  Stream<LightSensorData> getLightStream();

  /// Stream of pressure data
  Stream<PressureData> getPressureStream();

  /// Stream of step counter data
  Stream<StepCounterData> getStepCounterStream();

  /// Stream of step detector data
  Stream<StepDetectorData> getStepDetectorStream();

  /// Stream of rotation vector data
  Stream<RotationVectorData> getRotationVectorStream();

  /// Stream of orientation data
  Stream<OrientationData> getOrientationStream();

  /// Stream of gravity data
  Stream<GravityData> getGravityStream();

  /// Stream of linear acceleration data
  Stream<LinearAccelerationData> getLinearAccelerationStream();

  /// Stream of game rotation vector data
  Stream<GameRotationVectorData> getGameRotationVectorStream();

  /// Stream of geomagnetic rotation vector data
  Stream<GeomagneticRotationVectorData> getGeomagneticRotationVectorStream();

  /// Get the latest accelerometer reading
  Future<AccelerometerData> getAccelerometerData();

  /// Get the latest gyroscope reading
  Future<GyroscopeData> getGyroscopeData();

  /// Get the latest magnetometer reading
  Future<MagnetometerData> getMagnetometerData();

  /// Get the latest proximity reading
  Future<ProximityData?> getProximityData();

  /// Get the latest light sensor reading
  Future<LightSensorData?> getLightData();

  /// Get the latest pressure reading
  Future<PressureData?> getPressureData();

  /// Get the latest step counter reading
  Future<StepCounterData?> getStepCounterData();

  /// Get the latest step detector reading
  Future<StepDetectorData?> getStepDetectorData();

  /// Get the latest rotation vector reading
  Future<RotationVectorData?> getRotationVectorData();

  /// Get the latest orientation reading
  Future<OrientationData?> getOrientationData();

  /// Get the latest gravity reading
  Future<GravityData?> getGravityData();

  /// Get the latest linear acceleration reading
  Future<LinearAccelerationData?> getLinearAccelerationData();

  /// Get the latest game rotation vector reading
  Future<GameRotationVectorData?> getGameRotationVectorData();

  /// Get the latest geomagnetic rotation vector reading
  Future<GeomagneticRotationVectorData?> getGeomagneticRotationVectorData();

  /// Get combined sensor data
  Future<CombinedSensorData> getCombinedSensorData();

  /// Get all available sensors
  Future<List<String>> getAvailableSensors();
}
