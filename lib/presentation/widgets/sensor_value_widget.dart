import 'package:flutter/material.dart';

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
        Text('X: ${x.toStringAsFixed(4)}'),
        Text('Y: ${y.toStringAsFixed(4)}'),
        Text('Z: ${z.toStringAsFixed(4)}'),
      ],
    );
  }
}

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
        Text('Distance: ${distance.toStringAsFixed(2)} cm'),
        Row(
          children: [
            Text('Near: '),
            Icon(
              isNear ? Icons.check_circle : Icons.cancel,
              color: isNear ? Colors.green : Colors.red,
              size: 16,
            ),
          ],
        ),
      ],
    );
  }
}

class LightValueWidget extends StatelessWidget {
  final double illuminance;

  const LightValueWidget({super.key, required this.illuminance});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Illuminance: ${illuminance.toStringAsFixed(2)} lux'),
        LinearProgressIndicator(
          value:
              illuminance /
              1000, // Normalize to 0-1 range (assuming max 1000 lux)
          backgroundColor: Colors.grey[300],
          valueColor: AlwaysStoppedAnimation<Color>(
            _getLightColor(illuminance),
          ),
        ),
      ],
    );
  }

  Color _getLightColor(double value) {
    if (value < 50) return Colors.indigo;
    if (value < 200) return Colors.blue;
    if (value < 500) return Colors.amber;
    return Colors.orange;
  }
}

class PressureValueWidget extends StatelessWidget {
  final double pressure;

  const PressureValueWidget({super.key, required this.pressure});

  @override
  Widget build(BuildContext context) {
    // Standard atmospheric pressure at sea level is around 1013.25 hPa
    final normalizedPressure =
        (pressure - 950) / 100; // Range approximately 950-1050 hPa

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Pressure: ${pressure.toStringAsFixed(2)} hPa'),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: LinearProgressIndicator(
            value: normalizedPressure.clamp(0.0, 1.0),
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
        ),
      ],
    );
  }
}
