import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ServerConfigWidget extends ConsumerWidget {
  final TextEditingController portController;
  final bool isServerRunning;
  final Function(bool) toggleServer;

  const ServerConfigWidget({
    super.key,
    required this.portController,
    required this.isServerRunning,
    required this.toggleServer,
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
                Icon(
                  isServerRunning ? Icons.cloud_done : Icons.cloud_off,
                  color: isServerRunning ? Colors.green : Colors.red,
                ),
                const SizedBox(width: 8),
                Text(
                  isServerRunning ? 'Server Running' : 'Server Stopped',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isServerRunning ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: portController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Port',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.settings_ethernet),
                    ),
                    enabled: !isServerRunning,
                    onChanged: (value) {
                      // Port value updates are handled by caller
                    },
                  ),
                ),
                const SizedBox(width: 10),
                FilledButton.icon(
                  onPressed: isServerRunning ? null : () => toggleServer(true),
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('Start'),
                ),
                const SizedBox(width: 10),
                OutlinedButton.icon(
                  onPressed: isServerRunning ? () => toggleServer(false) : null,
                  icon: const Icon(Icons.stop),
                  label: const Text('Stop'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
