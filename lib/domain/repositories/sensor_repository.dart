import 'package:sensor_api/domain/entities/sensor_data.dart';

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

  /// Get combined sensor data
  Future<CombinedSensorData> getCombinedSensorData();

  /// Get all available sensors
  Future<List<String>> getAvailableSensors();
}
