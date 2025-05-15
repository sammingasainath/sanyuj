import 'package:sensor_api/data/datasources/sensor_datasource.dart';
import 'package:sensor_api/domain/entities/sensor_data.dart';
import 'package:sensor_api/domain/entities/additional_sensors.dart';
import 'package:sensor_api/domain/repositories/sensor_repository.dart';

class SensorRepositoryImpl implements SensorRepository {
  final SensorDataSource _dataSource;

  SensorRepositoryImpl(this._dataSource);

  @override
  Stream<AccelerometerData> getAccelerometerStream() {
    return _dataSource.getAccelerometerStream();
  }

  @override
  Stream<GyroscopeData> getGyroscopeStream() {
    return _dataSource.getGyroscopeStream();
  }

  @override
  Stream<MagnetometerData> getMagnetometerStream() {
    return _dataSource.getMagnetometerStream();
  }

  @override
  Stream<ProximityData> getProximityStream() {
    return _dataSource.getProximityStream();
  }

  @override
  Stream<LightSensorData> getLightStream() {
    return _dataSource.getLightStream();
  }

  @override
  Stream<PressureData> getPressureStream() {
    return _dataSource.getPressureStream();
  }

  @override
  Stream<StepCounterData> getStepCounterStream() {
    return _dataSource.getStepCounterStream();
  }

  @override
  Stream<StepDetectorData> getStepDetectorStream() {
    return _dataSource.getStepDetectorStream();
  }

  @override
  Stream<RotationVectorData> getRotationVectorStream() {
    return _dataSource.getRotationVectorStream();
  }

  @override
  Stream<OrientationData> getOrientationStream() {
    return _dataSource.getOrientationStream();
  }

  @override
  Stream<GravityData> getGravityStream() {
    return _dataSource.getGravityStream();
  }

  @override
  Stream<LinearAccelerationData> getLinearAccelerationStream() {
    return _dataSource.getLinearAccelerationStream();
  }

  @override
  Stream<GameRotationVectorData> getGameRotationVectorStream() {
    return _dataSource.getGameRotationVectorStream();
  }

  @override
  Stream<GeomagneticRotationVectorData> getGeomagneticRotationVectorStream() {
    return _dataSource.getGeomagneticRotationVectorStream();
  }

  @override
  Stream<SignificantMotionData> getSignificantMotionStream() {
    return _dataSource.getSignificantMotionStream();
  }

  @override
  Stream<StationaryDetectData> getStationaryDetectStream() {
    return _dataSource.getStationaryDetectStream();
  }

  @override
  Stream<WakeGestureData> getWakeGestureStream() {
    return _dataSource.getWakeGestureStream();
  }

  @override
  Stream<PickupDetectData> getPickupDetectStream() {
    return _dataSource.getPickupDetectStream();
  }

  @override
  Stream<AccelerometerUncalibratedData> getAccelerometerUncalibratedStream() {
    return _dataSource.getAccelerometerUncalibratedStream();
  }

  @override
  Stream<MagneticFieldUncalibratedData> getMagneticFieldUncalibratedStream() {
    return _dataSource.getMagneticFieldUncalibratedStream();
  }

  @override
  Stream<GyroscopeUncalibratedData> getGyroscopeUncalibratedStream() {
    return _dataSource.getGyroscopeUncalibratedStream();
  }

  @override
  Future<AccelerometerData> getAccelerometerData() {
    return _dataSource.getAccelerometerData();
  }

  @override
  Future<GyroscopeData> getGyroscopeData() {
    return _dataSource.getGyroscopeData();
  }

  @override
  Future<MagnetometerData> getMagnetometerData() {
    return _dataSource.getMagnetometerData();
  }

  @override
  Future<ProximityData?> getProximityData() {
    return _dataSource.getProximityData();
  }

  @override
  Future<LightSensorData?> getLightData() {
    return _dataSource.getLightData();
  }

  @override
  Future<PressureData?> getPressureData() {
    return _dataSource.getPressureData();
  }

  @override
  Future<StepCounterData?> getStepCounterData() {
    return _dataSource.getStepCounterData();
  }

  @override
  Future<StepDetectorData?> getStepDetectorData() {
    return _dataSource.getStepDetectorData();
  }

  @override
  Future<RotationVectorData?> getRotationVectorData() {
    return _dataSource.getRotationVectorData();
  }

  @override
  Future<OrientationData?> getOrientationData() {
    return _dataSource.getOrientationData();
  }

  @override
  Future<GravityData?> getGravityData() {
    return _dataSource.getGravityData();
  }

  @override
  Future<LinearAccelerationData?> getLinearAccelerationData() {
    return _dataSource.getLinearAccelerationData();
  }

  @override
  Future<GameRotationVectorData?> getGameRotationVectorData() {
    return _dataSource.getGameRotationVectorData();
  }

  @override
  Future<GeomagneticRotationVectorData?> getGeomagneticRotationVectorData() {
    return _dataSource.getGeomagneticRotationVectorData();
  }

  @override
  Future<SignificantMotionData?> getSignificantMotionData() {
    return _dataSource.getSignificantMotionData();
  }

  @override
  Future<StationaryDetectData?> getStationaryDetectData() {
    return _dataSource.getStationaryDetectData();
  }

  @override
  Future<WakeGestureData?> getWakeGestureData() {
    return _dataSource.getWakeGestureData();
  }

  @override
  Future<PickupDetectData?> getPickupDetectData() {
    return _dataSource.getPickupDetectData();
  }

  @override
  Future<AccelerometerUncalibratedData?> getAccelerometerUncalibratedData() {
    return _dataSource.getAccelerometerUncalibratedData();
  }

  @override
  Future<MagneticFieldUncalibratedData?> getMagneticFieldUncalibratedData() {
    return _dataSource.getMagneticFieldUncalibratedData();
  }

  @override
  Future<GyroscopeUncalibratedData?> getGyroscopeUncalibratedData() {
    return _dataSource.getGyroscopeUncalibratedData();
  }

  @override
  Future<CombinedSensorData> getCombinedSensorData() {
    return _dataSource.getCombinedSensorData();
  }

  @override
  Future<List<String>> getAvailableSensors() {
    return _dataSource.getAvailableSensors();
  }
}
