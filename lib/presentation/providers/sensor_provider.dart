import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sensor_api/data/datasources/api_server.dart';
import 'package:sensor_api/data/datasources/sensor_datasource.dart';
import 'package:sensor_api/data/repositories/sensor_repository_impl.dart';
import 'package:sensor_api/domain/entities/sensor_data.dart';
import 'package:sensor_api/domain/repositories/sensor_repository.dart';
import 'package:sensor_api/domain/usecases/get_sensor_data.dart';

// DataSource provider
final sensorDataSourceProvider = Provider<SensorDataSource>((ref) {
  return SensorPlusDataSource();
});

// Repository provider
final sensorRepositoryProvider = Provider<SensorRepository>((ref) {
  final dataSource = ref.watch(sensorDataSourceProvider);
  return SensorRepositoryImpl(dataSource);
});

// UseCase providers
final getAccelerometerDataUseCaseProvider =
    Provider<GetAccelerometerDataUseCase>((ref) {
      final repository = ref.watch(sensorRepositoryProvider);
      return GetAccelerometerDataUseCase(repository);
    });

final getGyroscopeDataUseCaseProvider = Provider<GetGyroscopeDataUseCase>((
  ref,
) {
  final repository = ref.watch(sensorRepositoryProvider);
  return GetGyroscopeDataUseCase(repository);
});

final getMagnetometerDataUseCaseProvider = Provider<GetMagnetometerDataUseCase>(
  (ref) {
    final repository = ref.watch(sensorRepositoryProvider);
    return GetMagnetometerDataUseCase(repository);
  },
);

final getProximityDataUseCaseProvider = Provider<GetProximityDataUseCase>((
  ref,
) {
  final repository = ref.watch(sensorRepositoryProvider);
  return GetProximityDataUseCase(repository);
});

final getLightDataUseCaseProvider = Provider<GetLightDataUseCase>((ref) {
  final repository = ref.watch(sensorRepositoryProvider);
  return GetLightDataUseCase(repository);
});

final getPressureDataUseCaseProvider = Provider<GetPressureDataUseCase>((ref) {
  final repository = ref.watch(sensorRepositoryProvider);
  return GetPressureDataUseCase(repository);
});

final getCombinedSensorDataUseCaseProvider =
    Provider<GetCombinedSensorDataUseCase>((ref) {
      final repository = ref.watch(sensorRepositoryProvider);
      return GetCombinedSensorDataUseCase(repository);
    });

final getAccelerometerStreamUseCaseProvider =
    Provider<GetAccelerometerStreamUseCase>((ref) {
      final repository = ref.watch(sensorRepositoryProvider);
      return GetAccelerometerStreamUseCase(repository);
    });

final getGyroscopeStreamUseCaseProvider = Provider<GetGyroscopeStreamUseCase>((
  ref,
) {
  final repository = ref.watch(sensorRepositoryProvider);
  return GetGyroscopeStreamUseCase(repository);
});

final getMagnetometerStreamUseCaseProvider =
    Provider<GetMagnetometerStreamUseCase>((ref) {
      final repository = ref.watch(sensorRepositoryProvider);
      return GetMagnetometerStreamUseCase(repository);
    });

final getProximityStreamUseCaseProvider = Provider<GetProximityStreamUseCase>((
  ref,
) {
  final repository = ref.watch(sensorRepositoryProvider);
  return GetProximityStreamUseCase(repository);
});

final getLightStreamUseCaseProvider = Provider<GetLightStreamUseCase>((ref) {
  final repository = ref.watch(sensorRepositoryProvider);
  return GetLightStreamUseCase(repository);
});

final getPressureStreamUseCaseProvider = Provider<GetPressureStreamUseCase>((
  ref,
) {
  final repository = ref.watch(sensorRepositoryProvider);
  return GetPressureStreamUseCase(repository);
});

final getAvailableSensorsUseCaseProvider = Provider<GetAvailableSensorsUseCase>(
  (ref) {
    final repository = ref.watch(sensorRepositoryProvider);
    return GetAvailableSensorsUseCase(repository);
  },
);

// API Server provider
final apiServerProvider = Provider<ApiServer>((ref) {
  return ApiServer(
    getAccelerometerData: ref.watch(getAccelerometerDataUseCaseProvider),
    getGyroscopeData: ref.watch(getGyroscopeDataUseCaseProvider),
    getMagnetometerData: ref.watch(getMagnetometerDataUseCaseProvider),
    getProximityData: ref.watch(getProximityDataUseCaseProvider),
    getLightData: ref.watch(getLightDataUseCaseProvider),
    getPressureData: ref.watch(getPressureDataUseCaseProvider),
    getCombinedSensorData: ref.watch(getCombinedSensorDataUseCaseProvider),
    getAvailableSensors: ref.watch(getAvailableSensorsUseCaseProvider),
  );
});

// Stream providers
final accelerometerStreamProvider = StreamProvider<AccelerometerData>((ref) {
  final useCase = ref.watch(getAccelerometerStreamUseCaseProvider);
  return useCase();
});

final gyroscopeStreamProvider = StreamProvider<GyroscopeData>((ref) {
  final useCase = ref.watch(getGyroscopeStreamUseCaseProvider);
  return useCase();
});

final magnetometerStreamProvider = StreamProvider<MagnetometerData>((ref) {
  final useCase = ref.watch(getMagnetometerStreamUseCaseProvider);
  return useCase();
});

final proximityStreamProvider = StreamProvider<ProximityData>((ref) {
  final useCase = ref.watch(getProximityStreamUseCaseProvider);
  return useCase();
});

final lightStreamProvider = StreamProvider<LightSensorData>((ref) {
  final useCase = ref.watch(getLightStreamUseCaseProvider);
  return useCase();
});

final pressureStreamProvider = StreamProvider<PressureData>((ref) {
  final useCase = ref.watch(getPressureStreamUseCaseProvider);
  return useCase();
});

// Server status provider
final serverStatusProvider = StateProvider<bool>((ref) => false);

// Server port provider
final serverPortProvider = StateProvider<int>((ref) => 8080);

// Server IP provider
final serverIpProvider = StateProvider<String>((ref) => '0.0.0.0');
