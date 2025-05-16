import 'dart:async';

import 'package:sensors_plus/sensors_plus.dart';
import 'package:sensor_api/domain/entities/sensor_data.dart';
import 'package:sensor_api/domain/entities/additional_sensors.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';

// Remove the redefinition of sensor streams as they're already defined in sensors_plus

abstract class SensorDataSource {
  // Basic sensors
  Stream<AccelerometerData> getAccelerometerStream();
  Stream<GyroscopeData> getGyroscopeStream();
  Stream<MagnetometerData> getMagnetometerStream();
  Stream<ProximityData> getProximityStream();
  Stream<LightSensorData> getLightStream();
  Stream<PressureData> getPressureStream();

  // Additional sensors
  Stream<StepCounterData> getStepCounterStream();
  Stream<StepDetectorData> getStepDetectorStream();
  Stream<RotationVectorData> getRotationVectorStream();
  Stream<OrientationData> getOrientationStream();
  Stream<GravityData> getGravityStream();
  Stream<LinearAccelerationData> getLinearAccelerationStream();
  Stream<GameRotationVectorData> getGameRotationVectorStream();
  Stream<GeomagneticRotationVectorData> getGeomagneticRotationVectorStream();

  // New sensors
  Stream<SignificantMotionData> getSignificantMotionStream();
  Stream<StationaryDetectData> getStationaryDetectStream();
  Stream<WakeGestureData> getWakeGestureStream();
  Stream<PickupDetectData> getPickupDetectStream();
  Stream<AccelerometerUncalibratedData> getAccelerometerUncalibratedStream();
  Stream<MagneticFieldUncalibratedData> getMagneticFieldUncalibratedStream();
  Stream<GyroscopeUncalibratedData> getGyroscopeUncalibratedStream();

  // One-time fetch methods for basic sensors
  Future<AccelerometerData> getAccelerometerData();
  Future<GyroscopeData> getGyroscopeData();
  Future<MagnetometerData> getMagnetometerData();
  Future<ProximityData?> getProximityData();
  Future<LightSensorData?> getLightData();
  Future<PressureData?> getPressureData();

  // One-time fetch methods for additional sensors
  Future<StepCounterData?> getStepCounterData();
  Future<StepDetectorData?> getStepDetectorData();
  Future<RotationVectorData?> getRotationVectorData();
  Future<OrientationData?> getOrientationData();
  Future<GravityData?> getGravityData();
  Future<LinearAccelerationData?> getLinearAccelerationData();
  Future<GameRotationVectorData?> getGameRotationVectorData();
  Future<GeomagneticRotationVectorData?> getGeomagneticRotationVectorData();

  // One-time fetch methods for new sensors
  Future<SignificantMotionData?> getSignificantMotionData();
  Future<StationaryDetectData?> getStationaryDetectData();
  Future<WakeGestureData?> getWakeGestureData();
  Future<PickupDetectData?> getPickupDetectData();
  Future<AccelerometerUncalibratedData?> getAccelerometerUncalibratedData();
  Future<MagneticFieldUncalibratedData?> getMagneticFieldUncalibratedData();
  Future<GyroscopeUncalibratedData?> getGyroscopeUncalibratedData();

  // Combined data methods
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

  // Stream controllers for new sensors
  final StreamController<SignificantMotionData> _significantMotionController =
      StreamController<SignificantMotionData>.broadcast();
  final StreamController<StationaryDetectData> _stationaryDetectController =
      StreamController<StationaryDetectData>.broadcast();
  final StreamController<WakeGestureData> _wakeGestureController =
      StreamController<WakeGestureData>.broadcast();
  final StreamController<PickupDetectData> _pickupDetectController =
      StreamController<PickupDetectData>.broadcast();
  final StreamController<AccelerometerUncalibratedData>
  _accelerometerUncalibratedController =
      StreamController<AccelerometerUncalibratedData>.broadcast();
  final StreamController<MagneticFieldUncalibratedData>
  _magneticFieldUncalibratedController =
      StreamController<MagneticFieldUncalibratedData>.broadcast();
  final StreamController<GyroscopeUncalibratedData>
  _gyroscopeUncalibratedController =
      StreamController<GyroscopeUncalibratedData>.broadcast();

  // Store subscription references to cancel on dispose
  StreamSubscription? _proximitySubscription;
  StreamSubscription? _lightSubscription;
  StreamSubscription? _pressureSubscription;

  // Subscriptions for new sensors
  StreamSubscription? _significantMotionSubscription;
  StreamSubscription? _stationaryDetectSubscription;
  StreamSubscription? _wakeGestureSubscription;
  StreamSubscription? _pickupDetectSubscription;
  StreamSubscription? _accelerometerUncalibratedSubscription;
  StreamSubscription? _magneticFieldUncalibratedSubscription;
  StreamSubscription? _gyroscopeUncalibratedSubscription;

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

  // Mock values for new sensors
  final SignificantMotionData _mockSignificantMotionData =
      SignificantMotionData(
        detected: false,
        timestamp: DateTime.now(),
        tenantId: 'default',
      );

  final StationaryDetectData _mockStationaryDetectData = StationaryDetectData(
    isStationary: true,
    timestamp: DateTime.now(),
    tenantId: 'default',
  );

  final WakeGestureData _mockWakeGestureData = WakeGestureData(
    detected: false,
    timestamp: DateTime.now(),
    tenantId: 'default',
  );

  final PickupDetectData _mockPickupDetectData = PickupDetectData(
    detected: false,
    timestamp: DateTime.now(),
    tenantId: 'default',
  );

  final AccelerometerUncalibratedData _mockAccelerometerUncalibratedData =
      AccelerometerUncalibratedData(
        x: 0.0,
        y: 0.0,
        z: 0.0,
        xBias: 0.01,
        yBias: 0.01,
        zBias: 0.01,
        timestamp: DateTime.now(),
        tenantId: 'default',
      );

  final MagneticFieldUncalibratedData _mockMagneticFieldUncalibratedData =
      MagneticFieldUncalibratedData(
        x: 0.0,
        y: 0.0,
        z: 0.0,
        xBias: 0.01,
        yBias: 0.01,
        zBias: 0.01,
        timestamp: DateTime.now(),
        tenantId: 'default',
      );

  final GyroscopeUncalibratedData _mockGyroscopeUncalibratedData =
      GyroscopeUncalibratedData(
        x: 0.0,
        y: 0.0,
        z: 0.0,
        xDrift: 0.01,
        yDrift: 0.01,
        zDrift: 0.01,
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

  // New sensor availability flags
  bool _significantMotionAvailable = false;
  bool _stationaryDetectAvailable = false;
  bool _wakeGestureAvailable = false;
  bool _pickupDetectAvailable = false;
  bool _accelerometerUncalibratedAvailable = false;
  bool _magneticFieldUncalibratedAvailable = false;
  bool _gyroscopeUncalibratedAvailable = false;

  // Store last values of sensors for instant access
  ProximityData? _lastProximityData;
  LightSensorData? _lastLightData;
  PressureData? _lastPressureData;

  // Last values for new sensors
  SignificantMotionData? _lastSignificantMotionData;
  StationaryDetectData? _lastStationaryDetectData;
  WakeGestureData? _lastWakeGestureData;
  PickupDetectData? _lastPickupDetectData;
  AccelerometerUncalibratedData? _lastAccelerometerUncalibratedData;
  MagneticFieldUncalibratedData? _lastMagneticFieldUncalibratedData;
  GyroscopeUncalibratedData? _lastGyroscopeUncalibratedData;

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

    // For new sensors, we'll assume they're not available
    // and use mock data
    _significantMotionAvailable = false;
    _stationaryDetectAvailable = false;
    _wakeGestureAvailable = false;
    _pickupDetectAvailable = false;
    _accelerometerUncalibratedAvailable = false;
    _magneticFieldUncalibratedAvailable = false;
    _gyroscopeUncalibratedAvailable = false;

    _logger.info('Sensor availability:');
    _logger.info('- Accelerometer: $_accelerometerAvailable');
    _logger.info('- Gyroscope: $_gyroscopeAvailable');
    _logger.info('- Magnetometer: $_magnetometerAvailable');
    _logger.info('- Proximity: $_proximityAvailable (simulated)');
    _logger.info('- Light: $_lightAvailable (simulated)');
    _logger.info('- Pressure: $_pressureAvailable (simulated)');
    _logger.info(
      '- Significant Motion: $_significantMotionAvailable (simulated)',
    );
    _logger.info(
      '- Stationary Detect: $_stationaryDetectAvailable (simulated)',
    );
    _logger.info('- Wake Gesture: $_wakeGestureAvailable (simulated)');
    _logger.info('- Pickup Detect: $_pickupDetectAvailable (simulated)');
    _logger.info(
      '- Accelerometer Uncalibrated: $_accelerometerUncalibratedAvailable (simulated)',
    );
    _logger.info(
      '- Magnetic Field Uncalibrated: $_magneticFieldUncalibratedAvailable (simulated)',
    );
    _logger.info(
      '- Gyroscope Uncalibrated: $_gyroscopeUncalibratedAvailable (simulated)',
    );
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

    // Start mock streams for new sensors
    _logger.info('Starting mock significant motion stream');
    Timer.periodic(const Duration(seconds: 10), (timer) {
      final detected =
          DateTime.now().second % 15 ==
          0; // Simulate occasional significant motion
      final mockData = SignificantMotionData(
        detected: detected,
        timestamp: DateTime.now(),
        tenantId: 'default',
      );
      _lastSignificantMotionData = mockData;
      _significantMotionController.add(mockData);
    });

    _logger.info('Starting mock stationary detect stream');
    Timer.periodic(const Duration(seconds: 7), (timer) {
      final isStationary =
          DateTime.now().second % 20 <
          15; // Simulate being stationary most of the time
      final mockData = StationaryDetectData(
        isStationary: isStationary,
        timestamp: DateTime.now(),
        tenantId: 'default',
      );
      _lastStationaryDetectData = mockData;
      _stationaryDetectController.add(mockData);
    });

    _logger.info('Starting mock wake gesture stream');
    Timer.periodic(const Duration(seconds: 20), (timer) {
      final detected = DateTime.now().second == 0; // Simulate rare wake gesture
      final mockData = WakeGestureData(
        detected: detected,
        timestamp: DateTime.now(),
        tenantId: 'default',
      );
      _lastWakeGestureData = mockData;
      _wakeGestureController.add(mockData);
    });

    _logger.info('Starting mock pickup detect stream');
    Timer.periodic(const Duration(seconds: 8), (timer) {
      final detected =
          DateTime.now().second % 30 == 0; // Simulate occasional pickup
      final mockData = PickupDetectData(
        detected: detected,
        timestamp: DateTime.now(),
        tenantId: 'default',
      );
      _lastPickupDetectData = mockData;
      _pickupDetectController.add(mockData);
    });

    _logger.info('Starting mock accelerometer uncalibrated stream');
    Timer.periodic(const Duration(milliseconds: 200), (timer) {
      final time = DateTime.now().millisecondsSinceEpoch / 1000;
      final mockData = AccelerometerUncalibratedData(
        x: sin(time * 0.5),
        y: cos(time * 0.5),
        z: sin(time * 0.2),
        xBias: 0.05,
        yBias: 0.03,
        zBias: 0.02,
        timestamp: DateTime.now(),
        tenantId: 'default',
      );
      _lastAccelerometerUncalibratedData = mockData;
      _accelerometerUncalibratedController.add(mockData);
    });

    _logger.info('Starting mock magnetic field uncalibrated stream');
    Timer.periodic(const Duration(milliseconds: 200), (timer) {
      final time = DateTime.now().millisecondsSinceEpoch / 1000;
      final mockData = MagneticFieldUncalibratedData(
        x: 20 + sin(time * 0.1) * 5,
        y: 40 + cos(time * 0.1) * 3,
        z: 10 + sin(time * 0.05) * 2,
        xBias: 1.5,
        yBias: 2.0,
        zBias: 0.5,
        timestamp: DateTime.now(),
        tenantId: 'default',
      );
      _lastMagneticFieldUncalibratedData = mockData;
      _magneticFieldUncalibratedController.add(mockData);
    });

    _logger.info('Starting mock gyroscope uncalibrated stream');
    Timer.periodic(const Duration(milliseconds: 200), (timer) {
      final time = DateTime.now().millisecondsSinceEpoch / 1000;
      final mockData = GyroscopeUncalibratedData(
        x: sin(time * 0.3) * 0.5,
        y: cos(time * 0.3) * 0.5,
        z: sin(time * 0.15) * 0.3,
        xDrift: 0.02,
        yDrift: 0.01,
        zDrift: 0.015,
        timestamp: DateTime.now(),
        tenantId: 'default',
      );
      _lastGyroscopeUncalibratedData = mockData;
      _gyroscopeUncalibratedController.add(mockData);
    });
  }

  void dispose() {
    _proximitySubscription?.cancel();
    _lightSubscription?.cancel();
    _pressureSubscription?.cancel();
    _proximityController.close();
    _lightController.close();
    _pressureController.close();

    // Cancel new sensor subscriptions
    _significantMotionSubscription?.cancel();
    _stationaryDetectSubscription?.cancel();
    _wakeGestureSubscription?.cancel();
    _pickupDetectSubscription?.cancel();
    _accelerometerUncalibratedSubscription?.cancel();
    _magneticFieldUncalibratedSubscription?.cancel();
    _gyroscopeUncalibratedSubscription?.cancel();

    // Close new sensor controllers
    _significantMotionController.close();
    _stationaryDetectController.close();
    _wakeGestureController.close();
    _pickupDetectController.close();
    _accelerometerUncalibratedController.close();
    _magneticFieldUncalibratedController.close();
    _gyroscopeUncalibratedController.close();
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

    // Get data from additional sensors
    final stepCounter = await getStepCounterData();
    final stepDetector = await getStepDetectorData();
    final rotationVector = await getRotationVectorData();
    final orientation = await getOrientationData();
    final gravity = await getGravityData();
    final linearAcceleration = await getLinearAccelerationData();
    final gameRotationVector = await getGameRotationVectorData();
    final geomagneticRotationVector = await getGeomagneticRotationVectorData();

    // Get data from new sensors
    final significantMotion = await getSignificantMotionData();
    final stationaryDetect = await getStationaryDetectData();
    final wakeGesture = await getWakeGestureData();
    final pickupDetect = await getPickupDetectData();
    final accelerometerUncalibrated = await getAccelerometerUncalibratedData();
    final magneticFieldUncalibrated = await getMagneticFieldUncalibratedData();
    final gyroscopeUncalibrated = await getGyroscopeUncalibratedData();

    return CombinedSensorData(
      // Basic sensors
      accelerometer: accelerometer,
      gyroscope: gyroscope,
      magnetometer: magnetometer,
      proximity: proximity,
      light: light,
      pressure: pressure,

      // Additional sensors
      stepCounter: stepCounter,
      stepDetector: stepDetector,
      rotationVector: rotationVector,
      orientation: orientation,
      gravity: gravity,
      linearAcceleration: linearAcceleration,
      gameRotationVector: gameRotationVector,
      geomagneticRotationVector: geomagneticRotationVector,

      // New sensors
      significantMotion: significantMotion,
      stationaryDetect: stationaryDetect,
      wakeGesture: wakeGesture,
      pickupDetect: pickupDetect,
      accelerometerUncalibrated: accelerometerUncalibrated,
      magneticFieldUncalibrated: magneticFieldUncalibrated,
      gyroscopeUncalibrated: gyroscopeUncalibrated,

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

    // New simulated sensors
    availableSensors.add('significant motion (simulated)');
    availableSensors.add('stationary detect (simulated)');
    availableSensors.add('wake gesture (simulated)');
    availableSensors.add('pickup detect (simulated)');
    availableSensors.add('accelerometer uncalibrated (simulated)');
    availableSensors.add('magnetic field uncalibrated (simulated)');
    availableSensors.add('gyroscope uncalibrated (simulated)');

    return availableSensors;
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

  // Stream getters for new sensors
  @override
  Stream<SignificantMotionData> getSignificantMotionStream() {
    return _significantMotionController.stream;
  }

  @override
  Stream<StationaryDetectData> getStationaryDetectStream() {
    return _stationaryDetectController.stream;
  }

  @override
  Stream<WakeGestureData> getWakeGestureStream() {
    return _wakeGestureController.stream;
  }

  @override
  Stream<PickupDetectData> getPickupDetectStream() {
    return _pickupDetectController.stream;
  }

  @override
  Stream<AccelerometerUncalibratedData> getAccelerometerUncalibratedStream() {
    return _accelerometerUncalibratedController.stream;
  }

  @override
  Stream<MagneticFieldUncalibratedData> getMagneticFieldUncalibratedStream() {
    return _magneticFieldUncalibratedController.stream;
  }

  @override
  Stream<GyroscopeUncalibratedData> getGyroscopeUncalibratedStream() {
    return _gyroscopeUncalibratedController.stream;
  }

  // One-time fetch methods for new sensors
  @override
  Future<SignificantMotionData?> getSignificantMotionData() async {
    final detected = DateTime.now().second % 15 == 0;
    return SignificantMotionData(
      detected: detected,
      timestamp: DateTime.now(),
      tenantId: 'default',
    );
  }

  @override
  Future<StationaryDetectData?> getStationaryDetectData() async {
    final isStationary = DateTime.now().second % 20 < 15;
    return StationaryDetectData(
      isStationary: isStationary,
      timestamp: DateTime.now(),
      tenantId: 'default',
    );
  }

  @override
  Future<WakeGestureData?> getWakeGestureData() async {
    final detected = DateTime.now().second == 0;
    return WakeGestureData(
      detected: detected,
      timestamp: DateTime.now(),
      tenantId: 'default',
    );
  }

  @override
  Future<PickupDetectData?> getPickupDetectData() async {
    final detected = DateTime.now().second % 30 == 0;
    return PickupDetectData(
      detected: detected,
      timestamp: DateTime.now(),
      tenantId: 'default',
    );
  }

  @override
  Future<AccelerometerUncalibratedData?>
  getAccelerometerUncalibratedData() async {
    final time = DateTime.now().millisecondsSinceEpoch / 1000;
    return AccelerometerUncalibratedData(
      x: sin(time * 0.5),
      y: cos(time * 0.5),
      z: sin(time * 0.2),
      xBias: 0.05,
      yBias: 0.03,
      zBias: 0.02,
      timestamp: DateTime.now(),
      tenantId: 'default',
    );
  }

  @override
  Future<MagneticFieldUncalibratedData?>
  getMagneticFieldUncalibratedData() async {
    final time = DateTime.now().millisecondsSinceEpoch / 1000;
    return MagneticFieldUncalibratedData(
      x: 20 + sin(time * 0.1) * 5,
      y: 40 + cos(time * 0.1) * 3,
      z: 10 + sin(time * 0.05) * 2,
      xBias: 1.5,
      yBias: 2.0,
      zBias: 0.5,
      timestamp: DateTime.now(),
      tenantId: 'default',
    );
  }

  @override
  Future<GyroscopeUncalibratedData?> getGyroscopeUncalibratedData() async {
    final time = DateTime.now().millisecondsSinceEpoch / 1000;
    return GyroscopeUncalibratedData(
      x: sin(time * 0.3) * 0.5,
      y: cos(time * 0.3) * 0.5,
      z: sin(time * 0.15) * 0.3,
      xDrift: 0.02,
      yDrift: 0.01,
      zDrift: 0.015,
      timestamp: DateTime.now(),
      tenantId: 'default',
    );
  }
}

// Helper functions for the mock data generation
double sin(double value) {
  return DateTime.now().millisecondsSinceEpoch % 100 / 100 * value;
}

double cos(double value) {
  return (1 - (DateTime.now().millisecondsSinceEpoch % 100) / 100) * value;
}
