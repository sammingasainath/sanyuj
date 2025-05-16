import 'dart:convert';
import 'dart:typed_data';

/// Represents a photo taken by the camera
class CameraData {
  final String imagePath;
  final String? base64Image;
  final DateTime timestamp;
  final String contentType;
  final String? cameraPosition;

  CameraData({
    required this.imagePath,
    this.base64Image,
    required this.timestamp,
    this.contentType = 'image/jpeg',
    this.cameraPosition,
  });

  /// Creates a CameraData instance with base64-encoded image data
  factory CameraData.withBase64({
    required String imagePath,
    required Uint8List imageBytes,
    required DateTime timestamp,
    String contentType = 'image/jpeg',
    String? cameraPosition,
  }) {
    return CameraData(
      imagePath: imagePath,
      base64Image: base64Encode(imageBytes),
      timestamp: timestamp,
      contentType: contentType,
      cameraPosition: cameraPosition,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imagePath': imagePath,
      'base64Image': base64Image,
      'timestamp': timestamp.toIso8601String(),
      'contentType': contentType,
      'cameraPosition': cameraPosition,
    };
  }

  @override
  String toString() {
    return jsonEncode({
      'imagePath': imagePath,
      'timestamp': timestamp.toIso8601String(),
      'contentType': contentType,
      'cameraPosition': cameraPosition,
    });
  }
}
