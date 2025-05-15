import 'package:sensor_api/data/datasources/sensor_datasource.dart';
import 'package:sensor_api/domain/entities/sensor_data.dart';
import 'package:sensor_api/domain/entities/additional_sensors.dart';
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
  Stream<StepCounterData> getStepCounterStream() {
    return dataSource.getStepCounterStream();
  }

  @override
  Stream<StepDetectorData> getStepDetectorStream() {
    return dataSource.getStepDetectorStream();
  }

  @override
  Stream<RotationVectorData> getRotationVectorStream() {
    return dataSource.getRotationVectorStream();
  }

  @override
  Stream<OrientationData> getOrientationStream() {
    return dataSource.getOrientationStream();
  }

  @override
  Stream<GravityData> getGravityStream() {
    return dataSource.getGravityStream();
  }

  @override
  Stream<LinearAccelerationData> getLinearAccelerationStream() {
    return dataSource.getLinearAccelerationStream();
  }

  @override
  Stream<GameRotationVectorData> getGameRotationVectorStream() {
    return dataSource.getGameRotationVectorStream();
  }

  @override
  Stream<GeomagneticRotationVectorData> getGeomagneticRotationVectorStream() {
    return dataSource.getGeomagneticRotationVectorStream();
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
  Future<StepCounterData?> getStepCounterData() {
    return dataSource.getStepCounterData();
  }

  @override
  Future<StepDetectorData?> getStepDetectorData() {
    return dataSource.getStepDetectorData();
  }

  @override
  Future<RotationVectorData?> getRotationVectorData() {
    return dataSource.getRotationVectorData();
  }

  @override
  Future<OrientationData?> getOrientationData() {
    return dataSource.getOrientationData();
  }

  @override
  Future<GravityData?> getGravityData() {
    return dataSource.getGravityData();
  }

  @override
  Future<LinearAccelerationData?> getLinearAccelerationData() {
    return dataSource.getLinearAccelerationData();
  }

  @override
  Future<GameRotationVectorData?> getGameRotationVectorData() {
    return dataSource.getGameRotationVectorData();
  }

  @override
  Future<GeomagneticRotationVectorData?> getGeomagneticRotationVectorData() {
    return dataSource.getGeomagneticRotationVectorData();
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
