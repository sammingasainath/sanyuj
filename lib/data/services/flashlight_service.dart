import 'package:torch_light/torch_light.dart';

class FlashlightService {
  bool _isFlashlightOn = false;

  /// Returns the current state of the flashlight after toggling
  Future<bool> toggleFlashlight() async {
    try {
      if (_isFlashlightOn) {
        // Turn off the flashlight
        await TorchLight.disableTorch();
        _isFlashlightOn = false;
      } else {
        // Check if the device has a flashlight
        await TorchLight.isTorchAvailable();
        // Turn on the flashlight
        await TorchLight.enableTorch();
        _isFlashlightOn = true;
      }
      
      return _isFlashlightOn;
    } catch (e) {
      // Handle exceptions gracefully
      print('Error toggling flashlight: $e');
      return _isFlashlightOn;
    }
  }

  /// Get the current state of the flashlight
  bool get isFlashlightOn => _isFlashlightOn;
} 