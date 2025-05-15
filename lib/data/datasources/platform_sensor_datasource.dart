import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:sensor_api/domain/entities/sensor_data.dart';
import 'package:sensor_api/domain/entities/additional_sensors.dart';

import 'sensor_datasource.dart';

/// A data source that combines sensors_plus with platform-specific method channels
/// for accessing sensors not available in sensors_plus
class PlatformSensorDataSource implements SensorDataSource {
  final Logger _logger = Logger('PlatformSensorDataSource');

  // Method channels for communicating with platform code
  static const MethodChannel _methodChannel = MethodChannel(
    'com.sensorapi/sensors',
  );

  // Event channels for streaming sensor data
  static const EventChannel _proximityChannel = EventChannel(
    'com.sensorapi/proximity',
  );
  static const EventChannel _lightChannel = EventChannel('com.sensorapi/light');
  static const EventChannel _pressureChannel = EventChannel(
    'com.sensorapi/pressure',
  );

  // Additional sensor channels
  static const EventChannel _stepCounterChannel = EventChannel(
    'com.sensorapi/step_counter',
  );
  static const EventChannel _stepDetectorChannel = EventChannel(
    'com.sensorapi/step_detector',
  );
  static const EventChannel _rotationVectorChannel = EventChannel(
    'com.sensorapi/rotation_vector',
  );
  static const EventChannel _orientationChannel = EventChannel(
    'com.sensorapi/orientation',
  );
  static const EventChannel _gravityChannel = EventChannel(
    'com.sensorapi/gravity',
  );
  static const EventChannel _linearAccelerationChannel = EventChannel(
    'com.sensorapi/linear_acceleration',
  );
  static const EventChannel _gameRotationVectorChannel = EventChannel(
    'com.sensorapi/game_rotation_vector',
  );
  static const EventChannel _geomagneticRotationVectorChannel = EventChannel(
    'com.sensorapi/geomagnetic_rotation_vector',
  );

  // Stream controllers for platform events
  final _proximityStreamController =
      StreamController<ProximityData>.broadcast();
  final _lightStreamController = StreamController<LightSensorData>.broadcast();
  final _pressureStreamController = StreamController<PressureData>.broadcast();

  // Stream controllers for additional sensors
  final _stepCounterStreamController =
      StreamController<StepCounterData>.broadcast();
  final _stepDetectorStreamController =
      StreamController<StepDetectorData>.broadcast();
  final _rotationVectorStreamController =
      StreamController<RotationVectorData>.broadcast();
  final _orientationStreamController =
      StreamController<OrientationData>.broadcast();
  final _gravityStreamController = StreamController<GravityData>.broadcast();
  final _linearAccelerationStreamController =
      StreamController<LinearAccelerationData>.broadcast();
  final _gameRotationVectorStreamController =
      StreamController<GameRotationVectorData>.broadcast();
  final _geomagneticRotationVectorStreamController =
      StreamController<GeomagneticRotationVectorData>.broadcast();

  // Subscriptions to maintain
  StreamSubscription? _proximitySubscription;
  StreamSubscription? _lightSubscription;
  StreamSubscription? _pressureSubscription;

  // Additional subscriptions
  StreamSubscription? _stepCounterSubscription;
  StreamSubscription? _stepDetectorSubscription;
  StreamSubscription? _rotationVectorSubscription;
  StreamSubscription? _orientationSubscription;
  StreamSubscription? _gravitySubscription;
  StreamSubscription? _linearAccelerationSubscription;
  StreamSubscription? _gameRotationVectorSubscription;
  StreamSubscription? _geomagneticRotationVectorSubscription;

  // Track which sensors are available
  bool _accelerometerAvailable = false;
  bool _gyroscopeAvailable = false;
  bool _magnetometerAvailable = false;
  bool _proximityAvailable = false;
  bool _lightAvailable = false;
  bool _pressureAvailable = false;

  // Additional sensor availability
  bool _stepCounterAvailable = false;
  bool _stepDetectorAvailable = false;
  bool _rotationVectorAvailable = false;
  bool _orientationAvailable = false;
  bool _gravityAvailable = false;
  bool _linearAccelerationAvailable = false;
  bool _gameRotationVectorAvailable = false;
  bool _geomagneticRotationVectorAvailable = false;

  // Track which sensors are actually working
  bool _proximityWorking = false;
  bool _lightWorking = false;
  bool _pressureWorking = false;

  // Additional sensor working status
  bool _stepCounterWorking = false;
  bool _stepDetectorWorking = false;
  bool _rotationVectorWorking = false;
  bool _orientationWorking = false;
  bool _gravityWorking = false;
  bool _linearAccelerationWorking = false;
  bool _gameRotationVectorWorking = false;
  bool _geomagneticRotationVectorWorking = false;

  // Last known values for sensors
  ProximityData? _lastProximityData;
  LightSensorData? _lastLightData;
  PressureData? _lastPressureData;

  // Last known values for additional sensors
  StepCounterData? _lastStepCounterData;
  StepDetectorData? _lastStepDetectorData;
  RotationVectorData? _lastRotationVectorData;
  OrientationData? _lastOrientationData;
  GravityData? _lastGravityData;
  LinearAccelerationData? _lastLinearAccelerationData;
  GameRotationVectorData? _lastGameRotationVectorData;
  GeomagneticRotationVectorData? _lastGeomagneticRotationVectorData;

  // New sensor availability
  bool _significantMotionAvailable = false;
  bool _stationaryDetectAvailable = false;
  bool _wakeGestureAvailable = false;
  bool _pickupDetectAvailable = false;
  bool _accelerometerUncalibratedAvailable = false;
  bool _magneticFieldUncalibratedAvailable = false;
  bool _gyroscopeUncalibratedAvailable = false;

  // New sensor working status
  bool _significantMotionWorking = false;
  bool _stationaryDetectWorking = false;
  bool _wakeGestureWorking = false;
  bool _pickupDetectWorking = false;
  bool _accelerometerUncalibratedWorking = false;
  bool _magneticFieldUncalibratedWorking = false;
  bool _gyroscopeUncalibratedWorking = false;

  // Last known values for new sensors
  SignificantMotionData? _lastSignificantMotionData;
  StationaryDetectData? _lastStationaryDetectData;
  WakeGestureData? _lastWakeGestureData;
  PickupDetectData? _lastPickupDetectData;
  AccelerometerUncalibratedData? _lastAccelerometerUncalibratedData;
  MagneticFieldUncalibratedData? _lastMagneticFieldUncalibratedData;
  GyroscopeUncalibratedData? _lastGyroscopeUncalibratedData;

  // Stream controllers for new sensors
  final _significantMotionStreamController =
      StreamController<SignificantMotionData>.broadcast();
  final _stationaryDetectStreamController =
      StreamController<StationaryDetectData>.broadcast();
  final _wakeGestureStreamController =
      StreamController<WakeGestureData>.broadcast();
  final _pickupDetectStreamController =
      StreamController<PickupDetectData>.broadcast();
  final _accelerometerUncalibratedStreamController =
      StreamController<AccelerometerUncalibratedData>.broadcast();
  final _magneticFieldUncalibratedStreamController =
      StreamController<MagneticFieldUncalibratedData>.broadcast();
  final _gyroscopeUncalibratedStreamController =
      StreamController<GyroscopeUncalibratedData>.broadcast();

  // Subscriptions for new sensors
  StreamSubscription? _significantMotionSubscription;
  StreamSubscription? _stationaryDetectSubscription;
  StreamSubscription? _wakeGestureSubscription;
  StreamSubscription? _pickupDetectSubscription;
  StreamSubscription? _accelerometerUncalibratedSubscription;
  StreamSubscription? _magneticFieldUncalibratedSubscription;
  StreamSubscription? _gyroscopeUncalibratedSubscription;

  PlatformSensorDataSource() {
    _initialize();
  }

  Future<void> _initialize() async {
    await _checkSensorAvailability();
    _setupStreams();

    // Add a debug message after initialization to help with troubleshooting
    _logger.info('Sensor initialization complete');
  }

  Future<void> _checkSensorAvailability() async {
    try {
      // Check sensors_plus sensors
      try {
        await accelerometerEventStream().first.timeout(
          const Duration(milliseconds: 500),
        );
        _accelerometerAvailable = true;
      } catch (e) {
        _logger.warning('Accelerometer not available: $e');
      }

      try {
        await gyroscopeEventStream().first.timeout(
          const Duration(milliseconds: 500),
        );
        _gyroscopeAvailable = true;
      } catch (e) {
        _logger.warning('Gyroscope not available: $e');
      }

      try {
        await magnetometerEventStream().first.timeout(
          const Duration(milliseconds: 500),
        );
        _magnetometerAvailable = true;
      } catch (e) {
        _logger.warning('Magnetometer not available: $e');
      }

      // Check platform sensors
      final availablePlatformSensors =
          await _methodChannel.invokeMethod<List<dynamic>>(
            'getAvailableSensors',
          ) ??
          [];

      _proximityAvailable = availablePlatformSensors.contains('Proximity');
      _lightAvailable = availablePlatformSensors.contains('Light');
      _pressureAvailable = availablePlatformSensors.contains('Pressure');

      // Check additional sensors
      _stepCounterAvailable = availablePlatformSensors.contains('StepCounter');
      _stepDetectorAvailable = availablePlatformSensors.contains(
        'StepDetector',
      );
      _rotationVectorAvailable = availablePlatformSensors.contains(
        'RotationVector',
      );
      _orientationAvailable = availablePlatformSensors.contains('Orientation');
      _gravityAvailable = availablePlatformSensors.contains('Gravity');
      _linearAccelerationAvailable = availablePlatformSensors.contains(
        'LinearAcceleration',
      );
      _gameRotationVectorAvailable = availablePlatformSensors.contains(
        'GameRotationVector',
      );
      _geomagneticRotationVectorAvailable = availablePlatformSensors.contains(
        'GeomagneticRotationVector',
      );

      // Check new sensors availability
      try {
        final availablePlatformSensors =
            await _methodChannel.invokeMethod<List<dynamic>>(
              'getAvailableSensors',
            ) ??
            [];

        // ... existing sensor checks ...

        // Check new sensors
        _significantMotionAvailable = availablePlatformSensors.contains(
          'SignificantMotion',
        );
        _stationaryDetectAvailable = availablePlatformSensors.contains(
          'StationaryDetect',
        );
        _wakeGestureAvailable = availablePlatformSensors.contains(
          'WakeGesture',
        );
        _pickupDetectAvailable = availablePlatformSensors.contains(
          'PickupDetect',
        );
        _accelerometerUncalibratedAvailable = availablePlatformSensors.contains(
          'AccelerometerUncalibrated',
        );
        _magneticFieldUncalibratedAvailable = availablePlatformSensors.contains(
          'MagneticFieldUncalibrated',
        );
        _gyroscopeUncalibratedAvailable = availablePlatformSensors.contains(
          'GyroscopeUncalibrated',
        );

        // Log availability
        _logger.info('New sensors availability:');
        _logger.info('- Significant Motion: $_significantMotionAvailable');
        _logger.info('- Stationary Detect: $_stationaryDetectAvailable');
        _logger.info('- Wake Gesture: $_wakeGestureAvailable');
        _logger.info('- Pickup Detect: $_pickupDetectAvailable');
        _logger.info(
          '- Accelerometer Uncalibrated: $_accelerometerUncalibratedAvailable',
        );
        _logger.info(
          '- Magnetic Field Uncalibrated: $_magneticFieldUncalibratedAvailable',
        );
        _logger.info(
          '- Gyroscope Uncalibrated: $_gyroscopeUncalibratedAvailable',
        );
      } catch (e) {
        _logger.severe('Error checking sensor availability: $e');
      }

      _logger.info('Sensor availability:');
      _logger.info('- Accelerometer: $_accelerometerAvailable');
      _logger.info('- Gyroscope: $_gyroscopeAvailable');
      _logger.info('- Magnetometer: $_magnetometerAvailable');
      _logger.info('- Proximity: $_proximityAvailable (native)');
      _logger.info('- Light: $_lightAvailable (native)');
      _logger.info('- Pressure: $_pressureAvailable (native)');
      _logger.info('- Step Counter: $_stepCounterAvailable (native)');
      _logger.info('- Step Detector: $_stepDetectorAvailable (native)');
      _logger.info('- Rotation Vector: $_rotationVectorAvailable (native)');
      _logger.info('- Orientation: $_orientationAvailable (native)');
      _logger.info('- Gravity: $_gravityAvailable (native)');
      _logger.info(
        '- Linear Acceleration: $_linearAccelerationAvailable (native)',
      );
      _logger.info(
        '- Game Rotation Vector: $_gameRotationVectorAvailable (native)',
      );
      _logger.info(
        '- Geomagnetic Rotation Vector: $_geomagneticRotationVectorAvailable (native)',
      );
    } catch (e) {
      _logger.severe('Error checking sensor availability: $e');
    }
  }

  void _setupStreams() {
    // Setup platform sensor streams if available
    if (_proximityAvailable) {
      _logger.info('Setting up proximity sensor stream');
      _setupProximityStream();
    } else {
      _startMockProximityStream();
    }

    if (_lightAvailable) {
      _logger.info('Setting up light sensor stream');
      _setupLightStream();
    } else {
      _startMockLightStream();
    }

    if (_pressureAvailable) {
      _logger.info('Setting up pressure sensor stream');
      _setupPressureStream();
    } else {
      _emitNotFetchingPressureData();
    }

    // Setup additional sensor streams
    if (_stepCounterAvailable) {
      _logger.info('Setting up step counter sensor stream');
      _setupStepCounterStream();
    } else {
      _startMockStepCounterStream();
    }

    if (_stepDetectorAvailable) {
      _logger.info('Setting up step detector sensor stream');
      _setupStepDetectorStream();
    } else {
      _startMockStepDetectorStream();
    }

    if (_rotationVectorAvailable) {
      _logger.info('Setting up rotation vector sensor stream');
      _setupRotationVectorStream();
    } else {
      _startMockRotationVectorStream();
    }

    if (_orientationAvailable) {
      _logger.info('Setting up orientation sensor stream');
      _setupOrientationStream();
    } else {
      _startMockOrientationStream();
    }

    if (_gravityAvailable) {
      _logger.info('Setting up gravity sensor stream');
      _setupGravityStream();
    } else {
      _startMockGravityStream();
    }

    if (_linearAccelerationAvailable) {
      _logger.info('Setting up linear acceleration sensor stream');
      _setupLinearAccelerationStream();
    } else {
      _startMockLinearAccelerationStream();
    }

    if (_gameRotationVectorAvailable) {
      _logger.info('Setting up game rotation vector sensor stream');
      _setupGameRotationVectorStream();
    } else {
      _startMockGameRotationVectorStream();
    }

    if (_geomagneticRotationVectorAvailable) {
      _logger.info('Setting up geomagnetic rotation vector sensor stream');
      _setupGeomagneticRotationVectorStream();
    } else {
      _startMockGeomagneticRotationVectorStream();
    }

    // Setup streams for mock data for new sensors
    _setupMockStreamsForNewSensors();

    // Set a timeout to check if sensors started reporting data
    Future.delayed(const Duration(seconds: 3), () {
      // Check existing sensors
      if (!_proximityWorking && _proximityAvailable) {
        _logger.warning('Proximity sensor detected but not working');
      }
      if (!_lightWorking && _lightAvailable) {
        _logger.warning('Light sensor detected but not working');
      }
      if (!_pressureWorking && _pressureAvailable) {
        _logger.warning('Pressure sensor detected but not working');
        // Make it clear pressure is not working
        _emitNotFetchingPressureData();
      }

      // Check additional sensors
      if (!_stepCounterWorking && _stepCounterAvailable) {
        _logger.warning('Step counter sensor detected but not working');
      }
      if (!_stepDetectorWorking && _stepDetectorAvailable) {
        _logger.warning('Step detector sensor detected but not working');
      }
      if (!_rotationVectorWorking && _rotationVectorAvailable) {
        _logger.warning('Rotation vector sensor detected but not working');
      }
      if (!_orientationWorking && _orientationAvailable) {
        _logger.warning('Orientation sensor detected but not working');
      }
      if (!_gravityWorking && _gravityAvailable) {
        _logger.warning('Gravity sensor detected but not working');
      }
      if (!_linearAccelerationWorking && _linearAccelerationAvailable) {
        _logger.warning('Linear acceleration sensor detected but not working');
      }
      if (!_gameRotationVectorWorking && _gameRotationVectorAvailable) {
        _logger.warning('Game rotation vector sensor detected but not working');
      }
      if (!_geomagneticRotationVectorWorking &&
          _geomagneticRotationVectorAvailable) {
        _logger.warning(
          'Geomagnetic rotation vector sensor detected but not working',
        );
      }
    });
  }

  void _emitNotFetchingPressureData() {
    // For pressure that's not working, emit special "not fetching" data
    final pressureData = PressureData(
      pressure: -1, // Special value to indicate sensor not working
      timestamp: DateTime.now(),
      tenantId: 'default',
    );
    _lastPressureData = pressureData;
    _pressureStreamController.add(pressureData);
  }

  void _startMockProximityStream() {
    _logger.info('Starting simulated proximity stream');
    Timer.periodic(const Duration(seconds: 2), (timer) {
      final bool isNear = DateTime.now().second % 10 < 5;
      final data = ProximityData(
        distance: isNear ? 0.0 : 5.0,
        isNear: isNear,
        timestamp: DateTime.now(),
        tenantId: 'default',
      );
      _lastProximityData = data;
      _proximityStreamController.add(data);
    });
  }

  void _startMockLightStream() {
    _logger.info('Starting simulated light sensor stream');
    Timer.periodic(const Duration(seconds: 3), (timer) {
      final base = 200.0;
      final variation = (DateTime.now().second % 60) * 10.0;
      final data = LightSensorData(
        illuminance: base + variation,
        timestamp: DateTime.now(),
        tenantId: 'default',
      );
      _lastLightData = data;
      _lightStreamController.add(data);
    });
  }

  void dispose() {
    // Cancel subscriptions to existing sensors
    _proximitySubscription?.cancel();
    _lightSubscription?.cancel();
    _pressureSubscription?.cancel();

    // Cancel subscriptions to additional sensors
    _stepCounterSubscription?.cancel();
    _stepDetectorSubscription?.cancel();
    _rotationVectorSubscription?.cancel();
    _orientationSubscription?.cancel();
    _gravitySubscription?.cancel();
    _linearAccelerationSubscription?.cancel();
    _gameRotationVectorSubscription?.cancel();
    _geomagneticRotationVectorSubscription?.cancel();

    // Cancel new sensor subscriptions
    _significantMotionSubscription?.cancel();
    _stationaryDetectSubscription?.cancel();
    _wakeGestureSubscription?.cancel();
    _pickupDetectSubscription?.cancel();
    _accelerometerUncalibratedSubscription?.cancel();
    _magneticFieldUncalibratedSubscription?.cancel();
    _gyroscopeUncalibratedSubscription?.cancel();

    // Close stream controllers for existing sensors
    _proximityStreamController.close();
    _lightStreamController.close();
    _pressureStreamController.close();

    // Close stream controllers for additional sensors
    _stepCounterStreamController.close();
    _stepDetectorStreamController.close();
    _rotationVectorStreamController.close();
    _orientationStreamController.close();
    _gravityStreamController.close();
    _linearAccelerationStreamController.close();
    _gameRotationVectorStreamController.close();
    _geomagneticRotationVectorStreamController.close();

    // Close new sensor controllers
    _significantMotionStreamController.close();
    _stationaryDetectStreamController.close();
    _wakeGestureStreamController.close();
    _pickupDetectStreamController.close();
    _accelerometerUncalibratedStreamController.close();
    _magneticFieldUncalibratedStreamController.close();
    _gyroscopeUncalibratedStreamController.close();
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
      // Return mock stream if sensor is not available
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
    return _proximityStreamController.stream;
  }

  @override
  Stream<LightSensorData> getLightStream() {
    return _lightStreamController.stream;
  }

  @override
  Stream<PressureData> getPressureStream() {
    return _pressureStreamController.stream;
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
    return _proximityStreamController.stream.first;
  }

  @override
  Future<LightSensorData?> getLightData() async {
    if (_lastLightData != null) {
      return _lastLightData!;
    }
    return _lightStreamController.stream.first;
  }

  @override
  Future<PressureData?> getPressureData() async {
    if (_lastPressureData != null) {
      return _lastPressureData!;
    }
    // Return pressure data with -1 to indicate not working if we can't get data
    final data = await _pressureStreamController.stream.first;
    if (data.pressure < 0) {
      _logger.warning("Returning pressure data indicating sensor not working");
    }
    return data;
  }

  @override
  Future<CombinedSensorData> getCombinedSensorData() async {
    // First get the enhanced data with all sensors
    final enhancedData = await _getEnhancedSensorData();

    // Use the extension method to convert to CombinedSensorData
    return enhancedData.toCombinedSensorData();
  }

  /// Internal method to get enhanced sensor data with all available sensors
  Future<EnhancedSensorData> _getEnhancedSensorData() async {
    // Get basic sensor data
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

    return EnhancedSensorData(
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

    // Add the sensors from sensors_plus
    if (_accelerometerAvailable) sensorList.add('Accelerometer');
    if (_gyroscopeAvailable) sensorList.add('Gyroscope');
    if (_magnetometerAvailable) sensorList.add('Magnetometer');

    // For proximity sensor, show correct status
    if (_proximityAvailable && _proximityWorking) {
      // Sensor is available and working - real data
      sensorList.add('Proximity');
    } else {
      // Sensor is not available or not working - using simulated data
      sensorList.add('Proximity (simulated)');
    }

    // For light sensor, show correct status
    if (_lightAvailable && _lightWorking) {
      // Sensor is available and working - real data
      sensorList.add('Light');
    } else {
      // Sensor is not available or not working - using simulated data
      sensorList.add('Light (simulated)');
    }

    // For pressure sensor, show correct status
    if (_pressureAvailable && _pressureWorking) {
      // Sensor is available and working - real data
      sensorList.add('Pressure');
    } else {
      // Sensor is not available or not working - showing "not fetching"
      sensorList.add('Pressure (not working)');
    }

    // For step counter sensor
    if (_stepCounterAvailable && _stepCounterWorking) {
      sensorList.add('Step Counter');
    } else if (_stepCounterAvailable) {
      sensorList.add('Step Counter (not working)');
    } else {
      sensorList.add('Step Counter (simulated)');
    }

    // For step detector sensor
    if (_stepDetectorAvailable && _stepDetectorWorking) {
      sensorList.add('Step Detector');
    } else if (_stepDetectorAvailable) {
      sensorList.add('Step Detector (not working)');
    } else {
      sensorList.add('Step Detector (simulated)');
    }

    // For rotation vector sensor
    if (_rotationVectorAvailable && _rotationVectorWorking) {
      sensorList.add('Rotation Vector');
    } else if (_rotationVectorAvailable) {
      sensorList.add('Rotation Vector (not working)');
    } else {
      sensorList.add('Rotation Vector (simulated)');
    }

    // For orientation sensor
    if (_orientationAvailable && _orientationWorking) {
      sensorList.add('Orientation');
    } else if (_orientationAvailable) {
      sensorList.add('Orientation (not working)');
    } else {
      sensorList.add('Orientation (simulated)');
    }

    // For gravity sensor
    if (_gravityAvailable && _gravityWorking) {
      sensorList.add('Gravity');
    } else if (_gravityAvailable) {
      sensorList.add('Gravity (not working)');
    } else {
      sensorList.add('Gravity (simulated)');
    }

    // For linear acceleration sensor
    if (_linearAccelerationAvailable && _linearAccelerationWorking) {
      sensorList.add('Linear Acceleration');
    } else if (_linearAccelerationAvailable) {
      sensorList.add('Linear Acceleration (not working)');
    } else {
      sensorList.add('Linear Acceleration (simulated)');
    }

    // For game rotation vector sensor
    if (_gameRotationVectorAvailable && _gameRotationVectorWorking) {
      sensorList.add('Game Rotation Vector');
    } else if (_gameRotationVectorAvailable) {
      sensorList.add('Game Rotation Vector (not working)');
    } else {
      sensorList.add('Game Rotation Vector (simulated)');
    }

    // For geomagnetic rotation vector sensor
    if (_geomagneticRotationVectorAvailable &&
        _geomagneticRotationVectorWorking) {
      sensorList.add('Geomagnetic Rotation Vector');
    } else if (_geomagneticRotationVectorAvailable) {
      sensorList.add('Geomagnetic Rotation Vector (not working)');
    } else {
      sensorList.add('Geomagnetic Rotation Vector (simulated)');
    }

    // Add new sensors with their status
    if (_significantMotionAvailable && _significantMotionWorking) {
      sensorList.add('Significant Motion');
    } else {
      sensorList.add('Significant Motion (simulated)');
    }

    if (_stationaryDetectAvailable && _stationaryDetectWorking) {
      sensorList.add('Stationary Detect');
    } else {
      sensorList.add('Stationary Detect (simulated)');
    }

    if (_wakeGestureAvailable && _wakeGestureWorking) {
      sensorList.add('Wake Gesture');
    } else {
      sensorList.add('Wake Gesture (simulated)');
    }

    if (_pickupDetectAvailable && _pickupDetectWorking) {
      sensorList.add('Pickup Detect');
    } else {
      sensorList.add('Pickup Detect (simulated)');
    }

    if (_accelerometerUncalibratedAvailable &&
        _accelerometerUncalibratedWorking) {
      sensorList.add('Accelerometer Uncalibrated');
    } else {
      sensorList.add('Accelerometer Uncalibrated (simulated)');
    }

    if (_magneticFieldUncalibratedAvailable &&
        _magneticFieldUncalibratedWorking) {
      sensorList.add('Magnetic Field Uncalibrated');
    } else {
      sensorList.add('Magnetic Field Uncalibrated (simulated)');
    }

    if (_gyroscopeUncalibratedAvailable && _gyroscopeUncalibratedWorking) {
      sensorList.add('Gyroscope Uncalibrated');
    } else {
      sensorList.add('Gyroscope Uncalibrated (simulated)');
    }

    return sensorList;
  }

  // Public methods to check sensor status
  bool isProximityRealData() => _proximityWorking;
  bool isLightRealData() => _lightWorking;
  bool isPressureWorking() => _pressureWorking;

  // Additional sensor status methods
  bool isStepCounterRealData() => _stepCounterWorking;
  bool isStepDetectorRealData() => _stepDetectorWorking;
  bool isRotationVectorRealData() => _rotationVectorWorking;
  bool isOrientationRealData() => _orientationWorking;
  bool isGravityRealData() => _gravityWorking;
  bool isLinearAccelerationRealData() => _linearAccelerationWorking;
  bool isGameRotationVectorRealData() => _gameRotationVectorWorking;
  bool isGeomagneticRotationVectorRealData() =>
      _geomagneticRotationVectorWorking;

  void _setupProximityStream() {
    _proximitySubscription = _proximityChannel.receiveBroadcastStream().listen(
      (dynamic event) {
        try {
          final data = Map<String, dynamic>.from(event as Map);
          final proxData = ProximityData(
            distance: data['distance'] as double,
            isNear: data['isNear'] as bool,
            timestamp: DateTime.fromMillisecondsSinceEpoch(
              data['timestamp'] as int,
            ),
            tenantId: 'default',
          );
          if (!_proximityWorking) {
            _logger.info('First proximity data received - sensor is working!');
          }
          _proximityWorking = true;
          _lastProximityData = proxData;
          _proximityStreamController.add(proxData);
        } catch (e) {
          _logger.severe('Error processing proximity data: $e');
        }
      },
      onError: (dynamic error) {
        _logger.severe('Error from proximity sensor: $error');
        if (_proximityWorking) {
          _logger.warning(
            'Proximity sensor stopped working, falling back to simulation',
          );
        }
        _proximityWorking = false;
        _startMockProximityStream();
      },
    );
  }

  void _setupLightStream() {
    _lightSubscription = _lightChannel.receiveBroadcastStream().listen(
      (dynamic event) {
        try {
          final data = Map<String, dynamic>.from(event as Map);
          final lightData = LightSensorData(
            illuminance: data['illuminance'] as double,
            timestamp: DateTime.fromMillisecondsSinceEpoch(
              data['timestamp'] as int,
            ),
            tenantId: 'default',
          );
          if (!_lightWorking) {
            _logger.info(
              'First light sensor data received - sensor is working!',
            );
          }
          _lightWorking = true;
          _lastLightData = lightData;
          _lightStreamController.add(lightData);
        } catch (e) {
          _logger.severe('Error processing light data: $e');
        }
      },
      onError: (dynamic error) {
        _logger.severe('Error from light sensor: $error');
        if (_lightWorking) {
          _logger.warning(
            'Light sensor stopped working, falling back to simulation',
          );
        }
        _lightWorking = false;
        _startMockLightStream();
      },
    );
  }

  void _setupPressureStream() {
    _pressureSubscription = _pressureChannel.receiveBroadcastStream().listen(
      (dynamic event) {
        try {
          final data = Map<String, dynamic>.from(event as Map);
          final pressureData = PressureData(
            pressure: data['pressure'] as double,
            timestamp: DateTime.fromMillisecondsSinceEpoch(
              data['timestamp'] as int,
            ),
            tenantId: 'default',
          );
          if (!_pressureWorking) {
            _logger.info('First pressure data received - sensor is working!');
          }
          _pressureWorking = true;
          _lastPressureData = pressureData;
          _pressureStreamController.add(pressureData);
        } catch (e) {
          _logger.severe('Error processing pressure data: $e');
        }
      },
      onError: (dynamic error) {
        _logger.severe('Error from pressure sensor: $error');
        if (_pressureWorking) {
          _logger.warning('Pressure sensor stopped working');
        }
        _pressureWorking = false;
        _emitNotFetchingPressureData();
      },
    );
  }

  void _setupStepCounterStream() {
    _stepCounterSubscription = _stepCounterChannel
        .receiveBroadcastStream()
        .listen(
          (dynamic event) {
            try {
              final data = Map<String, dynamic>.from(event as Map);
              final stepCounterData = StepCounterData(
                steps: data['steps'] as int,
                timestamp: DateTime.fromMillisecondsSinceEpoch(
                  data['timestamp'] as int,
                ),
                tenantId: 'default',
              );
              if (!_stepCounterWorking) {
                _logger.info(
                  'First step counter data received - sensor is working!',
                );
              }
              _stepCounterWorking = true;
              _lastStepCounterData = stepCounterData;
              _stepCounterStreamController.add(stepCounterData);
            } catch (e) {
              _logger.severe('Error processing step counter data: $e');
            }
          },
          onError: (dynamic error) {
            _logger.severe('Error from step counter sensor: $error');
            if (_stepCounterWorking) {
              _logger.warning(
                'Step counter sensor stopped working, falling back to simulation',
              );
            }
            _stepCounterWorking = false;
            _startMockStepCounterStream();
          },
        );
  }

  void _setupStepDetectorStream() {
    _stepDetectorSubscription = _stepDetectorChannel
        .receiveBroadcastStream()
        .listen(
          (dynamic event) {
            try {
              final data = Map<String, dynamic>.from(event as Map);
              final stepDetectorData = StepDetectorData(
                detected: data['detected'] as bool,
                timestamp: DateTime.fromMillisecondsSinceEpoch(
                  data['timestamp'] as int,
                ),
                tenantId: 'default',
              );
              if (!_stepDetectorWorking) {
                _logger.info(
                  'First step detector data received - sensor is working!',
                );
              }
              _stepDetectorWorking = true;
              _lastStepDetectorData = stepDetectorData;
              _stepDetectorStreamController.add(stepDetectorData);
            } catch (e) {
              _logger.severe('Error processing step detector data: $e');
            }
          },
          onError: (dynamic error) {
            _logger.severe('Error from step detector sensor: $error');
            if (_stepDetectorWorking) {
              _logger.warning(
                'Step detector sensor stopped working, falling back to simulation',
              );
            }
            _stepDetectorWorking = false;
            _startMockStepDetectorStream();
          },
        );
  }

  void _setupRotationVectorStream() {
    _rotationVectorSubscription = _rotationVectorChannel
        .receiveBroadcastStream()
        .listen(
          (dynamic event) {
            try {
              final data = Map<String, dynamic>.from(event as Map);
              final rotationVectorData = RotationVectorData(
                x: data['x'] as double,
                y: data['y'] as double,
                z: data['z'] as double,
                w: data['w'] as double,
                timestamp: DateTime.fromMillisecondsSinceEpoch(
                  data['timestamp'] as int,
                ),
                tenantId: 'default',
              );
              if (!_rotationVectorWorking) {
                _logger.info(
                  'First rotation vector data received - sensor is working!',
                );
              }
              _rotationVectorWorking = true;
              _lastRotationVectorData = rotationVectorData;
              _rotationVectorStreamController.add(rotationVectorData);
            } catch (e) {
              _logger.severe('Error processing rotation vector data: $e');
            }
          },
          onError: (dynamic error) {
            _logger.severe('Error from rotation vector sensor: $error');
            if (_rotationVectorWorking) {
              _logger.warning(
                'Rotation vector sensor stopped working, falling back to simulation',
              );
            }
            _rotationVectorWorking = false;
            _startMockRotationVectorStream();
          },
        );
  }

  void _setupOrientationStream() {
    _orientationSubscription = _orientationChannel
        .receiveBroadcastStream()
        .listen(
          (dynamic event) {
            try {
              final data = Map<String, dynamic>.from(event as Map);
              final orientationData = OrientationData(
                azimuth: data['azimuth'] as double,
                pitch: data['pitch'] as double,
                roll: data['roll'] as double,
                timestamp: DateTime.fromMillisecondsSinceEpoch(
                  data['timestamp'] as int,
                ),
                tenantId: 'default',
              );
              if (!_orientationWorking) {
                _logger.info(
                  'First orientation data received - sensor is working!',
                );
              }
              _orientationWorking = true;
              _lastOrientationData = orientationData;
              _orientationStreamController.add(orientationData);
            } catch (e) {
              _logger.severe('Error processing orientation data: $e');
            }
          },
          onError: (dynamic error) {
            _logger.severe('Error from orientation sensor: $error');
            if (_orientationWorking) {
              _logger.warning(
                'Orientation sensor stopped working, falling back to simulation',
              );
            }
            _orientationWorking = false;
            _startMockOrientationStream();
          },
        );
  }

  void _setupGravityStream() {
    _gravitySubscription = _gravityChannel.receiveBroadcastStream().listen(
      (dynamic event) {
        try {
          final data = Map<String, dynamic>.from(event as Map);
          final gravityData = GravityData(
            x: data['x'] as double,
            y: data['y'] as double,
            z: data['z'] as double,
            timestamp: DateTime.fromMillisecondsSinceEpoch(
              data['timestamp'] as int,
            ),
            tenantId: 'default',
          );
          if (!_gravityWorking) {
            _logger.info('First gravity data received - sensor is working!');
          }
          _gravityWorking = true;
          _lastGravityData = gravityData;
          _gravityStreamController.add(gravityData);
        } catch (e) {
          _logger.severe('Error processing gravity data: $e');
        }
      },
      onError: (dynamic error) {
        _logger.severe('Error from gravity sensor: $error');
        if (_gravityWorking) {
          _logger.warning(
            'Gravity sensor stopped working, falling back to simulation',
          );
        }
        _gravityWorking = false;
        _startMockGravityStream();
      },
    );
  }

  void _setupLinearAccelerationStream() {
    _linearAccelerationSubscription = _linearAccelerationChannel
        .receiveBroadcastStream()
        .listen(
          (dynamic event) {
            try {
              final data = Map<String, dynamic>.from(event as Map);
              final linearAccelerationData = LinearAccelerationData(
                x: data['x'] as double,
                y: data['y'] as double,
                z: data['z'] as double,
                timestamp: DateTime.fromMillisecondsSinceEpoch(
                  data['timestamp'] as int,
                ),
                tenantId: 'default',
              );
              if (!_linearAccelerationWorking) {
                _logger.info(
                  'First linear acceleration data received - sensor is working!',
                );
              }
              _linearAccelerationWorking = true;
              _lastLinearAccelerationData = linearAccelerationData;
              _linearAccelerationStreamController.add(linearAccelerationData);
            } catch (e) {
              _logger.severe('Error processing linear acceleration data: $e');
            }
          },
          onError: (dynamic error) {
            _logger.severe('Error from linear acceleration sensor: $error');
            if (_linearAccelerationWorking) {
              _logger.warning(
                'Linear acceleration sensor stopped working, falling back to simulation',
              );
            }
            _linearAccelerationWorking = false;
            _startMockLinearAccelerationStream();
          },
        );
  }

  void _setupGameRotationVectorStream() {
    _gameRotationVectorSubscription = _gameRotationVectorChannel
        .receiveBroadcastStream()
        .listen(
          (dynamic event) {
            try {
              final data = Map<String, dynamic>.from(event as Map);
              final gameRotationVectorData = GameRotationVectorData(
                x: data['x'] as double,
                y: data['y'] as double,
                z: data['z'] as double,
                w: data['w'] as double,
                timestamp: DateTime.fromMillisecondsSinceEpoch(
                  data['timestamp'] as int,
                ),
                tenantId: 'default',
              );
              if (!_gameRotationVectorWorking) {
                _logger.info(
                  'First game rotation vector data received - sensor is working!',
                );
              }
              _gameRotationVectorWorking = true;
              _lastGameRotationVectorData = gameRotationVectorData;
              _gameRotationVectorStreamController.add(gameRotationVectorData);
            } catch (e) {
              _logger.severe('Error processing game rotation vector data: $e');
            }
          },
          onError: (dynamic error) {
            _logger.severe('Error from game rotation vector sensor: $error');
            if (_gameRotationVectorWorking) {
              _logger.warning(
                'Game rotation vector sensor stopped working, falling back to simulation',
              );
            }
            _gameRotationVectorWorking = false;
            _startMockGameRotationVectorStream();
          },
        );
  }

  void _setupGeomagneticRotationVectorStream() {
    _geomagneticRotationVectorSubscription = _geomagneticRotationVectorChannel
        .receiveBroadcastStream()
        .listen(
          (dynamic event) {
            try {
              final data = Map<String, dynamic>.from(event as Map);
              final geomagneticRotationVectorData =
                  GeomagneticRotationVectorData(
                    x: data['x'] as double,
                    y: data['y'] as double,
                    z: data['z'] as double,
                    w: data['w'] as double,
                    timestamp: DateTime.fromMillisecondsSinceEpoch(
                      data['timestamp'] as int,
                    ),
                    tenantId: 'default',
                  );
              if (!_geomagneticRotationVectorWorking) {
                _logger.info(
                  'First geomagnetic rotation vector data received - sensor is working!',
                );
              }
              _geomagneticRotationVectorWorking = true;
              _lastGeomagneticRotationVectorData =
                  geomagneticRotationVectorData;
              _geomagneticRotationVectorStreamController.add(
                geomagneticRotationVectorData,
              );
            } catch (e) {
              _logger.severe(
                'Error processing geomagnetic rotation vector data: $e',
              );
            }
          },
          onError: (dynamic error) {
            _logger.severe(
              'Error from geomagnetic rotation vector sensor: $error',
            );
            if (_geomagneticRotationVectorWorking) {
              _logger.warning(
                'Geomagnetic rotation vector sensor stopped working, falling back to simulation',
              );
            }
            _geomagneticRotationVectorWorking = false;
            _startMockGeomagneticRotationVectorStream();
          },
        );
  }

  void _startMockStepCounterStream() {
    _logger.info('Starting simulated step counter stream');
    Timer.periodic(const Duration(seconds: 5), (timer) {
      final steps = DateTime.now().second + DateTime.now().minute * 60;
      final data = StepCounterData(
        steps: steps,
        timestamp: DateTime.now(),
        tenantId: 'default',
      );
      _lastStepCounterData = data;
      _stepCounterStreamController.add(data);
    });
  }

  void _startMockStepDetectorStream() {
    _logger.info('Starting simulated step detector stream');
    Timer.periodic(const Duration(seconds: 2), (timer) {
      // Only trigger a step every 2 seconds (alternating)
      final detected = timer.tick % 2 == 0;
      final data = StepDetectorData(
        detected: detected,
        timestamp: DateTime.now(),
        tenantId: 'default',
      );
      _lastStepDetectorData = data;
      _stepDetectorStreamController.add(data);
    });
  }

  void _startMockRotationVectorStream() {
    _logger.info('Starting simulated rotation vector stream');
    Timer.periodic(const Duration(milliseconds: 200), (timer) {
      final now = DateTime.now();
      final t = now.millisecond / 1000.0 + now.second;
      // Create a rotating vector
      final x = 0.5 * sin(t);
      final y = 0.5 * cos(t);
      final z = 0.1 * sin(t * 2);
      final w = sqrt(
        1 - (x * x + y * y + z * z),
      ).clamp(0.0, 1.0); // Calculate w to normalize quaternion

      final data = RotationVectorData(
        x: x,
        y: y,
        z: z,
        w: w,
        timestamp: now,
        tenantId: 'default',
      );
      _lastRotationVectorData = data;
      _rotationVectorStreamController.add(data);
    });
  }

  void _startMockOrientationStream() {
    _logger.info('Starting simulated orientation stream');
    Timer.periodic(const Duration(milliseconds: 200), (timer) {
      final now = DateTime.now();
      final t = now.millisecond / 1000.0 + now.second;

      // Create changing orientation values (in degrees)
      // Azimuth: 0-359 degrees (heading)
      final azimuth = (t * 15) % 360;
      // Pitch: -180 to 180 degrees (tilt around X-axis)
      final pitch = 20 * sin(t);
      // Roll: -90 to 90 degrees (tilt around Y-axis)
      final roll = 15 * cos(t);

      final data = OrientationData(
        azimuth: azimuth,
        pitch: pitch,
        roll: roll,
        timestamp: now,
        tenantId: 'default',
      );
      _lastOrientationData = data;
      _orientationStreamController.add(data);
    });
  }

  void _startMockGravityStream() {
    _logger.info('Starting simulated gravity stream');
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      final now = DateTime.now();
      final t = now.millisecond / 1000.0 + now.second;

      // Create a gravity vector that slowly changes
      // The vector should have a magnitude of approximately 9.8 m/s²
      final angle = t * 0.05; // Very slow rotation
      final x = 1.0 * sin(angle);
      final y = 1.0 * cos(angle);
      final z = 9.7; // Most of gravity is in the z direction

      final data = GravityData(
        x: x,
        y: y,
        z: z,
        timestamp: now,
        tenantId: 'default',
      );
      _lastGravityData = data;
      _gravityStreamController.add(data);
    });
  }

  void _startMockLinearAccelerationStream() {
    _logger.info('Starting simulated linear acceleration stream');
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      final now = DateTime.now();
      final t = now.millisecond / 1000.0 + now.second;

      // Simulate small accelerations in x, y directions
      final x = 0.5 * sin(t * 2);
      final y = 0.5 * cos(t * 3);
      final z = 0.2 * sin(t * 5);

      final data = LinearAccelerationData(
        x: x,
        y: y,
        z: z,
        timestamp: now,
        tenantId: 'default',
      );
      _lastLinearAccelerationData = data;
      _linearAccelerationStreamController.add(data);
    });
  }

  void _startMockGameRotationVectorStream() {
    _logger.info('Starting simulated game rotation vector stream');
    Timer.periodic(const Duration(milliseconds: 200), (timer) {
      final now = DateTime.now();
      final t = now.millisecond / 1000.0 + now.second;

      // Similar to rotation vector but with different values
      final x = 0.4 * sin(t * 1.2);
      final y = 0.4 * cos(t * 1.2);
      final z = 0.1 * sin(t * 3.0);
      final w = sqrt(
        1 - (x * x + y * y + z * z),
      ).clamp(0.0, 1.0); // Normalize quaternion

      final data = GameRotationVectorData(
        x: x,
        y: y,
        z: z,
        w: w,
        timestamp: now,
        tenantId: 'default',
      );
      _lastGameRotationVectorData = data;
      _gameRotationVectorStreamController.add(data);
    });
  }

  void _startMockGeomagneticRotationVectorStream() {
    _logger.info('Starting simulated geomagnetic rotation vector stream');
    Timer.periodic(const Duration(milliseconds: 200), (timer) {
      final now = DateTime.now();
      final t = now.millisecond / 1000.0 + now.second;

      // Similar to rotation vector but with different values
      final x = 0.3 * sin(t * 0.8);
      final y = 0.3 * cos(t * 0.8);
      final z = 0.1 * sin(t * 2.5);
      final w = sqrt(
        1 - (x * x + y * y + z * z),
      ).clamp(0.0, 1.0); // Normalize quaternion

      final data = GeomagneticRotationVectorData(
        x: x,
        y: y,
        z: z,
        w: w,
        timestamp: now,
        tenantId: 'default',
      );
      _lastGeomagneticRotationVectorData = data;
      _geomagneticRotationVectorStreamController.add(data);
    });
  }

  // Step Counter
  @override
  Stream<StepCounterData> getStepCounterStream() {
    return _stepCounterStreamController.stream;
  }

  @override
  Future<StepCounterData?> getStepCounterData() async {
    if (_lastStepCounterData != null) {
      return _lastStepCounterData!;
    }
    return _stepCounterStreamController.stream.first;
  }

  // Step Detector
  @override
  Stream<StepDetectorData> getStepDetectorStream() {
    return _stepDetectorStreamController.stream;
  }

  @override
  Future<StepDetectorData?> getStepDetectorData() async {
    if (_lastStepDetectorData != null) {
      return _lastStepDetectorData!;
    }
    return _stepDetectorStreamController.stream.first;
  }

  // Rotation Vector
  @override
  Stream<RotationVectorData> getRotationVectorStream() {
    return _rotationVectorStreamController.stream;
  }

  @override
  Future<RotationVectorData?> getRotationVectorData() async {
    if (_lastRotationVectorData != null) {
      return _lastRotationVectorData!;
    }
    return _rotationVectorStreamController.stream.first;
  }

  // Orientation
  @override
  Stream<OrientationData> getOrientationStream() {
    return _orientationStreamController.stream;
  }

  @override
  Future<OrientationData?> getOrientationData() async {
    if (_lastOrientationData != null) {
      return _lastOrientationData!;
    }
    return _orientationStreamController.stream.first;
  }

  // Gravity
  @override
  Stream<GravityData> getGravityStream() {
    return _gravityStreamController.stream;
  }

  @override
  Future<GravityData?> getGravityData() async {
    if (_lastGravityData != null) {
      return _lastGravityData!;
    }
    return _gravityStreamController.stream.first;
  }

  // Linear Acceleration
  @override
  Stream<LinearAccelerationData> getLinearAccelerationStream() {
    return _linearAccelerationStreamController.stream;
  }

  @override
  Future<LinearAccelerationData?> getLinearAccelerationData() async {
    if (_lastLinearAccelerationData != null) {
      return _lastLinearAccelerationData!;
    }
    return _linearAccelerationStreamController.stream.first;
  }

  // Game Rotation Vector
  @override
  Stream<GameRotationVectorData> getGameRotationVectorStream() {
    return _gameRotationVectorStreamController.stream;
  }

  @override
  Future<GameRotationVectorData?> getGameRotationVectorData() async {
    if (_lastGameRotationVectorData != null) {
      return _lastGameRotationVectorData!;
    }
    return _gameRotationVectorStreamController.stream.first;
  }

  // Geomagnetic Rotation Vector
  @override
  Stream<GeomagneticRotationVectorData> getGeomagneticRotationVectorStream() {
    return _geomagneticRotationVectorStreamController.stream;
  }

  @override
  Future<GeomagneticRotationVectorData?>
  getGeomagneticRotationVectorData() async {
    if (_lastGeomagneticRotationVectorData != null) {
      return _lastGeomagneticRotationVectorData!;
    }
    return _geomagneticRotationVectorStreamController.stream.first;
  }

  // Implement new sensor stream methods
  @override
  Stream<SignificantMotionData> getSignificantMotionStream() {
    return _significantMotionStreamController.stream;
  }

  @override
  Stream<StationaryDetectData> getStationaryDetectStream() {
    return _stationaryDetectStreamController.stream;
  }

  @override
  Stream<WakeGestureData> getWakeGestureStream() {
    return _wakeGestureStreamController.stream;
  }

  @override
  Stream<PickupDetectData> getPickupDetectStream() {
    return _pickupDetectStreamController.stream;
  }

  @override
  Stream<AccelerometerUncalibratedData> getAccelerometerUncalibratedStream() {
    return _accelerometerUncalibratedStreamController.stream;
  }

  @override
  Stream<MagneticFieldUncalibratedData> getMagneticFieldUncalibratedStream() {
    return _magneticFieldUncalibratedStreamController.stream;
  }

  @override
  Stream<GyroscopeUncalibratedData> getGyroscopeUncalibratedStream() {
    return _gyroscopeUncalibratedStreamController.stream;
  }

  // Implement new sensor data fetch methods
  @override
  Future<SignificantMotionData?> getSignificantMotionData() async {
    if (_lastSignificantMotionData != null) {
      return _lastSignificantMotionData!;
    }
    return _significantMotionStreamController.stream.first;
  }

  @override
  Future<StationaryDetectData?> getStationaryDetectData() async {
    if (_lastStationaryDetectData != null) {
      return _lastStationaryDetectData!;
    }
    return _stationaryDetectStreamController.stream.first;
  }

  @override
  Future<WakeGestureData?> getWakeGestureData() async {
    if (_lastWakeGestureData != null) {
      return _lastWakeGestureData!;
    }
    return _wakeGestureStreamController.stream.first;
  }

  @override
  Future<PickupDetectData?> getPickupDetectData() async {
    if (_lastPickupDetectData != null) {
      return _lastPickupDetectData!;
    }
    return _pickupDetectStreamController.stream.first;
  }

  @override
  Future<AccelerometerUncalibratedData?>
  getAccelerometerUncalibratedData() async {
    if (_lastAccelerometerUncalibratedData != null) {
      return _lastAccelerometerUncalibratedData!;
    }
    return _accelerometerUncalibratedStreamController.stream.first;
  }

  @override
  Future<MagneticFieldUncalibratedData?>
  getMagneticFieldUncalibratedData() async {
    if (_lastMagneticFieldUncalibratedData != null) {
      return _lastMagneticFieldUncalibratedData!;
    }
    return _magneticFieldUncalibratedStreamController.stream.first;
  }

  @override
  Future<GyroscopeUncalibratedData?> getGyroscopeUncalibratedData() async {
    if (_lastGyroscopeUncalibratedData != null) {
      return _lastGyroscopeUncalibratedData!;
    }
    return _gyroscopeUncalibratedStreamController.stream.first;
  }

  void _setupMockStreamsForNewSensors() {
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
      _significantMotionStreamController.add(mockData);
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
      _stationaryDetectStreamController.add(mockData);
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
      _wakeGestureStreamController.add(mockData);
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
      _pickupDetectStreamController.add(mockData);
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
      _accelerometerUncalibratedStreamController.add(mockData);
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
      _magneticFieldUncalibratedStreamController.add(mockData);
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
      _gyroscopeUncalibratedStreamController.add(mockData);
    });
  }
}
