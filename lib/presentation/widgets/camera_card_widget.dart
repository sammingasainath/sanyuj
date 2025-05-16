import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:camera/camera.dart';
import 'package:sensor_api/presentation/providers/advanced_sensor_provider.dart';

/// A card widget for camera preview and photo capture
class CameraCardWidget extends ConsumerStatefulWidget {
  const CameraCardWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<CameraCardWidget> createState() => _CameraCardWidgetState();
}

class _CameraCardWidgetState extends ConsumerState<CameraCardWidget>
    with WidgetsBindingObserver {
  String? _lastImagePath;
  bool _isCapturing = false;
  bool _isSwitchingCamera = false;
  bool _previewActive = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _disposeCamera();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // When app is inactive or paused, make sure camera is disposed
    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused) {
      _disposeCamera();
    }
  }

  Future<void> _disposeCamera() async {
    final cameraUseCase = ref.read(getCameraDataUseCaseProvider);
    await cameraUseCase.dispose();
    ref.read(isCameraInitializedProvider.notifier).state = false;
    if (mounted) {
      setState(() {
        _previewActive = false;
      });
    }
  }

  Future<void> _activatePreview() async {
    if (_previewActive) return;

    setState(() {
      _isCapturing = true;
    });

    try {
      final cameraUseCase = ref.read(getCameraDataUseCaseProvider);
      final result = await cameraUseCase.initialize();

      if (mounted) {
        setState(() {
          _isCapturing = false;
          if (result) {
            ref.read(isCameraInitializedProvider.notifier).state = true;
            _previewActive = true;
          }
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isCapturing = false;
        });
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error activating camera: $e')));
      }
    }
  }

  Future<void> _switchCamera() async {
    if (_isCapturing || _isSwitchingCamera) return;

    setState(() {
      _isSwitchingCamera = true;
    });

    try {
      await _activatePreview();
      final cameraUseCase = ref.read(getCameraDataUseCaseProvider);
      final success = await cameraUseCase.switchCamera();

      if (mounted) {
        setState(() {
          _isSwitchingCamera = false;
        });

        if (!success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Failed to switch camera. Try again.'),
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isSwitchingCamera = false;
        });
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error switching camera: $e')));
      }
    }
  }

  Future<void> _capturePhoto() async {
    if (_isCapturing) return;

    setState(() {
      _isCapturing = true;
    });

    try {
      // On-demand activation
      await _activatePreview();

      final cameraUseCase = ref.read(getCameraDataUseCaseProvider);
      final result = await cameraUseCase.call();

      if (mounted) {
        setState(() {
          if (result != null) {
            _lastImagePath = result.imagePath;
          }
          _isCapturing = false;
          _previewActive = false;
        });

        // Camera resources are automatically released after taking photo
        ref.read(isCameraInitializedProvider.notifier).state = false;
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isCapturing = false;
        });
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error taking photo: $e')));
      }
    }
  }

  void _resetPreview() {
    setState(() {
      _lastImagePath = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isInitialized = ref.watch(isCameraInitializedProvider);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.camera_alt),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'Camera',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.flip_camera_android, size: 20),
                  onPressed:
                      (_isCapturing || _isSwitchingCamera)
                          ? null
                          : _switchCamera,
                  tooltip: 'Switch Camera',
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (_isCapturing || _isSwitchingCamera)
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 80.0),
                  child: CircularProgressIndicator(),
                ),
              )
            else
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: _buildCameraView(isInitialized),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: _isCapturing ? null : _capturePhoto,
                        icon: const Icon(Icons.camera),
                        label: const Text(
                          'Take Photo',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                        ),
                      ),
                      if (_lastImagePath != null)
                        ElevatedButton.icon(
                          onPressed: _resetPreview,
                          icon: const Icon(Icons.refresh),
                          label: const Text(
                            'Preview',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[600],
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCameraView(bool isInitialized) {
    // If we have an image, show that
    if (_lastImagePath != null) {
      return Image.file(File(_lastImagePath!), fit: BoxFit.cover);
    }

    // If we're not actively in preview mode, show a button to activate camera
    if (!_previewActive) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Camera preview inactive',
              style: TextStyle(color: Colors.grey[700]),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _activatePreview,
              child: const Text('Activate Preview'),
            ),
          ],
        ),
      );
    }

    // If we're in preview mode but the camera isn't properly initialized
    if (!isInitialized) {
      return const Center(child: Text('Initializing camera...'));
    }

    // Show the camera preview
    try {
      final controller = ref.read(getCameraDataUseCaseProvider).controller;
      if (controller == null || !controller.value.isInitialized) {
        return const Center(child: Text('Camera controller unavailable'));
      }
      return CameraPreview(controller);
    } catch (e) {
      return Center(child: Text('Camera error: $e'));
    }
  }
}
