import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:sensor_api/data/datasources/platform_sensor_datasource.dart';
import 'package:sensor_api/data/datasources/api_server.dart';
import 'package:sensor_api/domain/entities/sensor_data.dart';
import 'package:sensor_api/domain/entities/additional_sensors.dart';
import 'package:sensor_api/presentation/providers/sensor_provider.dart';
import 'package:sensor_api/presentation/widgets/sensor_card_widget.dart';
import 'package:sensor_api/presentation/widgets/sensor_group_widget.dart';
import 'package:sensor_api/presentation/widgets/server_config_widget.dart';
import 'package:sensor_api/presentation/widgets/endpoints_list_widget.dart';
import 'package:sensor_api/presentation/widgets/sensor_value_widget.dart';

// Providers to check if sensors are simulated or real
final isProximitySimulatedProvider = Provider<bool>((ref) {
  final sensorDataSource = ref.watch(sensorDataSourceProvider);
  return sensorDataSource is PlatformSensorDataSource
      ? !(sensorDataSource as PlatformSensorDataSource).isProximityRealData()
      : true;
});

final isLightSimulatedProvider = Provider<bool>((ref) {
  final sensorDataSource = ref.watch(sensorDataSourceProvider);
  return sensorDataSource is PlatformSensorDataSource
      ? !(sensorDataSource as PlatformSensorDataSource).isLightRealData()
      : true;
});

final isPressureWorkingProvider = Provider<bool>((ref) {
  final sensorDataSource = ref.watch(sensorDataSourceProvider);
  return sensorDataSource is PlatformSensorDataSource
      ? (sensorDataSource as PlatformSensorDataSource).isPressureWorking()
      : false;
});

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
    return RefreshIndicator(
      onRefresh: () async {
        ref.refresh(accelerometerStreamProvider);
        ref.refresh(gyroscopeStreamProvider);
        ref.refresh(magnetometerStreamProvider);
        ref.refresh(proximityStreamProvider);
        ref.refresh(lightStreamProvider);
        ref.refresh(pressureStreamProvider);
        ref.refresh(rotationVectorStreamProvider);
        ref.refresh(orientationStreamProvider);
        ref.refresh(gravityStreamProvider);
        ref.refresh(linearAccelerationStreamProvider);
        ref.refresh(stepCounterStreamProvider);
        ref.refresh(stepDetectorStreamProvider);
        // Refresh new sensors
        ref.refresh(significantMotionStreamProvider);
        ref.refresh(stationaryDetectStreamProvider);
        ref.refresh(wakeGestureStreamProvider);
        ref.refresh(pickupDetectStreamProvider);
        ref.refresh(accelerometerUncalibratedStreamProvider);
        ref.refresh(magneticFieldUncalibratedStreamProvider);
        ref.refresh(gyroscopeUncalibratedStreamProvider);
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMotionSensorsGroup(),
            _buildEnvironmentalSensorsGroup(),
            _buildPositionSensorsGroup(),
            _buildActivitySensorsGroup(),
            _buildNewSensorsGroup(),
          ],
        ),
      ),
    );
  }

  Widget _buildMotionSensorsGroup() {
    final accelerometerData = ref.watch(accelerometerStreamProvider);
    final gyroscopeData = ref.watch(gyroscopeStreamProvider);
    final magnetometerData = ref.watch(magnetometerStreamProvider);

    return SensorGroupWidget(
      title: 'Motion Sensors',
      sensorCards: [
        SensorCardWidget(
          title: 'Accelerometer',
          icon: Icons.speed,
          sensorData: accelerometerData,
          valueBuilder:
              (data) => SensorValueWidget(x: data.x, y: data.y, z: data.z),
        ),
        const SizedBox(height: 10),
        SensorCardWidget(
          title: 'Gyroscope',
          icon: Icons.rotate_90_degrees_ccw,
          sensorData: gyroscopeData,
          valueBuilder:
              (data) => SensorValueWidget(x: data.x, y: data.y, z: data.z),
        ),
        const SizedBox(height: 10),
        SensorCardWidget(
          title: 'Magnetometer',
          icon: Icons.explore,
          sensorData: magnetometerData,
          valueBuilder:
              (data) => SensorValueWidget(x: data.x, y: data.y, z: data.z),
        ),
      ],
    );
  }

  Widget _buildEnvironmentalSensorsGroup() {
    final proximityData = ref.watch(proximityStreamProvider);
    final lightData = ref.watch(lightStreamProvider);
    final pressureData = ref.watch(pressureStreamProvider);

    return SensorGroupWidget(
      title: 'Environmental Sensors',
      sensorCards: [
        SensorCardWidget(
          title: 'Proximity',
          icon: Icons.sensors,
          sensorData: proximityData,
          valueBuilder:
              (data) => ProximityValueWidget(
                distance: data.distance,
                isNear: data.isNear,
              ),
        ),
        const SizedBox(height: 10),
        SensorCardWidget(
          title: 'Light Sensor',
          icon: Icons.light_mode,
          sensorData: lightData,
          valueBuilder:
              (data) => LightValueWidget(illuminance: data.illuminance),
        ),
        const SizedBox(height: 10),
        SensorCardWidget(
          title: 'Pressure Sensor',
          icon: Icons.compress,
          sensorData: pressureData,
          valueBuilder: (data) => PressureValueWidget(pressure: data.pressure),
        ),
      ],
    );
  }

  Widget _buildPositionSensorsGroup() {
    final orientationData = ref.watch(orientationStreamProvider);
    final rotationVectorData = ref.watch(rotationVectorStreamProvider);
    final gravityData = ref.watch(gravityStreamProvider);

    return SensorGroupWidget(
      title: 'Position Sensors',
      sensorCards: [
        SensorCardWidget(
          title: 'Orientation',
          icon: Icons.screen_rotation,
          sensorData: orientationData,
          valueBuilder:
              (data) => OrientationValueWidget(
                azimuth: data.azimuth,
                pitch: data.pitch,
                roll: data.roll,
              ),
        ),
        const SizedBox(height: 10),
        SensorCardWidget(
          title: 'Rotation Vector',
          icon: Icons.rotate_right,
          sensorData: rotationVectorData,
          valueBuilder:
              (data) => RotationVectorValueWidget(
                x: data.x,
                y: data.y,
                z: data.z,
                w: data.w,
              ),
        ),
        const SizedBox(height: 10),
        SensorCardWidget(
          title: 'Gravity',
          icon: Icons.arrow_downward,
          sensorData: gravityData,
          valueBuilder:
              (data) => SensorValueWidget(x: data.x, y: data.y, z: data.z),
        ),
      ],
    );
  }

  Widget _buildActivitySensorsGroup() {
    final stepCounterData = ref.watch(stepCounterStreamProvider);
    final stepDetectorData = ref.watch(stepDetectorStreamProvider);
    final linearAccelerationData = ref.watch(linearAccelerationStreamProvider);

    return SensorGroupWidget(
      title: 'Activity Sensors',
      sensorCards: [
        SensorCardWidget(
          title: 'Step Counter',
          icon: Icons.directions_walk,
          sensorData: stepCounterData,
          valueBuilder: (data) => StepCounterValueWidget(steps: data.steps),
        ),
        const SizedBox(height: 10),
        SensorCardWidget(
          title: 'Step Detector',
          icon: Icons.directions_run,
          sensorData: stepDetectorData,
          valueBuilder:
              (data) => StepDetectorValueWidget(detected: data.detected),
        ),
        const SizedBox(height: 10),
        SensorCardWidget(
          title: 'Linear Acceleration',
          icon: Icons.speed,
          sensorData: linearAccelerationData,
          valueBuilder:
              (data) => SensorValueWidget(x: data.x, y: data.y, z: data.z),
        ),
      ],
    );
  }

  Widget _buildNewSensorsGroup() {
    final significantMotionData = ref.watch(significantMotionStreamProvider);
    final stationaryDetectData = ref.watch(stationaryDetectStreamProvider);
    final wakeGestureData = ref.watch(wakeGestureStreamProvider);
    final pickupDetectData = ref.watch(pickupDetectStreamProvider);
    final accelerometerUncalibratedData = ref.watch(
      accelerometerUncalibratedStreamProvider,
    );
    final magneticFieldUncalibratedData = ref.watch(
      magneticFieldUncalibratedStreamProvider,
    );
    final gyroscopeUncalibratedData = ref.watch(
      gyroscopeUncalibratedStreamProvider,
    );

    return SensorGroupWidget(
      title: 'Advanced Sensors',
      sensorCards: [
        // Boolean sensor types (with simple UI)
        SensorCardWidget(
          title: 'Significant Motion',
          icon: Icons.motion_photos_on,
          sensorData: significantMotionData,
          valueBuilder:
              (data) => SignificantMotionValueWidget(detected: data.detected),
        ),
        SensorCardWidget(
          title: 'Stationary Detect',
          icon: Icons.do_not_disturb_on_outlined,
          sensorData: stationaryDetectData,
          valueBuilder:
              (data) =>
                  StationaryDetectValueWidget(isStationary: data.isStationary),
        ),
        SensorCardWidget(
          title: 'Wake Gesture',
          icon: Icons.back_hand,
          sensorData: wakeGestureData,
          valueBuilder:
              (data) => WakeGestureValueWidget(detected: data.detected),
        ),
        SensorCardWidget(
          title: 'Pickup Detect',
          icon: Icons.mobile_friendly,
          sensorData: pickupDetectData,
          valueBuilder:
              (data) => PickupDetectValueWidget(detected: data.detected),
        ),

        // Uncalibrated sensors (more complex UI with potential overflow)
        SensorCardWidget(
          title: 'Accel. Uncalibrated',
          icon: Icons.speed,
          sensorData: accelerometerUncalibratedData,
          valueBuilder:
              (data) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                child: UncalibratedSensorValueWidget(
                  x: data.x,
                  y: data.y,
                  z: data.z,
                  xBiasOrDrift: data.xBias,
                  yBiasOrDrift: data.yBias,
                  zBiasOrDrift: data.zBias,
                  biasOrDriftLabel: 'Bias',
                ),
              ),
        ),
        SensorCardWidget(
          title: 'Magnetic Uncalibrated',
          icon: Icons.compass_calibration,
          sensorData: magneticFieldUncalibratedData,
          valueBuilder:
              (data) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                child: UncalibratedSensorValueWidget(
                  x: data.x,
                  y: data.y,
                  z: data.z,
                  xBiasOrDrift: data.xBias,
                  yBiasOrDrift: data.yBias,
                  zBiasOrDrift: data.zBias,
                  biasOrDriftLabel: 'Bias',
                ),
              ),
        ),
        SensorCardWidget(
          title: 'Gyro. Uncalibrated',
          icon: Icons.rotate_90_degrees_ccw,
          sensorData: gyroscopeUncalibratedData,
          valueBuilder:
              (data) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                child: UncalibratedSensorValueWidget(
                  x: data.x,
                  y: data.y,
                  z: data.z,
                  xBiasOrDrift: data.xDrift,
                  yBiasOrDrift: data.yDrift,
                  zBiasOrDrift: data.zDrift,
                  biasOrDriftLabel: 'Drift',
                ),
              ),
        ),
      ],
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
          ServerConfigWidget(
            portController: _portController,
            isServerRunning: isServerRunning,
            toggleServer: _toggleServer,
          ),
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
                              color: Colors.green,
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
                        Text('all (combined data)'),
                      ],
                    ),
                  ],
                ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => Text('Error loading sensors: $error'),
          ),
          EndpointsListWidget(
            isServerRunning: isServerRunning,
            ipAddress: _ip,
            serverPort: serverPort,
            availableSensors: availableSensors,
          ),
        ],
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
