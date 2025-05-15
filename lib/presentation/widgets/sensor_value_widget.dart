import 'package:flutter/material.dart';
import 'dart:math' as math;

/// Widget for displaying XYZ vector data from sensors
class SensorValueWidget extends StatelessWidget {
  final double x;
  final double y;
  final double z;

  const SensorValueWidget({
    super.key,
    required this.x,
    required this.y,
    required this.z,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('X: ${x.toStringAsFixed(3)}'),
        Text('Y: ${y.toStringAsFixed(3)}'),
        Text('Z: ${z.toStringAsFixed(3)}'),
      ],
    );
  }
}

/// Widget for displaying proximity sensor data
class ProximityValueWidget extends StatelessWidget {
  final double distance;
  final bool isNear;

  const ProximityValueWidget({
    super.key,
    required this.distance,
    required this.isNear,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Distance: ${distance.toStringAsFixed(1)} cm'),
        Row(
          children: [
            Text('Status: '),
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: isNear ? Colors.red : Colors.green,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 4),
            Text(isNear ? 'Near' : 'Far'),
          ],
        ),
      ],
    );
  }
}

/// Widget for displaying light sensor data
class LightValueWidget extends StatelessWidget {
  final double illuminance;

  const LightValueWidget({super.key, required this.illuminance});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Illuminance: ${illuminance.toStringAsFixed(1)} lux'),
        Row(
          children: [
            Icon(Icons.wb_sunny, size: 16, color: _getLightColor(illuminance)),
            SizedBox(width: 4),
            Text(_getLightDescription(illuminance)),
          ],
        ),
      ],
    );
  }

  Color _getLightColor(double lux) {
    if (lux < 50) return Colors.indigo;
    if (lux < 200) return Colors.blue;
    if (lux < 500) return Colors.amber;
    return Colors.orange;
  }

  String _getLightDescription(double lux) {
    if (lux < 10) return 'Very Dark';
    if (lux < 50) return 'Dark';
    if (lux < 200) return 'Dim';
    if (lux < 500) return 'Normal';
    if (lux < 1000) return 'Bright';
    return 'Very Bright';
  }
}

/// Widget for displaying pressure sensor data
class PressureValueWidget extends StatelessWidget {
  final double pressure;

  const PressureValueWidget({super.key, required this.pressure});

  @override
  Widget build(BuildContext context) {
    // Special case for when pressure sensor is not working
    if (pressure < 0) {
      return Text('Pressure sensor not available');
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Pressure: ${pressure.toStringAsFixed(1)} hPa'),
        Row(
          children: [
            Icon(Icons.waves, size: 16, color: _getPressureColor(pressure)),
            SizedBox(width: 4),
            Text(_getPressureDescription(pressure)),
          ],
        ),
      ],
    );
  }

  Color _getPressureColor(double hPa) {
    if (hPa < 990) return Colors.deepOrange;
    if (hPa < 1000) return Colors.orange;
    if (hPa < 1013) return Colors.amber;
    if (hPa < 1023) return Colors.lightGreen;
    return Colors.green;
  }

  String _getPressureDescription(double hPa) {
    if (hPa < 990) return 'Very Low';
    if (hPa < 1000) return 'Low';
    if (hPa < 1013) return 'Slightly Low';
    if (hPa < 1023) return 'Normal';
    if (hPa < 1040) return 'High';
    return 'Very High';
  }
}

/// Widget for displaying step counter data
class StepCounterValueWidget extends StatelessWidget {
  final int steps;

  const StepCounterValueWidget({super.key, required this.steps});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Steps: $steps'),
        Row(
          children: [
            Icon(Icons.directions_walk, size: 16),
            SizedBox(width: 4),
            Text(_getActivityLevel(steps)),
          ],
        ),
      ],
    );
  }

  String _getActivityLevel(int steps) {
    if (steps < 1000) return 'Low Activity';
    if (steps < 5000) return 'Moderate Activity';
    if (steps < 10000) return 'Active';
    return 'Very Active';
  }
}

/// Widget for displaying step detector data
class StepDetectorValueWidget extends StatelessWidget {
  final bool detected;

  const StepDetectorValueWidget({super.key, required this.detected});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Step detected: '),
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: detected ? Colors.green : Colors.grey,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 4),
        Text(detected ? 'Yes' : 'No'),
      ],
    );
  }
}

/// Widget for displaying rotation vector data
class RotationVectorValueWidget extends StatelessWidget {
  final double x;
  final double y;
  final double z;
  final double w;

  const RotationVectorValueWidget({
    super.key,
    required this.x,
    required this.y,
    required this.z,
    required this.w,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('X: ${x.toStringAsFixed(3)}'),
        Text('Y: ${y.toStringAsFixed(3)}'),
        Text('Z: ${z.toStringAsFixed(3)}'),
        Text('W: ${w.toStringAsFixed(3)}'),
      ],
    );
  }
}

/// Widget for displaying orientation data in degrees
class OrientationValueWidget extends StatelessWidget {
  final double azimuth; // Z-axis rotation (compass direction)
  final double pitch; // X-axis rotation
  final double roll; // Y-axis rotation

  const OrientationValueWidget({
    super.key,
    required this.azimuth,
    required this.pitch,
    required this.roll,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Azimuth: ${azimuth.toStringAsFixed(1)}°'),
        Text('Pitch: ${pitch.toStringAsFixed(1)}°'),
        Text('Roll: ${roll.toStringAsFixed(1)}°'),
        Row(
          children: [
            Icon(Icons.explore, size: 16),
            SizedBox(width: 4),
            Text(_getCompassDirection(azimuth)),
          ],
        ),
      ],
    );
  }

  String _getCompassDirection(double azimuth) {
    const directions = ['N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW'];
    final index = ((azimuth + 22.5) % 360 / 45).floor();
    return directions[index];
  }
}

/// Widget for displaying gravity sensor data
class GravityValueWidget extends StatelessWidget {
  final double x;
  final double y;
  final double z;

  const GravityValueWidget({
    super.key,
    required this.x,
    required this.y,
    required this.z,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate magnitude (should be approximately 9.8 m/s²)
    final magnitude = _calculateMagnitude(x, y, z);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('X: ${x.toStringAsFixed(4)} m/s²'),
        Text('Y: ${y.toStringAsFixed(4)} m/s²'),
        Text('Z: ${z.toStringAsFixed(4)} m/s²'),
        const SizedBox(height: 4),
        Text('Magnitude: ${magnitude.toStringAsFixed(4)} m/s²'),
      ],
    );
  }

  double _calculateMagnitude(double x, double y, double z) {
    return math.sqrt(x * x + y * y + z * z);
  }
}

/// Widget for displaying device orientation changes
class DeviceOrientationValueWidget extends StatelessWidget {
  final int orientation;

  const DeviceOrientationValueWidget({super.key, required this.orientation});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Orientation: $_getOrientationName(orientation)'),
        Icon(_getOrientationIcon(), size: 24, color: Colors.blue),
      ],
    );
  }

  String _getOrientationName(int orientation) {
    switch (orientation) {
      case 0:
        return 'Portrait';
      case 1:
        return 'Landscape Left';
      case 2:
        return 'Portrait Upside Down';
      case 3:
        return 'Landscape Right';
      default:
        return 'Unknown';
    }
  }

  IconData _getOrientationIcon() {
    switch (orientation) {
      case 0:
        return Icons.stay_current_portrait;
      case 1:
        return Icons.stay_current_landscape;
      case 2:
        return Icons.screen_lock_portrait;
      case 3:
        return Icons.screen_lock_landscape;
      default:
        return Icons.device_unknown;
    }
  }
}
