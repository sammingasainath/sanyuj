import 'dart:io';
import 'package:camera/camera.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sensor_api/domain/entities/camera_data.dart';

/// Camera position (front or back)
enum CameraPosition { back, front }

/// Service for accessing the device camera
class CameraService {
  final _logger = Logger('CameraService');
  CameraController? _controller;
  List<CameraDescription>? _cameras;
  bool _initialized = false;
  bool _isDisposed = true;
  CameraPosition _currentPosition = CameraPosition.back;

  /// Initialize the camera service with a specific camera position
  Future<bool> initialize({
    CameraPosition position = CameraPosition.back,
  }) async {
    if (_initialized &&
        _controller != null &&
        !_isDisposed &&
        _currentPosition == position) {
      return true;
    }

    // Make sure any previous instances are disposed before initializing new ones
    await dispose();

    _isDisposed = false;
    _currentPosition = position;

    try {
      _cameras = await availableCameras();
      if (_cameras == null || _cameras!.isEmpty) {
        _logger.warning('No cameras found');
        return false;
      }

      // Find the appropriate camera based on position
      CameraDescription? cameraToUse = _findCamera(position);
      if (cameraToUse == null) {
        _logger.warning(
          '${position.name} camera not available, using default camera',
        );
        cameraToUse =
            _cameras!
                .first; // Default to first camera if requested one not found
      }

      await _initializeController(cameraToUse);
      _initialized = true;
      return true;
    } catch (e) {
      _logger.severe('Error initializing camera: $e');
      await dispose();
      return false;
    }
  }

  /// Find a camera matching the requested position
  CameraDescription? _findCamera(CameraPosition position) {
    if (_cameras == null || _cameras!.isEmpty) return null;

    // Look for a camera matching the requested position
    for (var camera in _cameras!) {
      bool isBackCamera = camera.lensDirection == CameraLensDirection.back;
      if ((position == CameraPosition.back && isBackCamera) ||
          (position == CameraPosition.front && !isBackCamera)) {
        return camera;
      }
    }

    // If no matching camera found, return null
    return null;
  }

  /// Initialize the camera controller
  Future<void> _initializeController(CameraDescription camera) async {
    if (_controller != null) {
      try {
        await _controller?.dispose();
      } catch (e) {
        _logger.warning('Error disposing previous controller: $e');
      }
      _controller = null;
    }

    try {
      _controller = CameraController(
        camera,
        ResolutionPreset.medium,
        enableAudio: false,
        imageFormatGroup: ImageFormatGroup.jpeg,
      );

      await _controller?.initialize();
      _isDisposed = false;
    } catch (e) {
      _logger.severe('Error initializing camera controller: $e');
      _controller = null;
    }
  }

  /// Switch between front and back cameras
  Future<bool> switchCamera() async {
    if (_cameras == null || _cameras!.length < 2) {
      return false;
    }

    final CameraDescription? currentCamera = _controller?.description;
    if (currentCamera == null) return false;

    // Determine current camera position and switch to the opposite
    bool isCurrentlyBack =
        currentCamera.lensDirection == CameraLensDirection.back;
    _currentPosition =
        isCurrentlyBack ? CameraPosition.front : CameraPosition.back;

    // Find the camera for the new position
    CameraDescription? newCamera = _findCamera(_currentPosition);
    if (newCamera == null) return false;

    try {
      await _controller?.dispose();
      _controller = null;
      await _initializeController(newCamera);
      return true;
    } catch (e) {
      _logger.severe('Error switching camera: $e');
      return false;
    }
  }

  /// Take a photo with the current camera and immediately release resources
  Future<CameraData?> takePhoto() async {
    // Initialize camera if needed
    if (_controller == null ||
        !(_controller!.value.isInitialized) ||
        _isDisposed) {
      final initialized = await initialize(position: _currentPosition);
      if (!initialized) return null;
    }

    try {
      if (_controller == null) return null;

      final XFile image = await _controller!.takePicture();
      final timestamp = DateTime.now();
      final cameraPosition = _currentPosition.name;

      // Save to a more permanent location
      final directory = await getTemporaryDirectory();
      final filename =
          'photo_${cameraPosition}_${timestamp.millisecondsSinceEpoch}.jpg';
      final savedPath = '${directory.path}/$filename';

      // Copy the image file to the new location
      await File(image.path).copy(savedPath);

      // Read the image bytes for base64 encoding
      final imageBytes = await File(savedPath).readAsBytes();

      // Create the camera data object
      final cameraData = CameraData.withBase64(
        imagePath: savedPath,
        imageBytes: imageBytes,
        timestamp: timestamp,
        cameraPosition: cameraPosition,
      );

      // Dispose of the camera resources after taking the photo
      await dispose();

      return cameraData;
    } catch (e) {
      _logger.severe('Error taking photo: $e');
      await dispose();
      return null;
    }
  }

  /// Take a photo with the front camera
  Future<CameraData?> takeFrontCameraPhoto() async {
    await initialize(position: CameraPosition.front);
    final result = await takePhoto();
    return result;
  }

  /// Take a photo with the back camera
  Future<CameraData?> takeBackCameraPhoto() async {
    await initialize(position: CameraPosition.back);
    final result = await takePhoto();
    return result;
  }

  /// Get the camera controller for previews
  CameraController? get controller {
    if (_isDisposed) return null;
    return _controller;
  }

  /// Check if the camera is initialized
  bool get isInitialized {
    if (_isDisposed) return false;
    return _controller?.value.isInitialized ?? false;
  }

  /// Get the current camera position
  CameraPosition get currentPosition => _currentPosition;

  /// Dispose the camera controller
  Future<void> dispose() async {
    _isDisposed = true;
    _initialized = false;
    try {
      if (_controller != null) {
        await _controller?.dispose();
        _controller = null;
      }
    } catch (e) {
      _logger.warning('Error disposing camera controller: $e');
    }
  }
}
