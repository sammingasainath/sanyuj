import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sensor_api/domain/entities/gps_data.dart';
import 'package:sensor_api/presentation/providers/advanced_sensor_provider.dart';

/// A card widget for displaying GPS location data
class GpsCardWidget extends ConsumerWidget {
  const GpsCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gpsStream = ref.watch(gpsStreamProvider);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.location_on),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'GPS Location',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 4),
                gpsStream.when(
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
            gpsStream.when(
              data: (data) => _buildGpsData(data),
              loading: () => const Center(child: CircularProgressIndicator()),
              error:
                  (error, _) => Text(
                    'GPS not available: $error',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGpsData(GpsData data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoRow('Latitude', '${data.latitude.toStringAsFixed(6)}°'),
        const SizedBox(height: 4),
        _buildInfoRow('Longitude', '${data.longitude.toStringAsFixed(6)}°'),
        const SizedBox(height: 4),
        _buildInfoRow('Accuracy', '${data.accuracy.toStringAsFixed(1)} m'),
        if (data.altitude != null) ...[
          const SizedBox(height: 4),
          _buildInfoRow('Altitude', '${data.altitude!.toStringAsFixed(1)} m'),
        ],
        if (data.speed != null) ...[
          const SizedBox(height: 4),
          _buildInfoRow('Speed', '${data.speed!.toStringAsFixed(1)} m/s'),
        ],
        if (data.heading != null) ...[
          const SizedBox(height: 4),
          _buildInfoRow('Heading', '${data.heading!.toStringAsFixed(1)}°'),
        ],
        const SizedBox(height: 4),
        _buildInfoRow(
          'Timestamp',
          '${data.timestamp.hour}:${data.timestamp.minute.toString().padLeft(2, '0')}:${data.timestamp.second.toString().padLeft(2, '0')}',
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        Text(value, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
