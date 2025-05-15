import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sensor_api/presentation/widgets/sensor_value_widget.dart';

/// A reusable card widget for displaying sensor data
class SensorCardWidget extends ConsumerWidget {
  final String title;
  final IconData icon;
  final AsyncValue<dynamic> sensorData;
  final Widget Function(dynamic data) valueBuilder;

  const SensorCardWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.sensorData,
    required this.valueBuilder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                const SizedBox(width: 4),
                sensorData.when(
                  data:
                      (_) => const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 16,
                      ),
                  loading:
                      () => const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                  error:
                      (_, __) =>
                          const Icon(Icons.error, color: Colors.red, size: 16),
                ),
              ],
            ),
            const SizedBox(height: 12),
            sensorData.when(
              data: (data) => valueBuilder(data),
              loading: () => const Center(child: CircularProgressIndicator()),
              error:
                  (error, _) => Text(
                    'Sensor not available',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
