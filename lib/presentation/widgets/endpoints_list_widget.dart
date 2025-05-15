import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EndpointsListWidget extends ConsumerWidget {
  final bool isServerRunning;
  final String? ipAddress;
  final int serverPort;
  final AsyncValue<List<String>> availableSensors;

  const EndpointsListWidget({
    super.key,
    required this.isServerRunning,
    required this.ipAddress,
    required this.serverPort,
    required this.availableSensors,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!isServerRunning || ipAddress == null) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const Text(
          'API Endpoints:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _buildEndpointCard(
          'Sensors List',
          'http://$ipAddress:$serverPort/sensors',
        ),
        _buildEndpointCard(
          'Accelerometer Data',
          'http://$ipAddress:$serverPort/accelerometer',
        ),
        _buildEndpointCard(
          'Gyroscope Data',
          'http://$ipAddress:$serverPort/gyroscope',
        ),
        _buildEndpointCard(
          'Magnetometer Data',
          'http://$ipAddress:$serverPort/magnetometer',
        ),
        _buildEndpointCard(
          'Proximity Data',
          'http://$ipAddress:$serverPort/proximity',
        ),
        _buildEndpointCard(
          'Light Sensor Data',
          'http://$ipAddress:$serverPort/light',
        ),
        _buildEndpointCard(
          'Pressure Data',
          'http://$ipAddress:$serverPort/pressure',
        ),
        // Advanced sensors
        _buildEndpointCard(
          'Step Counter',
          'http://$ipAddress:$serverPort/step_counter',
        ),
        _buildEndpointCard(
          'Step Detector',
          'http://$ipAddress:$serverPort/step_detector',
        ),
        _buildEndpointCard(
          'Rotation Vector',
          'http://$ipAddress:$serverPort/rotation',
        ),
        _buildEndpointCard('Gravity', 'http://$ipAddress:$serverPort/gravity'),
        _buildEndpointCard(
          'Orientation',
          'http://$ipAddress:$serverPort/orientation',
        ),
        _buildEndpointCard(
          'Linear Acceleration',
          'http://$ipAddress:$serverPort/linear_acceleration',
        ),
        _buildEndpointCard(
          'Device Orientation',
          'http://$ipAddress:$serverPort/device_orientation',
        ),
        // Combined endpoint
        _buildEndpointCard(
          'All Sensor Data (Combined)',
          'http://$ipAddress:$serverPort/all',
        ),
      ],
    );
  }

  Widget _buildEndpointCard(String title, String url) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      elevation: 0,
      color: Colors.grey[100],
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Expanded(
                  child: SelectableText(
                    url,
                    style: TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 12,
                      color: Colors.blue[800],
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.copy, size: 16),
                  onPressed: () {
                    // Copy to clipboard
                  },
                  constraints: const BoxConstraints(),
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
