import 'dart:async';

import 'package:sensors_plus/sensors_plus.dart';
import 'package:sensor_api/domain/entities/sensor_data.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';

abstract class SensorDataSource {
  Stream<AccelerometerData> getAccelerometerStream();
  Stream<GyroscopeData> getGyroscopeStream();
  Stream<MagnetometerData> getMagnetometerStream();
  Stream<ProximityData> getProximityStream();
  Stream<LightSensorData> getLightStream();
  Stream<PressureData> getPressureStream();

  Future<AccelerometerData> getAccelerometerData();
  Future<GyroscopeData> getGyroscopeData();
  Future<MagnetometerData> getMagnetometerData();
  Future<ProximityData?> getProximityData();
  Future<LightSensorData?> getLightData();
  Future<PressureData?> getPressureData();
  Future<CombinedSensorData> getCombinedSensorData();
  Future<List<String>> getAvailableSensors();
}

class SensorPlusDataSource implements SensorDataSource {
  final Logger _logger = Logger('SensorPlusDataSource');

  final StreamController<ProximityData> _proximityController =
      StreamController<ProximityData>.broadcast();
  final StreamController<LightSensorData> _lightController =
      StreamController<LightSensorData>.broadcast();
  final StreamController<PressureData> _pressureController =
      StreamController<PressureData>.broadcast();

  // Store subscription references to cancel on dispose
  StreamSubscription? _proximitySubscription;
  StreamSubscription? _lightSubscription;
  StreamSubscription? _pressureSubscription;

  // Mock values for unavailable sensors
  final ProximityData _mockProximityData = ProximityData(
    distance: 5.0,
    isNear: false,
    timestamp: DateTime.now(),
    tenantId: 'default',
  );

  final LightSensorData _mockLightData = LightSensorData(
    illuminance: 250.0,
    timestamp: DateTime.now(),
    tenantId: 'default',
  );

  final PressureData _mockPressureData = PressureData(
    pressure: 1013.25,
    timestamp: DateTime.now(),
    tenantId: 'default',
  );

  // Track which sensors are available
  bool _accelerometerAvailable = false;
  bool _gyroscopeAvailable = false;
  bool _magnetometerAvailable = false;
  bool _proximityAvailable = false;
  bool _lightAvailable = false;
  bool _pressureAvailable = false;

  // Store last values of sensors for instant access
  ProximityData? _lastProximityData;
  LightSensorData? _lastLightData;
  PressureData? _lastPressureData;

  SensorPlusDataSource() {
    _checkAvailableSensors();
    _startMockStreamsIfNeeded();
  }

  Future<void> _checkAvailableSensors() async {
    try {
      await accelerometerEventStream().first.timeout(
        const Duration(milliseconds: 500),
      );
      _accelerometerAvailable = true;
    } catch (_) {
      _accelerometerAvailable = false;
    }

    try {
      await gyroscopeEventStream().first.timeout(
        const Duration(milliseconds: 500),
      );
      _gyroscopeAvailable = true;
    } catch (_) {
      _gyroscopeAvailable = false;
    }

    try {
      await magnetometerEventStream().first.timeout(
        const Duration(milliseconds: 500),
      );
      _magnetometerAvailable = true;
    } catch (_) {
      _magnetometerAvailable = false;
    }

    // For proximity, light, and pressure sensors, we'll assume they're not available
    // and use mock data since we removed flutter_sensors
    _proximityAvailable = false;
    _lightAvailable = false;
    _pressureAvailable = false;

    _logger.info('Sensor availability:');
    _logger.info('- Accelerometer: $_accelerometerAvailable');
    _logger.info('- Gyroscope: $_gyroscopeAvailable');
    _logger.info('- Magnetometer: $_magnetometerAvailable');
    _logger.info('- Proximity: $_proximityAvailable (simulated)');
    _logger.info('- Light: $_lightAvailable (simulated)');
    _logger.info('- Pressure: $_pressureAvailable (simulated)');
  }

  void _startMockStreamsIfNeeded() {
    // Always start mock streams for proximity, light, and pressure
    // since we removed flutter_sensors
    _logger.info('Starting mock proximity stream');
    Timer.periodic(const Duration(seconds: 5), (timer) {
      final bool isNear =
          DateTime.now().second % 10 < 5; // Simulate proximity changes
      final mockData = ProximityData(
        distance: isNear ? 0.0 : 5.0,
        isNear: isNear,
        timestamp: DateTime.now(),
        tenantId: 'default',
      );
      _lastProximityData = mockData;
      _proximityController.add(mockData);
    });

    _logger.info('Starting mock light sensor stream');
    Timer.periodic(const Duration(seconds: 3), (timer) {
      final base = 200.0;
      final variation = (DateTime.now().second % 60) * 10.0;
      final mockData = LightSensorData(
        illuminance: base + variation,
        timestamp: DateTime.now(),
        tenantId: 'default',
      );
      _lastLightData = mockData;
      _lightController.add(mockData);
    });

    _logger.info('Starting mock pressure stream');
    Timer.periodic(const Duration(seconds: 7), (timer) {
      final base = 1013.0;
      final variation = (DateTime.now().minute % 10) * 0.5;
      final mockData = PressureData(
        pressure: base + variation,
        timestamp: DateTime.now(),
        tenantId: 'default',
      );
      _lastPressureData = mockData;
      _pressureController.add(mockData);
    });
  }

  void dispose() {
    _proximitySubscription?.cancel();
    _lightSubscription?.cancel();
    _pressureSubscription?.cancel();
    _proximityController.close();
    _lightController.close();
    _pressureController.close();
  }

  @override
  Stream<AccelerometerData> getAccelerometerStream() {
    return accelerometerEventStream().map(
      (event) => AccelerometerData(
        x: event.x,
        y: event.y,
        z: event.z,
        timestamp: DateTime.now(),
        tenantId: 'default',
      ),
    );
  }

  @override
  Stream<GyroscopeData> getGyroscopeStream() {
    return gyroscopeEventStream().map(
      (event) => GyroscopeData(
        x: event.x,
        y: event.y,
        z: event.z,
        timestamp: DateTime.now(),
        tenantId: 'default',
      ),
    );
  }

  @override
  Stream<MagnetometerData> getMagnetometerStream() {
    return magnetometerEventStream().map(
      (event) => MagnetometerData(
        x: event.x,
        y: event.y,
        z: event.z,
        timestamp: DateTime.now(),
        tenantId: 'default',
      ),
    );
  }

  @override
  Stream<ProximityData> getProximityStream() {
    return _proximityController.stream;
  }

  @override
  Stream<LightSensorData> getLightStream() {
    return _lightController.stream;
  }

  @override
  Stream<PressureData> getPressureStream() {
    return _pressureController.stream;
  }

  @override
  Future<AccelerometerData> getAccelerometerData() async {
    final event = await accelerometerEventStream().first;
    return AccelerometerData(
      x: event.x,
      y: event.y,
      z: event.z,
      timestamp: DateTime.now(),
      tenantId: 'default',
    );
  }

  @override
  Future<GyroscopeData> getGyroscopeData() async {
    final event = await gyroscopeEventStream().first;
    return GyroscopeData(
      x: event.x,
      y: event.y,
      z: event.z,
      timestamp: DateTime.now(),
      tenantId: 'default',
    );
  }

  @override
  Future<MagnetometerData> getMagnetometerData() async {
    final event = await magnetometerEventStream().first;
    return MagnetometerData(
      x: event.x,
      y: event.y,
      z: event.z,
      timestamp: DateTime.now(),
      tenantId: 'default',
    );
  }

  @override
  Future<ProximityData?> getProximityData() async {
    // Always return mock data since we removed flutter_sensors
    final bool isNear = DateTime.now().second % 10 < 5;
    return ProximityData(
      distance: isNear ? 0.0 : 5.0,
      isNear: isNear,
      timestamp: DateTime.now(),
      tenantId: 'default',
    );
  }

  @override
  Future<LightSensorData?> getLightData() async {
    // Always return mock data since we removed flutter_sensors
    final base = 200.0;
    final variation = (DateTime.now().second % 60) * 10.0;
    return LightSensorData(
      illuminance: base + variation,
      timestamp: DateTime.now(),
      tenantId: 'default',
    );
  }

  @override
  Future<PressureData?> getPressureData() async {
    // Always return mock data since we removed flutter_sensors
    final base = 1013.0;
    final variation = (DateTime.now().minute % 10) * 0.5;
    return PressureData(
      pressure: base + variation,
      timestamp: DateTime.now(),
      tenantId: 'default',
    );
  }

  @override
  Future<CombinedSensorData> getCombinedSensorData() async {
    final accelerometer = await getAccelerometerData();
    final gyroscope = await getGyroscopeData();
    final magnetometer = await getMagnetometerData();
    final proximity = await getProximityData();
    final light = await getLightData();
    final pressure = await getPressureData();

    return CombinedSensorData(
      accelerometer: accelerometer,
      gyroscope: gyroscope,
      magnetometer: magnetometer,
      proximity: proximity,
      light: light,
      pressure: pressure,
      timestamp: DateTime.now(),
      tenantId: 'default',
    );
  }

  @override
  Future<List<String>> getAvailableSensors() async {
    final availableSensors = <String>[];

    if (_accelerometerAvailable) {
      availableSensors.add('accelerometer');
    }

    if (_gyroscopeAvailable) {
      availableSensors.add('gyroscope');
    }

    if (_magnetometerAvailable) {
      availableSensors.add('magnetometer');
    }

    // These are always simulated now
    availableSensors.add('proximity (simulated)');
    availableSensors.add('light (simulated)');
    availableSensors.add('pressure (simulated)');

    return availableSensors;
  }
}
