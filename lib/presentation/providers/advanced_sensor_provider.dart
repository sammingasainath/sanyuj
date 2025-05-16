import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sensor_api/data/services/gps_service.dart';
import 'package:sensor_api/data/services/camera_service.dart';
import 'package:sensor_api/domain/usecases/get_gps_data.dart';
import 'package:sensor_api/domain/usecases/get_camera_data.dart';
import 'package:sensor_api/domain/entities/gps_data.dart';
import 'package:sensor_api/domain/entities/camera_data.dart';

// Services providers
final gpsServiceProvider = Provider<GpsService>((ref) {
  return GpsService();
});

final cameraServiceProvider = Provider<CameraService>((ref) {
  return CameraService();
});

// Use case providers
final getGpsDataUseCaseProvider = Provider<GetGpsDataUseCase>((ref) {
  final gpsService = ref.watch(gpsServiceProvider);
  return GetGpsDataUseCase(gpsService);
});

final getCameraDataUseCaseProvider = Provider<GetCameraDataUseCase>((ref) {
  final cameraService = ref.watch(cameraServiceProvider);
  return GetCameraDataUseCase(cameraService);
});

// Stream providers
final gpsStreamProvider = StreamProvider<GpsData>((ref) {
  final useCase = ref.watch(getGpsDataUseCaseProvider);
  return useCase.getStream();
});

// State providers for camera
final isCameraInitializedProvider = StateProvider<bool>((ref) => false);

// Providers for camera preview
final cameraControllerProvider = Provider.autoDispose((ref) {
  final cameraUseCase = ref.watch(getCameraDataUseCaseProvider);
  final isInitialized = ref.watch(isCameraInitializedProvider);

  if (!isInitialized) {
    return null;
  }

  final controller = cameraUseCase.controller;
  if (controller == null || !controller.value.isInitialized) {
    return null;
  }

  return controller;
});
