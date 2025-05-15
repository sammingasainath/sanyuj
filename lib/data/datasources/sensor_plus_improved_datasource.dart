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

  // Stream controllers for new sensors
  final StreamController<StepCounterData> _stepCounterController =
      StreamController<StepCounterData>.broadcast();
  final StreamController<StepDetectorData> _stepDetectorController =
      StreamController<StepDetectorData>.broadcast();
  final StreamController<RotationVectorData> _rotationVectorController =
      StreamController<RotationVectorData>.broadcast();
  final StreamController<OrientationData> _orientationController =
      StreamController<OrientationData>.broadcast();
  final StreamController<GravityData> _gravityController =
      StreamController<GravityData>.broadcast();
  final StreamController<LinearAccelerationData> _linearAccelerationController =
      StreamController<LinearAccelerationData>.broadcast();
  final StreamController<GameRotationVectorData> _gameRotationVectorController =
      StreamController<GameRotationVectorData>.broadcast();
  final StreamController<GeomagneticRotationVectorData>
  _geomagneticRotationVectorController =
      StreamController<GeomagneticRotationVectorData>.broadcast();

  // Stream controllers for new additional sensors
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

  // Track which sensors are available
  bool _accelerometerAvailable = false;
  bool _gyroscopeAvailable = false;
  bool _magnetometerAvailable = false;

  // Mock sensors (not available in sensors_plus)
  bool _proximityAvailable = false;
  bool _lightAvailable = false;
  bool _pressureAvailable = false;

  // Track new sensors availability
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

  // Last values for additional sensors
  StepCounterData? _lastStepCounterData;
  StepDetectorData? _lastStepDetectorData;
  RotationVectorData? _lastRotationVectorData;
  OrientationData? _lastOrientationData;
  GravityData? _lastGravityData;
  LinearAccelerationData? _lastLinearAccelerationData;
  GameRotationVectorData? _lastGameRotationVectorData;
  GeomagneticRotationVectorData? _lastGeomagneticRotationVectorData;

  // Last values for new sensors
  SignificantMotionData? _lastSignificantMotionData;
  StationaryDetectData? _lastStationaryDetectData;
  WakeGestureData? _lastWakeGestureData;
  PickupDetectData? _lastPickupDetectData;
  AccelerometerUncalibratedData? _lastAccelerometerUncalibratedData;
  MagneticFieldUncalibratedData? _lastMagneticFieldUncalibratedData;
  GyroscopeUncalibratedData? _lastGyroscopeUncalibratedData;

  SensorPlusImprovedDataSource() {
    _checkAvailableSensors();
    _startMockStreamsForUnsupportedSensors();
    _startMockStreamsForNewSensors();
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

  void _startMockStreamsForNewSensors() {
    // Significant Motion
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

    // Stationary Detect
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

    // Wake Gesture
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

    // Pickup Detect
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

    // Accelerometer Uncalibrated
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

    // Magnetic Field Uncalibrated
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

    // Gyroscope Uncalibrated
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
    _proximityController.close();
    _lightController.close();
    _pressureController.close();

    _stepCounterController.close();
    _stepDetectorController.close();
    _rotationVectorController.close();
    _orientationController.close();
    _gravityController.close();
    _linearAccelerationController.close();
    _gameRotationVectorController.close();
    _geomagneticRotationVectorController.close();

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

    // Get additional sensor data
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
    final List<String> sensorList = [];

    if (_accelerometerAvailable) sensorList.add('Accelerometer');
    if (_gyroscopeAvailable) sensorList.add('Gyroscope');
    if (_magnetometerAvailable) sensorList.add('Magnetometer');

    // Add mocked sensors with indication
    sensorList.add('Proximity (simulated)');
    sensorList.add('Light (simulated)');
    sensorList.add('Pressure (simulated)');

    // Additional simulated sensors
    sensorList.add('Step Counter (simulated)');
    sensorList.add('Step Detector (simulated)');
    sensorList.add('Rotation Vector (simulated)');
    sensorList.add('Orientation (simulated)');
    sensorList.add('Gravity (simulated)');
    sensorList.add('Linear Acceleration (simulated)');
    sensorList.add('Game Rotation Vector (simulated)');
    sensorList.add('Geomagnetic Rotation Vector (simulated)');

    // New simulated sensors
    sensorList.add('Significant Motion (simulated)');
    sensorList.add('Stationary Detect (simulated)');
    sensorList.add('Wake Gesture (simulated)');
    sensorList.add('Pickup Detect (simulated)');
    sensorList.add('Accelerometer Uncalibrated (simulated)');
    sensorList.add('Magnetic Field Uncalibrated (simulated)');
    sensorList.add('Gyroscope Uncalibrated (simulated)');

    return sensorList;
  }

  @override
  Stream<StepCounterData> getStepCounterStream() {
    return _stepCounterController.stream;
  }

  @override
  Stream<StepDetectorData> getStepDetectorStream() {
    return _stepDetectorController.stream;
  }

  @override
  Stream<RotationVectorData> getRotationVectorStream() {
    return _rotationVectorController.stream;
  }

  @override
  Stream<OrientationData> getOrientationStream() {
    return _orientationController.stream;
  }

  @override
  Stream<GravityData> getGravityStream() {
    return _gravityController.stream;
  }

  @override
  Stream<LinearAccelerationData> getLinearAccelerationStream() {
    return _linearAccelerationController.stream;
  }

  @override
  Stream<GameRotationVectorData> getGameRotationVectorStream() {
    return _gameRotationVectorController.stream;
  }

  @override
  Stream<GeomagneticRotationVectorData> getGeomagneticRotationVectorStream() {
    return _geomagneticRotationVectorController.stream;
  }

  @override
  Future<StepCounterData?> getStepCounterData() async {
    if (_lastStepCounterData != null) {
      return _lastStepCounterData!;
    }
    return _stepCounterController.stream.first;
  }

  @override
  Future<StepDetectorData?> getStepDetectorData() async {
    if (_lastStepDetectorData != null) {
      return _lastStepDetectorData!;
    }
    return _stepDetectorController.stream.first;
  }

  @override
  Future<RotationVectorData?> getRotationVectorData() async {
    if (_lastRotationVectorData != null) {
      return _lastRotationVectorData!;
    }
    return _rotationVectorController.stream.first;
  }

  @override
  Future<OrientationData?> getOrientationData() async {
    if (_lastOrientationData != null) {
      return _lastOrientationData!;
    }
    return _orientationController.stream.first;
  }

  @override
  Future<GravityData?> getGravityData() async {
    if (_lastGravityData != null) {
      return _lastGravityData!;
    }
    return _gravityController.stream.first;
  }

  @override
  Future<LinearAccelerationData?> getLinearAccelerationData() async {
    if (_lastLinearAccelerationData != null) {
      return _lastLinearAccelerationData!;
    }
    return _linearAccelerationController.stream.first;
  }

  @override
  Future<GameRotationVectorData?> getGameRotationVectorData() async {
    if (_lastGameRotationVectorData != null) {
      return _lastGameRotationVectorData!;
    }
    return _gameRotationVectorController.stream.first;
  }

  @override
  Future<GeomagneticRotationVectorData?>
  getGeomagneticRotationVectorData() async {
    if (_lastGeomagneticRotationVectorData != null) {
      return _lastGeomagneticRotationVectorData!;
    }
    return _geomagneticRotationVectorController.stream.first;
  }

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

  @override
  Future<SignificantMotionData?> getSignificantMotionData() async {
    if (_lastSignificantMotionData != null) {
      return _lastSignificantMotionData!;
    }
    return _significantMotionController.stream.first;
  }

  @override
  Future<StationaryDetectData?> getStationaryDetectData() async {
    if (_lastStationaryDetectData != null) {
      return _lastStationaryDetectData!;
    }
    return _stationaryDetectController.stream.first;
  }

  @override
  Future<WakeGestureData?> getWakeGestureData() async {
    if (_lastWakeGestureData != null) {
      return _lastWakeGestureData!;
    }
    return _wakeGestureController.stream.first;
  }

  @override
  Future<PickupDetectData?> getPickupDetectData() async {
    if (_lastPickupDetectData != null) {
      return _lastPickupDetectData!;
    }
    return _pickupDetectController.stream.first;
  }

  @override
  Future<AccelerometerUncalibratedData?>
  getAccelerometerUncalibratedData() async {
    if (_lastAccelerometerUncalibratedData != null) {
      return _lastAccelerometerUncalibratedData!;
    }
    return _accelerometerUncalibratedController.stream.first;
  }

  @override
  Future<MagneticFieldUncalibratedData?>
  getMagneticFieldUncalibratedData() async {
    if (_lastMagneticFieldUncalibratedData != null) {
      return _lastMagneticFieldUncalibratedData!;
    }
    return _magneticFieldUncalibratedController.stream.first;
  }

  @override
  Future<GyroscopeUncalibratedData?> getGyroscopeUncalibratedData() async {
    if (_lastGyroscopeUncalibratedData != null) {
      return _lastGyroscopeUncalibratedData!;
    }
    return _gyroscopeUncalibratedController.stream.first;
  }
}

// Helper method for simulating sine/cosine patterns
double sin(double value) {
  return (DateTime.now().millisecondsSinceEpoch % 1000) / 1000 * value;
}

double cos(double value) {
  return (1 - (DateTime.now().millisecondsSinceEpoch % 1000) / 1000) * value;
}
