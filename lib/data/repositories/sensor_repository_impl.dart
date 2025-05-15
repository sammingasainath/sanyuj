import 'package:sensor_api/data/datasources/sensor_datasource.dart';
import 'package:sensor_api/domain/entities/sensor_data.dart';
import 'package:sensor_api/domain/repositories/sensor_repository.dart';

class SensorRepositoryImpl implements SensorRepository {
  final SensorDataSource dataSource;

  SensorRepositoryImpl(this.dataSource);

  @override
  Stream<AccelerometerData> getAccelerometerStream() {
    return dataSource.getAccelerometerStream();
  }

  @override
  Stream<GyroscopeData> getGyroscopeStream() {
    return dataSource.getGyroscopeStream();
  }

  @override
  Stream<MagnetometerData> getMagnetometerStream() {
    return dataSource.getMagnetometerStream();
  }

  @override
  Stream<ProximityData> getProximityStream() {
    return dataSource.getProximityStream();
  }

  @override
  Stream<LightSensorData> getLightStream() {
    return dataSource.getLightStream();
  }

  @override
  Stream<PressureData> getPressureStream() {
    return dataSource.getPressureStream();
  }

  @override
  Future<AccelerometerData> getAccelerometerData() {
    return dataSource.getAccelerometerData();
  }

  @override
  Future<GyroscopeData> getGyroscopeData() {
    return dataSource.getGyroscopeData();
  }

  @override
  Future<MagnetometerData> getMagnetometerData() {
    return dataSource.getMagnetometerData();
  }

  @override
  Future<ProximityData?> getProximityData() {
    return dataSource.getProximityData();
  }

  @override
  Future<LightSensorData?> getLightData() {
    return dataSource.getLightData();
  }

  @override
  Future<PressureData?> getPressureData() {
    return dataSource.getPressureData();
  }

  @override
  Future<CombinedSensorData> getCombinedSensorData() {
    return dataSource.getCombinedSensorData();
  }

  @override
  Future<List<String>> getAvailableSensors() {
    return dataSource.getAvailableSensors();
  }
}
