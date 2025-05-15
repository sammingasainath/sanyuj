import 'dart:async';

import 'package:logging/logging.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:sensor_api/domain/entities/sensor_data.dart';
import 'package:sensor_api/domain/entities/additional_sensors.dart';

import 'sensor_datasource.dart';

class SensorPlusImprovedDataSource implements SensorDataSource {
  final Logger _logger = Logger('SensorPlusImprovedDataSource');

  // Store streams controllers for sensors not available in sensors_plus
  final StreamController<ProximityData> _proximityController =
      StreamController<ProximityData>.broadcast();
  final StreamController<LightSensorData> _lightController =
      StreamController<LightSensorData>.broadcast();
  final StreamController<PressureData> _pressureController =
      StreamController<PressureData>.broadcast();

  // Track which sensors are available
  bool _accelerometerAvailable = false;
  bool _gyroscopeAvailable = false;
  bool _magnetometerAvailable = false;

  // Mock sensors (not available in sensors_plus)
  bool _proximityAvailable = false;
  bool _lightAvailable = false;
  bool _pressureAvailable = false;

  // Store last values of sensors for instant access
  ProximityData? _lastProximityData;
  LightSensorData? _lastLightData;
  PressureData? _lastPressureData;

  SensorPlusImprovedDataSource() {
    _checkAvailableSensors();
    _startMockStreamsForUnsupportedSensors();
  }

  Future<void> _checkAvailableSensors() async {
    try {
      await accelerometerEventStream().first.timeout(
        const Duration(milliseconds: 500),
      );
      _accelerometerAvailable = true;
    } catch (e) {
      _logger.warning('Accelerometer not available: $e');
      _accelerometerAvailable = false;
    }

    try {
      await gyroscopeEventStream().first.timeout(
        const Duration(milliseconds: 500),
      );
      _gyroscopeAvailable = true;
    } catch (e) {
      _logger.warning('Gyroscope not available: $e');
      _gyroscopeAvailable = false;
    }

    try {
      await magnetometerEventStream().first.timeout(
        const Duration(milliseconds: 500),
      );
      _magnetometerAvailable = true;
    } catch (e) {
      _logger.warning('Magnetometer not available: $e');
      _magnetometerAvailable = false;
    }

    // These sensors are not supported by sensors_plus, so we'll simulate them
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

  void _startMockStreamsForUnsupportedSensors() {
    // Start mock streams for proximity, light, and pressure sensors
    _startMockProximityStream();
    _startMockLightStream();
    _startMockPressureStream();
  }

  void _startMockProximityStream() {
    _logger.info('Starting mock proximity stream');
    Timer.periodic(const Duration(seconds: 2), (timer) {
      final bool isNear =
          DateTime.now().second % 10 < 5; // Simulate proximity changes
      final data = ProximityData(
        distance: isNear ? 0.0 : 5.0,
        isNear: isNear,
        timestamp: DateTime.now(),
        tenantId: 'default',
      );
      _lastProximityData = data;
      _proximityController.add(data);
    });
  }

  void _startMockLightStream() {
    _logger.info('Starting mock light sensor stream');
    Timer.periodic(const Duration(seconds: 3), (timer) {
      final base = 200.0;
      final variation = (DateTime.now().second % 60) * 10.0;
      final data = LightSensorData(
        illuminance: base + variation,
        timestamp: DateTime.now(),
        tenantId: 'default',
      );
      _lastLightData = data;
      _lightController.add(data);
    });
  }

  void _startMockPressureStream() {
    _logger.info('Starting mock pressure stream');
    Timer.periodic(const Duration(seconds: 5), (timer) {
      final base = 1013.0;
      final variation = (DateTime.now().minute % 10) * 0.5;
      final data = PressureData(
        pressure: base + variation,
        timestamp: DateTime.now(),
        tenantId: 'default',
      );
      _lastPressureData = data;
      _pressureController.add(data);
    });
  }

  void dispose() {
    _proximityController.close();
    _lightController.close();
    _pressureController.close();
  }

  @override
  Stream<AccelerometerData> getAccelerometerStream() {
    if (_accelerometerAvailable) {
      return accelerometerEventStream().map(
        (event) => AccelerometerData(
          x: event.x,
          y: event.y,
          z: event.z,
          timestamp: DateTime.now(),
          tenantId: 'default',
        ),
      );
    } else {
      // Return empty stream if sensor is not available
      final controller = StreamController<AccelerometerData>.broadcast();
      Timer.periodic(const Duration(milliseconds: 200), (timer) {
        controller.add(
          AccelerometerData(
            x: 0.5 * DateTime.now().second % 10,
            y: 1.5 * DateTime.now().second % 5,
            z: 9.8 + 0.1 * (DateTime.now().millisecond % 10),
            timestamp: DateTime.now(),
            tenantId: 'default',
          ),
        );
      });
      return controller.stream;
    }
  }

  @override
  Stream<GyroscopeData> getGyroscopeStream() {
    if (_gyroscopeAvailable) {
      return gyroscopeEventStream().map(
        (event) => GyroscopeData(
          x: event.x,
          y: event.y,
          z: event.z,
          timestamp: DateTime.now(),
          tenantId: 'default',
        ),
      );
    } else {
      // Return mock stream if sensor is not available
      final controller = StreamController<GyroscopeData>.broadcast();
      Timer.periodic(const Duration(milliseconds: 200), (timer) {
        controller.add(
          GyroscopeData(
            x: 0.01 * DateTime.now().second % 10,
            y: 0.02 * DateTime.now().second % 5,
            z: 0.03 * (DateTime.now().millisecond % 10),
            timestamp: DateTime.now(),
            tenantId: 'default',
          ),
        );
      });
      return controller.stream;
    }
  }

  @override
  Stream<MagnetometerData> getMagnetometerStream() {
    if (_magnetometerAvailable) {
      return magnetometerEventStream().map(
        (event) => MagnetometerData(
          x: event.x,
          y: event.y,
          z: event.z,
          timestamp: DateTime.now(),
          tenantId: 'default',
        ),
      );
    } else {
      // Return mock stream if sensor is not available
      final controller = StreamController<MagnetometerData>.broadcast();
      Timer.periodic(const Duration(milliseconds: 200), (timer) {
        controller.add(
          MagnetometerData(
            x: 25 + 5 * DateTime.now().second % 10,
            y: 40 + 3 * DateTime.now().second % 5,
            z: 10 + 2 * (DateTime.now().millisecond % 10),
            timestamp: DateTime.now(),
            tenantId: 'default',
          ),
        );
      });
      return controller.stream;
    }
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
    if (_accelerometerAvailable) {
      final event = await accelerometerEventStream().first;
      return AccelerometerData(
        x: event.x,
        y: event.y,
        z: event.z,
        timestamp: DateTime.now(),
        tenantId: 'default',
      );
    } else {
      return AccelerometerData(
        x: 0.5,
        y: 1.5,
        z: 9.8,
        timestamp: DateTime.now(),
        tenantId: 'default',
      );
    }
  }

  @override
  Future<GyroscopeData> getGyroscopeData() async {
    if (_gyroscopeAvailable) {
      final event = await gyroscopeEventStream().first;
      return GyroscopeData(
        x: event.x,
        y: event.y,
        z: event.z,
        timestamp: DateTime.now(),
        tenantId: 'default',
      );
    } else {
      return GyroscopeData(
        x: 0.01,
        y: 0.02,
        z: 0.03,
        timestamp: DateTime.now(),
        tenantId: 'default',
      );
    }
  }

  @override
  Future<MagnetometerData> getMagnetometerData() async {
    if (_magnetometerAvailable) {
      final event = await magnetometerEventStream().first;
      return MagnetometerData(
        x: event.x,
        y: event.y,
        z: event.z,
        timestamp: DateTime.now(),
        tenantId: 'default',
      );
    } else {
      return MagnetometerData(
        x: 25.0,
        y: 40.0,
        z: 10.0,
        timestamp: DateTime.now(),
        tenantId: 'default',
      );
    }
  }

  @override
  Future<ProximityData?> getProximityData() async {
    if (_lastProximityData != null) {
      return _lastProximityData!;
    }
    return _proximityController.stream.first;
  }

  @override
  Future<LightSensorData?> getLightData() async {
    if (_lastLightData != null) {
      return _lastLightData!;
    }
    return _lightController.stream.first;
  }

  @override
  Future<PressureData?> getPressureData() async {
    if (_lastPressureData != null) {
      return _lastPressureData!;
    }
    return _pressureController.stream.first;
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
    final List<String> sensorList = [];

    if (_accelerometerAvailable) sensorList.add('Accelerometer');
    if (_gyroscopeAvailable) sensorList.add('Gyroscope');
    if (_magnetometerAvailable) sensorList.add('Magnetometer');

    // Add mocked sensors with indication
    sensorList.add('Proximity (simulated)');
    sensorList.add('Light (simulated)');
    sensorList.add('Pressure (simulated)');

    return sensorList;
  }

  @override
  Stream<StepCounterData> getStepCounterStream() {
    final controller = StreamController<StepCounterData>.broadcast();
    Timer.periodic(const Duration(seconds: 2), (timer) {
      // Simulate step counting (incrementing)
      final steps =
          ((DateTime.now().millisecondsSinceEpoch / 1000) % 100).floor();
      controller.add(
        StepCounterData(
          steps: steps,
          timestamp: DateTime.now(),
          tenantId: 'default',
        ),
      );
    });
    return controller.stream;
  }

  @override
  Stream<StepDetectorData> getStepDetectorStream() {
    final controller = StreamController<StepDetectorData>.broadcast();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      // Simulate step detection (every few seconds)
      final detected = DateTime.now().second % 3 == 0;
      controller.add(
        StepDetectorData(
          detected: detected,
          timestamp: DateTime.now(),
          tenantId: 'default',
        ),
      );
    });
    return controller.stream;
  }

  @override
  Stream<RotationVectorData> getRotationVectorStream() {
    final controller = StreamController<RotationVectorData>.broadcast();
    Timer.periodic(const Duration(milliseconds: 200), (timer) {
      controller.add(_generateMockRotationVectorData());
    });
    return controller.stream;
  }

  @override
  Stream<OrientationData> getOrientationStream() {
    final controller = StreamController<OrientationData>.broadcast();
    Timer.periodic(const Duration(milliseconds: 200), (timer) {
      controller.add(_generateMockOrientationData());
    });
    return controller.stream;
  }

  @override
  Stream<GravityData> getGravityStream() {
    final controller = StreamController<GravityData>.broadcast();
    Timer.periodic(const Duration(milliseconds: 200), (timer) {
      controller.add(_generateMockGravityData());
    });
    return controller.stream;
  }

  @override
  Stream<LinearAccelerationData> getLinearAccelerationStream() {
    final controller = StreamController<LinearAccelerationData>.broadcast();
    Timer.periodic(const Duration(milliseconds: 200), (timer) {
      controller.add(_generateMockLinearAccelerationData());
    });
    return controller.stream;
  }

  @override
  Stream<GameRotationVectorData> getGameRotationVectorStream() {
    final controller = StreamController<GameRotationVectorData>.broadcast();
    Timer.periodic(const Duration(milliseconds: 200), (timer) {
      controller.add(_generateMockGameRotationVectorData());
    });
    return controller.stream;
  }

  @override
  Stream<GeomagneticRotationVectorData> getGeomagneticRotationVectorStream() {
    final controller =
        StreamController<GeomagneticRotationVectorData>.broadcast();
    Timer.periodic(const Duration(milliseconds: 200), (timer) {
      controller.add(_generateMockGeomagneticRotationVectorData());
    });
    return controller.stream;
  }

  @override
  Future<StepCounterData?> getStepCounterData() async {
    // Simulate step counting (incrementing)
    final steps =
        ((DateTime.now().millisecondsSinceEpoch / 1000) % 100).floor();
    return StepCounterData(
      steps: steps,
      timestamp: DateTime.now(),
      tenantId: 'default',
    );
  }

  @override
  Future<StepDetectorData?> getStepDetectorData() async {
    // Simulate step detection
    final detected = DateTime.now().second % 3 == 0;
    return StepDetectorData(
      detected: detected,
      timestamp: DateTime.now(),
      tenantId: 'default',
    );
  }

  @override
  Future<RotationVectorData?> getRotationVectorData() async {
    return _generateMockRotationVectorData();
  }

  @override
  Future<OrientationData?> getOrientationData() async {
    return _generateMockOrientationData();
  }

  @override
  Future<GravityData?> getGravityData() async {
    return _generateMockGravityData();
  }

  @override
  Future<LinearAccelerationData?> getLinearAccelerationData() async {
    return _generateMockLinearAccelerationData();
  }

  @override
  Future<GameRotationVectorData?> getGameRotationVectorData() async {
    return _generateMockGameRotationVectorData();
  }

  @override
  Future<GeomagneticRotationVectorData?>
  getGeomagneticRotationVectorData() async {
    return _generateMockGeomagneticRotationVectorData();
  }

  // Helper methods to generate mock data
  RotationVectorData _generateMockRotationVectorData() {
    final time = DateTime.now().millisecondsSinceEpoch / 1000;
    return RotationVectorData(
      x: 0.1 * sin(time),
      y: 0.2 * cos(time),
      z: 0.3 * sin(time * 0.5),
      w: 0.9 + 0.1 * cos(time * 0.3),
      timestamp: DateTime.now(),
      tenantId: 'default',
    );
  }

  OrientationData _generateMockOrientationData() {
    final time = DateTime.now().millisecondsSinceEpoch / 1000;
    return OrientationData(
      azimuth: (time % 360),
      pitch: 30 * sin(time * 0.1),
      roll: 20 * sin(time * 0.2),
      timestamp: DateTime.now(),
      tenantId: 'default',
    );
  }

  GravityData _generateMockGravityData() {
    return GravityData(
      x: 0.1,
      y: 0.2,
      z: 9.8,
      timestamp: DateTime.now(),
      tenantId: 'default',
    );
  }

  LinearAccelerationData _generateMockLinearAccelerationData() {
    final time = DateTime.now().millisecondsSinceEpoch / 1000;
    return LinearAccelerationData(
      x: 0.5 * sin(time),
      y: 0.5 * cos(time),
      z: 0.2 * sin(time * 2),
      timestamp: DateTime.now(),
      tenantId: 'default',
    );
  }

  GameRotationVectorData _generateMockGameRotationVectorData() {
    final time = DateTime.now().millisecondsSinceEpoch / 1000;
    return GameRotationVectorData(
      x: 0.1 * sin(time),
      y: 0.2 * cos(time),
      z: 0.3 * sin(time * 0.5),
      w: 0.9 + 0.1 * cos(time * 0.3),
      timestamp: DateTime.now(),
      tenantId: 'default',
    );
  }

  GeomagneticRotationVectorData _generateMockGeomagneticRotationVectorData() {
    final time = DateTime.now().millisecondsSinceEpoch / 1000;
    return GeomagneticRotationVectorData(
      x: 0.1 * sin(time),
      y: 0.2 * cos(time),
      z: 0.3 * sin(time * 0.5),
      w: 0.9 + 0.1 * cos(time * 0.3),
      timestamp: DateTime.now(),
      tenantId: 'default',
    );
  }

  // Helper functions for the mock data generation
  double sin(double value) {
    return DateTime.now().millisecondsSinceEpoch % 100 / 100 * value;
  }

  double cos(double value) {
    return (1 - (DateTime.now().millisecondsSinceEpoch % 100) / 100) * value;
  }
}
