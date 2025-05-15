import 'package:sensor_api/domain/entities/sensor_data.dart';
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
