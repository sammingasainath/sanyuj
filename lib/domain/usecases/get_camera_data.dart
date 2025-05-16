import 'package:sensor_api/data/services/camera_service.dart';
import 'package:sensor_api/domain/entities/camera_data.dart';

/// Use case for taking a photo using the camera
class GetCameraDataUseCase {
  final CameraService _cameraService;

  GetCameraDataUseCase(this._cameraService);

  /// Take a photo with the current camera
  Future<CameraData?> call() async {
    return await _cameraService.takePhoto();
  }

  /// Take a photo with the front camera
  Future<CameraData?> takeFrontCameraPhoto() async {
    return await _cameraService.takeFrontCameraPhoto();
  }

  /// Take a photo with the back camera
  Future<CameraData?> takeBackCameraPhoto() async {
    return await _cameraService.takeBackCameraPhoto();
  }

  /// Initialize the camera service
  Future<bool> initialize({
    CameraPosition position = CameraPosition.back,
  }) async {
    return await _cameraService.initialize(position: position);
  }

  /// Switch between front and back cameras
  Future<bool> switchCamera() async {
    return await _cameraService.switchCamera();
  }

  /// Dispose of camera resources
  Future<void> dispose() async {
    await _cameraService.dispose();
  }

  /// Get the camera controller for previews
  get controller => _cameraService.controller;

  /// Check if the camera is initialized
  bool get isInitialized => _cameraService.isInitialized;

  /// Get the current camera position
  CameraPosition get currentPosition => _cameraService.currentPosition;
}
