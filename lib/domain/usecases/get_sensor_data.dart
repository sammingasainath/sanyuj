import 'package:sensor_api/domain/entities/sensor_data.dart';
import 'package:sensor_api/domain/entities/additional_sensors.dart';
import 'package:sensor_api/domain/repositories/sensor_repository.dart';

class GetAccelerometerDataUseCase {
  final SensorRepository repository;

  GetAccelerometerDataUseCase(this.repository);

  /// Get the latest accelerometer reading
  Future<AccelerometerData> call() {
    return repository.getAccelerometerData();
  }
}

class GetGyroscopeDataUseCase {
  final SensorRepository repository;

  GetGyroscopeDataUseCase(this.repository);

  /// Get the latest gyroscope reading
  Future<GyroscopeData> call() {
    return repository.getGyroscopeData();
  }
}

class GetMagnetometerDataUseCase {
  final SensorRepository repository;

  GetMagnetometerDataUseCase(this.repository);

  /// Get the latest magnetometer reading
  Future<MagnetometerData> call() {
    return repository.getMagnetometerData();
  }
}

class GetProximityDataUseCase {
  final SensorRepository repository;

  GetProximityDataUseCase(this.repository);

  /// Get the latest proximity reading
  Future<ProximityData?> call() {
    return repository.getProximityData();
  }
}

class GetLightDataUseCase {
  final SensorRepository repository;

  GetLightDataUseCase(this.repository);

  /// Get the latest light sensor reading
  Future<LightSensorData?> call() {
    return repository.getLightData();
  }
}

class GetPressureDataUseCase {
  final SensorRepository repository;

  GetPressureDataUseCase(this.repository);

  /// Get the latest pressure reading
  Future<PressureData?> call() {
    return repository.getPressureData();
  }
}

class GetCombinedSensorDataUseCase {
  final SensorRepository repository;

  GetCombinedSensorDataUseCase(this.repository);

  /// Get combined sensor data
  Future<CombinedSensorData> call() {
    return repository.getCombinedSensorData();
  }
}

class GetAccelerometerStreamUseCase {
  final SensorRepository repository;

  GetAccelerometerStreamUseCase(this.repository);

  /// Get stream of accelerometer data
  Stream<AccelerometerData> call() {
    return repository.getAccelerometerStream();
  }
}

class GetGyroscopeStreamUseCase {
  final SensorRepository repository;

  GetGyroscopeStreamUseCase(this.repository);

  /// Get stream of gyroscope data
  Stream<GyroscopeData> call() {
    return repository.getGyroscopeStream();
  }
}

class GetMagnetometerStreamUseCase {
  final SensorRepository repository;

  GetMagnetometerStreamUseCase(this.repository);

  /// Get stream of magnetometer data
  Stream<MagnetometerData> call() {
    return repository.getMagnetometerStream();
  }
}

class GetProximityStreamUseCase {
  final SensorRepository repository;

  GetProximityStreamUseCase(this.repository);

  /// Get stream of proximity data
  Stream<ProximityData> call() {
    return repository.getProximityStream();
  }
}

class GetLightStreamUseCase {
  final SensorRepository repository;

  GetLightStreamUseCase(this.repository);

  /// Get stream of light sensor data
  Stream<LightSensorData> call() {
    return repository.getLightStream();
  }
}

class GetPressureStreamUseCase {
  final SensorRepository repository;

  GetPressureStreamUseCase(this.repository);

  /// Get stream of pressure data
  Stream<PressureData> call() {
    return repository.getPressureStream();
  }
}

class GetAvailableSensorsUseCase {
  final SensorRepository repository;

  GetAvailableSensorsUseCase(this.repository);

  /// Get all available sensors
  Future<List<String>> call() {
    return repository.getAvailableSensors();
  }
}

// Additional sensor use cases

class GetStepCounterStreamUseCase {
  final SensorRepository repository;

  GetStepCounterStreamUseCase(this.repository);

  /// Get stream of step counter data
  Stream<StepCounterData> call() {
    return repository.getStepCounterStream();
  }
}

class GetStepDetectorStreamUseCase {
  final SensorRepository repository;

  GetStepDetectorStreamUseCase(this.repository);

  /// Get stream of step detector data
  Stream<StepDetectorData> call() {
    return repository.getStepDetectorStream();
  }
}

class GetRotationVectorStreamUseCase {
  final SensorRepository repository;

  GetRotationVectorStreamUseCase(this.repository);

  /// Get stream of rotation vector data
  Stream<RotationVectorData> call() {
    return repository.getRotationVectorStream();
  }
}

class GetOrientationStreamUseCase {
  final SensorRepository repository;

  GetOrientationStreamUseCase(this.repository);

  /// Get stream of orientation data
  Stream<OrientationData> call() {
    return repository.getOrientationStream();
  }
}

class GetGravityStreamUseCase {
  final SensorRepository repository;

  GetGravityStreamUseCase(this.repository);

  /// Get stream of gravity data
  Stream<GravityData> call() {
    return repository.getGravityStream();
  }
}

class GetLinearAccelerationStreamUseCase {
  final SensorRepository repository;

  GetLinearAccelerationStreamUseCase(this.repository);

  /// Get stream of linear acceleration data
  Stream<LinearAccelerationData> call() {
    return repository.getLinearAccelerationStream();
  }
}

// Single-point data use cases for additional sensors
class GetStepCounterDataUseCase {
  final SensorRepository repository;

  GetStepCounterDataUseCase(this.repository);

  /// Get the latest step counter reading
  Future<StepCounterData?> call() {
    return repository.getStepCounterData();
  }
}

class GetStepDetectorDataUseCase {
  final SensorRepository repository;

  GetStepDetectorDataUseCase(this.repository);

  /// Get the latest step detector reading
  Future<StepDetectorData?> call() {
    return repository.getStepDetectorData();
  }
}

class GetRotationVectorDataUseCase {
  final SensorRepository repository;

  GetRotationVectorDataUseCase(this.repository);

  /// Get the latest rotation vector reading
  Future<RotationVectorData?> call() {
    return repository.getRotationVectorData();
  }
}

class GetOrientationDataUseCase {
  final SensorRepository repository;

  GetOrientationDataUseCase(this.repository);

  /// Get the latest orientation reading
  Future<OrientationData?> call() {
    return repository.getOrientationData();
  }
}

class GetGravityDataUseCase {
  final SensorRepository repository;

  GetGravityDataUseCase(this.repository);

  /// Get the latest gravity reading
  Future<GravityData?> call() {
    return repository.getGravityData();
  }
}

class GetLinearAccelerationDataUseCase {
  final SensorRepository repository;

  GetLinearAccelerationDataUseCase(this.repository);

  /// Get the latest linear acceleration reading
  Future<LinearAccelerationData?> call() {
    return repository.getLinearAccelerationData();
  }
}

class GetGameRotationVectorDataUseCase {
  final SensorRepository repository;

  GetGameRotationVectorDataUseCase(this.repository);

  /// Get the latest game rotation vector reading
  Future<GameRotationVectorData?> call() {
    return repository.getGameRotationVectorData();
  }
}

class GetGeomagneticRotationVectorDataUseCase {
  final SensorRepository repository;

  GetGeomagneticRotationVectorDataUseCase(this.repository);

  /// Get the latest geomagnetic rotation vector reading
  Future<GeomagneticRotationVectorData?> call() {
    return repository.getGeomagneticRotationVectorData();
  }
}

class GetSignificantMotionStreamUseCase {
  final SensorRepository _repository;

  GetSignificantMotionStreamUseCase(this._repository);

  Stream<SignificantMotionData> call() {
    return _repository.getSignificantMotionStream();
  }
}

class GetStationaryDetectStreamUseCase {
  final SensorRepository _repository;

  GetStationaryDetectStreamUseCase(this._repository);

  Stream<StationaryDetectData> call() {
    return _repository.getStationaryDetectStream();
  }
}

class GetWakeGestureStreamUseCase {
  final SensorRepository _repository;

  GetWakeGestureStreamUseCase(this._repository);

  Stream<WakeGestureData> call() {
    return _repository.getWakeGestureStream();
  }
}

class GetPickupDetectStreamUseCase {
  final SensorRepository _repository;

  GetPickupDetectStreamUseCase(this._repository);

  Stream<PickupDetectData> call() {
    return _repository.getPickupDetectStream();
  }
}

class GetAccelerometerUncalibratedStreamUseCase {
  final SensorRepository _repository;

  GetAccelerometerUncalibratedStreamUseCase(this._repository);

  Stream<AccelerometerUncalibratedData> call() {
    return _repository.getAccelerometerUncalibratedStream();
  }
}

class GetMagneticFieldUncalibratedStreamUseCase {
  final SensorRepository _repository;

  GetMagneticFieldUncalibratedStreamUseCase(this._repository);

  Stream<MagneticFieldUncalibratedData> call() {
    return _repository.getMagneticFieldUncalibratedStream();
  }
}

class GetGyroscopeUncalibratedStreamUseCase {
  final SensorRepository _repository;

  GetGyroscopeUncalibratedStreamUseCase(this._repository);

  Stream<GyroscopeUncalibratedData> call() {
    return _repository.getGyroscopeUncalibratedStream();
  }
}

class GetSignificantMotionDataUseCase {
  final SensorRepository _repository;

  GetSignificantMotionDataUseCase(this._repository);

  Future<SignificantMotionData?> call() {
    return _repository.getSignificantMotionData();
  }
}

class GetStationaryDetectDataUseCase {
  final SensorRepository _repository;

  GetStationaryDetectDataUseCase(this._repository);

  Future<StationaryDetectData?> call() {
    return _repository.getStationaryDetectData();
  }
}

class GetWakeGestureDataUseCase {
  final SensorRepository _repository;

  GetWakeGestureDataUseCase(this._repository);

  Future<WakeGestureData?> call() {
    return _repository.getWakeGestureData();
  }
}

class GetPickupDetectDataUseCase {
  final SensorRepository _repository;

  GetPickupDetectDataUseCase(this._repository);

  Future<PickupDetectData?> call() {
    return _repository.getPickupDetectData();
  }
}

class GetAccelerometerUncalibratedDataUseCase {
  final SensorRepository _repository;

  GetAccelerometerUncalibratedDataUseCase(this._repository);

  Future<AccelerometerUncalibratedData?> call() {
    return _repository.getAccelerometerUncalibratedData();
  }
}

class GetMagneticFieldUncalibratedDataUseCase {
  final SensorRepository _repository;

  GetMagneticFieldUncalibratedDataUseCase(this._repository);

  Future<MagneticFieldUncalibratedData?> call() {
    return _repository.getMagneticFieldUncalibratedData();
  }
}

class GetGyroscopeUncalibratedDataUseCase {
  final SensorRepository _repository;

  GetGyroscopeUncalibratedDataUseCase(this._repository);

  Future<GyroscopeUncalibratedData?> call() {
    return _repository.getGyroscopeUncalibratedData();
  }
}
