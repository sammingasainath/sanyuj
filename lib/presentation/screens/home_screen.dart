import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:sensor_api/presentation/providers/sensor_provider.dart';
import 'package:sensor_api/presentation/widgets/sensor_value_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _portController = TextEditingController();
  final _info = NetworkInfo();
  String? _ip;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _portController.text = ref.read(serverPortProvider).toString();
    _getIpAddress();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _portController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _getIpAddress() async {
    try {
      if (Platform.isAndroid) {
        _ip = await _info.getWifiIP();
      } else {
        // For testing on non-Android platforms
        _ip = '127.0.0.1';
      }
      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      debugPrint('Error getting IP: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isServerRunning = ref.watch(serverStatusProvider);
    final serverPort = ref.watch(serverPortProvider);
    final availableSensors = ref.watch(
      FutureProvider((ref) => ref.watch(getAvailableSensorsUseCaseProvider)()),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sensor API'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [Tab(text: 'Sensors'), Tab(text: 'API Server')],
        ),
        actions: [Switch(value: isServerRunning, onChanged: _toggleServer)],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildSensorsTab(),
          _buildServerTab(isServerRunning, serverPort, availableSensors),
        ],
      ),
    );
  }

  Widget _buildSensorsTab() {
    final accelerometerData = ref.watch(accelerometerStreamProvider);
    final gyroscopeData = ref.watch(gyroscopeStreamProvider);
    final magnetometerData = ref.watch(magnetometerStreamProvider);
    final proximityData = ref.watch(proximityStreamProvider);
    final lightData = ref.watch(lightStreamProvider);
    final pressureData = ref.watch(pressureStreamProvider);

    return RefreshIndicator(
      onRefresh: () async {
        ref.refresh(accelerometerStreamProvider);
        ref.refresh(gyroscopeStreamProvider);
        ref.refresh(magnetometerStreamProvider);
        ref.refresh(proximityStreamProvider);
        ref.refresh(lightStreamProvider);
        ref.refresh(pressureStreamProvider);
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Motion Sensors',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Accelerometer Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.speed),
                        const SizedBox(width: 8),
                        const Text(
                          'Accelerometer',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        accelerometerData.when(
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
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                          error:
                              (_, __) => const Icon(
                                Icons.error,
                                color: Colors.red,
                                size: 16,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    accelerometerData.when(
                      data:
                          (data) => SensorValueWidget(
                            x: data.x,
                            y: data.y,
                            z: data.z,
                          ),
                      loading:
                          () =>
                              const Center(child: CircularProgressIndicator()),
                      error:
                          (error, _) => Text(
                            'Error: $error',
                            style: const TextStyle(color: Colors.red),
                          ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Gyroscope Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.rotate_90_degrees_ccw),
                        const SizedBox(width: 8),
                        const Text(
                          'Gyroscope',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        gyroscopeData.when(
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
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                          error:
                              (_, __) => const Icon(
                                Icons.error,
                                color: Colors.red,
                                size: 16,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    gyroscopeData.when(
                      data:
                          (data) => SensorValueWidget(
                            x: data.x,
                            y: data.y,
                            z: data.z,
                          ),
                      loading:
                          () =>
                              const Center(child: CircularProgressIndicator()),
                      error:
                          (error, _) => Text(
                            'Error: $error',
                            style: const TextStyle(color: Colors.red),
                          ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Magnetometer Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.explore),
                        const SizedBox(width: 8),
                        const Text(
                          'Magnetometer',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        magnetometerData.when(
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
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                          error:
                              (_, __) => const Icon(
                                Icons.error,
                                color: Colors.red,
                                size: 16,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    magnetometerData.when(
                      data:
                          (data) => SensorValueWidget(
                            x: data.x,
                            y: data.y,
                            z: data.z,
                          ),
                      loading:
                          () =>
                              const Center(child: CircularProgressIndicator()),
                      error:
                          (error, _) => Text(
                            'Error: $error',
                            style: const TextStyle(color: Colors.red),
                          ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Environmental Sensors',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Proximity Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.sensors),
                        const SizedBox(width: 8),
                        const Text(
                          'Proximity',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          'Simulated',
                          style: TextStyle(
                            fontSize: 10,
                            fontStyle: FontStyle.italic,
                            color: Colors.orange,
                          ),
                        ),
                        const SizedBox(width: 4),
                        proximityData.when(
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
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                          error:
                              (_, __) => const Icon(
                                Icons.error,
                                color: Colors.red,
                                size: 16,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    proximityData.when(
                      data:
                          (data) => ProximityValueWidget(
                            distance: data.distance,
                            isNear: data.isNear,
                          ),
                      loading:
                          () =>
                              const Center(child: CircularProgressIndicator()),
                      error:
                          (error, _) => Text(
                            'Proximity sensor not available',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Light Sensor Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.light_mode),
                        const SizedBox(width: 8),
                        const Text(
                          'Light Sensor',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          'Simulated',
                          style: TextStyle(
                            fontSize: 10,
                            fontStyle: FontStyle.italic,
                            color: Colors.orange,
                          ),
                        ),
                        const SizedBox(width: 4),
                        lightData.when(
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
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                          error:
                              (_, __) => const Icon(
                                Icons.error,
                                color: Colors.red,
                                size: 16,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    lightData.when(
                      data:
                          (data) =>
                              LightValueWidget(illuminance: data.illuminance),
                      loading:
                          () =>
                              const Center(child: CircularProgressIndicator()),
                      error:
                          (error, _) => Text(
                            'Light sensor not available',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Pressure Sensor Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.compress),
                        const SizedBox(width: 8),
                        const Text(
                          'Pressure Sensor',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          'Simulated',
                          style: TextStyle(
                            fontSize: 10,
                            fontStyle: FontStyle.italic,
                            color: Colors.orange,
                          ),
                        ),
                        const SizedBox(width: 4),
                        pressureData.when(
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
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                          error:
                              (_, __) => const Icon(
                                Icons.error,
                                color: Colors.red,
                                size: 16,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    pressureData.when(
                      data:
                          (data) =>
                              PressureValueWidget(pressure: data.pressure),
                      loading:
                          () =>
                              const Center(child: CircularProgressIndicator()),
                      error:
                          (error, _) => Text(
                            'Pressure sensor not available',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServerTab(
    bool isServerRunning,
    int serverPort,
    AsyncValue<List<String>> availableSensors,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildServerSection(isServerRunning, serverPort),
          const SizedBox(height: 20),
          const Text(
            'Available Sensor Endpoints',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          availableSensors.when(
            data:
                (sensors) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...sensors.map(
                      (sensor) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.check_circle,
                              size: 16,
                              color:
                                  sensor.contains('simulated')
                                      ? Colors.orange
                                      : Colors.green,
                            ),
                            SizedBox(width: 8),
                            Text(sensor),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.check_circle, size: 16, color: Colors.blue),
                        SizedBox(width: 8),
                        Text(
                          'all (combined data - includes simulated sensors)',
                        ),
                      ],
                    ),
                  ],
                ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => Text('Error loading sensors: $error'),
          ),
        ],
      ),
    );
  }

  Widget _buildServerSection(bool isServerRunning, int serverPort) {
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
                    controller: _portController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Port',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.settings_ethernet),
                    ),
                    enabled: !isServerRunning,
                    onChanged: (value) {
                      final port = int.tryParse(value);
                      if (port != null) {
                        ref.read(serverPortProvider.notifier).state = port;
                      }
                    },
                  ),
                ),
                const SizedBox(width: 10),
                FilledButton.icon(
                  onPressed: isServerRunning ? null : () => _toggleServer(true),
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('Start'),
                ),
                const SizedBox(width: 10),
                OutlinedButton.icon(
                  onPressed:
                      isServerRunning ? () => _toggleServer(false) : null,
                  icon: const Icon(Icons.stop),
                  label: const Text('Stop'),
                ),
              ],
            ),
            if (isServerRunning && _ip != null) ...[
              const SizedBox(height: 20),
              const Text(
                'API Endpoints:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              _buildEndpointCard(
                'Sensors List',
                'http://$_ip:$serverPort/sensors',
              ),
              _buildEndpointCard(
                'Accelerometer Data',
                'http://$_ip:$serverPort/accelerometer',
              ),
              _buildEndpointCard(
                'Gyroscope Data',
                'http://$_ip:$serverPort/gyroscope',
              ),
              _buildEndpointCard(
                'Magnetometer Data',
                'http://$_ip:$serverPort/magnetometer',
              ),
              _buildEndpointCard(
                'Proximity Data (Simulated)',
                'http://$_ip:$serverPort/proximity',
              ),
              _buildEndpointCard(
                'Light Sensor Data (Simulated)',
                'http://$_ip:$serverPort/light',
              ),
              _buildEndpointCard(
                'Pressure Data (Simulated)',
                'http://$_ip:$serverPort/pressure',
              ),
              _buildEndpointCard(
                'All Sensor Data (Combined)',
                'http://$_ip:$serverPort/all',
              ),
            ],
          ],
        ),
      ),
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

  void _toggleServer(bool value) async {
    final apiServer = ref.read(apiServerProvider);

    if (value) {
      final port = int.tryParse(_portController.text);
      if (port != null) {
        ref.read(serverPortProvider.notifier).state = port;
        await apiServer.start(port: port);
        ref.read(serverStatusProvider.notifier).state = true;
      }
    } else {
      await apiServer.stop();
      ref.read(serverStatusProvider.notifier).state = false;
    }
  }
}
