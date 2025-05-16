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
  bool _isInitializing = false;
  bool _isCameraDisposed = false;
  CameraController? _cachedController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initializeCamera();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _disposeCamera();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Handle app lifecycle changes to properly manage camera resources
    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused) {
      _disposeCamera();
    } else if (state == AppLifecycleState.resumed) {
      if (_isCameraDisposed) {
        _initializeCamera();
      }
    }
  }

  Future<void> _disposeCamera() async {
    final cameraUseCase = ref.read(getCameraDataUseCaseProvider);
    await cameraUseCase.dispose();
    _cachedController = null;
    ref.read(isCameraInitializedProvider.notifier).state = false;
    _isCameraDisposed = true;
    if (mounted) setState(() {});
  }

  Future<void> _initializeCamera() async {
    if (_isInitializing) return;

    setState(() {
      _isInitializing = true;
    });

    final cameraUseCase = ref.read(getCameraDataUseCaseProvider);
    final result = await cameraUseCase.initialize();

    if (mounted) {
      if (result) {
        ref.read(isCameraInitializedProvider.notifier).state = true;
        _isCameraDisposed = false;
        _cachedController = cameraUseCase.controller;
      }

      setState(() {
        _isInitializing = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isInitialized = ref.watch(isCameraInitializedProvider);

    // Only update cached controller if it's null and the camera is initialized
    if (_cachedController == null && !_isCameraDisposed && isInitialized) {
      final provider = ref.read(getCameraDataUseCaseProvider);
      _cachedController = provider.controller;
    }

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
                      isInitialized && !_isInitializing ? _switchCamera : null,
                  tooltip: 'Switch Camera',
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (_isInitializing)
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 80.0),
                  child: CircularProgressIndicator(),
                ),
              )
            else if (!isInitialized || _isCameraDisposed)
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Camera not initialized',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _initializeCamera,
                      child: const Text('Initialize Camera'),
                    ),
                  ],
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
                      child: _buildCameraPreview(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed:
                            isInitialized &&
                                    !_isInitializing &&
                                    !_isCameraDisposed
                                ? _capturePhoto
                                : null,
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

  Widget _buildCameraPreview() {
    if (_lastImagePath != null) {
      return Image.file(File(_lastImagePath!), fit: BoxFit.cover);
    }

    if (_cachedController == null ||
        _isCameraDisposed ||
        !_cachedController!.value.isInitialized) {
      return const Center(child: Text('Camera unavailable'));
    }

    try {
      return CameraPreview(_cachedController!);
    } catch (e) {
      // If any error occurs, display a fallback
      return const Center(child: Text('Camera preview error'));
    }
  }

  Future<void> _capturePhoto() async {
    try {
      if (_isInitializing || _isCameraDisposed) return;

      setState(() {
        _isInitializing = true;
      });

      final cameraUseCase = ref.read(getCameraDataUseCaseProvider);
      final result = await cameraUseCase.call();

      if (mounted) {
        setState(() {
          if (result != null) {
            _lastImagePath = result.imagePath;
          }
          _isInitializing = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isInitializing = false;
        });
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error taking photo: $e')));
      }
    }
  }

  Future<void> _switchCamera() async {
    try {
      if (_isInitializing || _isCameraDisposed) return;

      setState(() {
        _isInitializing = true;
        _cachedController = null;
      });

      final cameraUseCase = ref.read(getCameraDataUseCaseProvider);
      final success = await cameraUseCase.switchCamera();

      if (mounted) {
        setState(() {
          _isInitializing = false;
          if (success) {
            _cachedController = cameraUseCase.controller;
          }
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
          _isInitializing = false;
        });
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error switching camera: $e')));
      }
    }
  }

  void _resetPreview() {
    setState(() {
      _lastImagePath = null;
    });
  }
}
