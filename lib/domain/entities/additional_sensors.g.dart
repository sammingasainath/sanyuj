// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'additional_sensors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StepCounterData _$StepCounterDataFromJson(Map<String, dynamic> json) =>
    _StepCounterData(
      steps: (json['steps'] as num).toInt(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      tenantId: json['tenantId'] as String?,
    );

Map<String, dynamic> _$StepCounterDataToJson(_StepCounterData instance) =>
    <String, dynamic>{
      'steps': instance.steps,
      'timestamp': instance.timestamp.toIso8601String(),
      'tenantId': instance.tenantId,
    };

_StepDetectorData _$StepDetectorDataFromJson(Map<String, dynamic> json) =>
    _StepDetectorData(
      detected: json['detected'] as bool,
      timestamp: DateTime.parse(json['timestamp'] as String),
      tenantId: json['tenantId'] as String?,
    );

Map<String, dynamic> _$StepDetectorDataToJson(_StepDetectorData instance) =>
    <String, dynamic>{
      'detected': instance.detected,
      'timestamp': instance.timestamp.toIso8601String(),
      'tenantId': instance.tenantId,
    };

_RotationVectorData _$RotationVectorDataFromJson(Map<String, dynamic> json) =>
    _RotationVectorData(
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      z: (json['z'] as num).toDouble(),
      w: (json['w'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      tenantId: json['tenantId'] as String?,
    );

Map<String, dynamic> _$RotationVectorDataToJson(_RotationVectorData instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'z': instance.z,
      'w': instance.w,
      'timestamp': instance.timestamp.toIso8601String(),
      'tenantId': instance.tenantId,
    };

_OrientationData _$OrientationDataFromJson(Map<String, dynamic> json) =>
    _OrientationData(
      azimuth: (json['azimuth'] as num).toDouble(),
      pitch: (json['pitch'] as num).toDouble(),
      roll: (json['roll'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      tenantId: json['tenantId'] as String?,
    );

Map<String, dynamic> _$OrientationDataToJson(_OrientationData instance) =>
    <String, dynamic>{
      'azimuth': instance.azimuth,
      'pitch': instance.pitch,
      'roll': instance.roll,
      'timestamp': instance.timestamp.toIso8601String(),
      'tenantId': instance.tenantId,
    };

_GravityData _$GravityDataFromJson(Map<String, dynamic> json) => _GravityData(
  x: (json['x'] as num).toDouble(),
  y: (json['y'] as num).toDouble(),
  z: (json['z'] as num).toDouble(),
  timestamp: DateTime.parse(json['timestamp'] as String),
  tenantId: json['tenantId'] as String?,
);

Map<String, dynamic> _$GravityDataToJson(_GravityData instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'z': instance.z,
      'timestamp': instance.timestamp.toIso8601String(),
      'tenantId': instance.tenantId,
    };

_LinearAccelerationData _$LinearAccelerationDataFromJson(
  Map<String, dynamic> json,
) => _LinearAccelerationData(
  x: (json['x'] as num).toDouble(),
  y: (json['y'] as num).toDouble(),
  z: (json['z'] as num).toDouble(),
  timestamp: DateTime.parse(json['timestamp'] as String),
  tenantId: json['tenantId'] as String?,
);

Map<String, dynamic> _$LinearAccelerationDataToJson(
  _LinearAccelerationData instance,
) => <String, dynamic>{
  'x': instance.x,
  'y': instance.y,
  'z': instance.z,
  'timestamp': instance.timestamp.toIso8601String(),
  'tenantId': instance.tenantId,
};

_DeviceOrientationData _$DeviceOrientationDataFromJson(
  Map<String, dynamic> json,
) => _DeviceOrientationData(
  orientation: (json['orientation'] as num).toInt(),
  timestamp: DateTime.parse(json['timestamp'] as String),
  tenantId: json['tenantId'] as String?,
);

Map<String, dynamic> _$DeviceOrientationDataToJson(
  _DeviceOrientationData instance,
) => <String, dynamic>{
  'orientation': instance.orientation,
  'timestamp': instance.timestamp.toIso8601String(),
  'tenantId': instance.tenantId,
};

_GameRotationVectorData _$GameRotationVectorDataFromJson(
  Map<String, dynamic> json,
) => _GameRotationVectorData(
  x: (json['x'] as num).toDouble(),
  y: (json['y'] as num).toDouble(),
  z: (json['z'] as num).toDouble(),
  w: (json['w'] as num).toDouble(),
  timestamp: DateTime.parse(json['timestamp'] as String),
  tenantId: json['tenantId'] as String?,
);

Map<String, dynamic> _$GameRotationVectorDataToJson(
  _GameRotationVectorData instance,
) => <String, dynamic>{
  'x': instance.x,
  'y': instance.y,
  'z': instance.z,
  'w': instance.w,
  'timestamp': instance.timestamp.toIso8601String(),
  'tenantId': instance.tenantId,
};

_GeomagneticRotationVectorData _$GeomagneticRotationVectorDataFromJson(
  Map<String, dynamic> json,
) => _GeomagneticRotationVectorData(
  x: (json['x'] as num).toDouble(),
  y: (json['y'] as num).toDouble(),
  z: (json['z'] as num).toDouble(),
  w: (json['w'] as num).toDouble(),
  timestamp: DateTime.parse(json['timestamp'] as String),
  tenantId: json['tenantId'] as String?,
);

Map<String, dynamic> _$GeomagneticRotationVectorDataToJson(
  _GeomagneticRotationVectorData instance,
) => <String, dynamic>{
  'x': instance.x,
  'y': instance.y,
  'z': instance.z,
  'w': instance.w,
  'timestamp': instance.timestamp.toIso8601String(),
  'tenantId': instance.tenantId,
};

_SignificantMotionData _$SignificantMotionDataFromJson(
  Map<String, dynamic> json,
) => _SignificantMotionData(
  detected: json['detected'] as bool,
  timestamp: DateTime.parse(json['timestamp'] as String),
  tenantId: json['tenantId'] as String?,
);

Map<String, dynamic> _$SignificantMotionDataToJson(
  _SignificantMotionData instance,
) => <String, dynamic>{
  'detected': instance.detected,
  'timestamp': instance.timestamp.toIso8601String(),
  'tenantId': instance.tenantId,
};

_StationaryDetectData _$StationaryDetectDataFromJson(
  Map<String, dynamic> json,
) => _StationaryDetectData(
  isStationary: json['isStationary'] as bool,
  timestamp: DateTime.parse(json['timestamp'] as String),
  tenantId: json['tenantId'] as String?,
);

Map<String, dynamic> _$StationaryDetectDataToJson(
  _StationaryDetectData instance,
) => <String, dynamic>{
  'isStationary': instance.isStationary,
  'timestamp': instance.timestamp.toIso8601String(),
  'tenantId': instance.tenantId,
};

_WakeGestureData _$WakeGestureDataFromJson(Map<String, dynamic> json) =>
    _WakeGestureData(
      detected: json['detected'] as bool,
      timestamp: DateTime.parse(json['timestamp'] as String),
      tenantId: json['tenantId'] as String?,
    );

Map<String, dynamic> _$WakeGestureDataToJson(_WakeGestureData instance) =>
    <String, dynamic>{
      'detected': instance.detected,
      'timestamp': instance.timestamp.toIso8601String(),
      'tenantId': instance.tenantId,
    };

_PickupDetectData _$PickupDetectDataFromJson(Map<String, dynamic> json) =>
    _PickupDetectData(
      detected: json['detected'] as bool,
      timestamp: DateTime.parse(json['timestamp'] as String),
      tenantId: json['tenantId'] as String?,
    );

Map<String, dynamic> _$PickupDetectDataToJson(_PickupDetectData instance) =>
    <String, dynamic>{
      'detected': instance.detected,
      'timestamp': instance.timestamp.toIso8601String(),
      'tenantId': instance.tenantId,
    };

_AccelerometerUncalibratedData _$AccelerometerUncalibratedDataFromJson(
  Map<String, dynamic> json,
) => _AccelerometerUncalibratedData(
  x: (json['x'] as num).toDouble(),
  y: (json['y'] as num).toDouble(),
  z: (json['z'] as num).toDouble(),
  xBias: (json['xBias'] as num).toDouble(),
  yBias: (json['yBias'] as num).toDouble(),
  zBias: (json['zBias'] as num).toDouble(),
  timestamp: DateTime.parse(json['timestamp'] as String),
  tenantId: json['tenantId'] as String?,
);

Map<String, dynamic> _$AccelerometerUncalibratedDataToJson(
  _AccelerometerUncalibratedData instance,
) => <String, dynamic>{
  'x': instance.x,
  'y': instance.y,
  'z': instance.z,
  'xBias': instance.xBias,
  'yBias': instance.yBias,
  'zBias': instance.zBias,
  'timestamp': instance.timestamp.toIso8601String(),
  'tenantId': instance.tenantId,
};

_MagneticFieldUncalibratedData _$MagneticFieldUncalibratedDataFromJson(
  Map<String, dynamic> json,
) => _MagneticFieldUncalibratedData(
  x: (json['x'] as num).toDouble(),
  y: (json['y'] as num).toDouble(),
  z: (json['z'] as num).toDouble(),
  xBias: (json['xBias'] as num).toDouble(),
  yBias: (json['yBias'] as num).toDouble(),
  zBias: (json['zBias'] as num).toDouble(),
  timestamp: DateTime.parse(json['timestamp'] as String),
  tenantId: json['tenantId'] as String?,
);

Map<String, dynamic> _$MagneticFieldUncalibratedDataToJson(
  _MagneticFieldUncalibratedData instance,
) => <String, dynamic>{
  'x': instance.x,
  'y': instance.y,
  'z': instance.z,
  'xBias': instance.xBias,
  'yBias': instance.yBias,
  'zBias': instance.zBias,
  'timestamp': instance.timestamp.toIso8601String(),
  'tenantId': instance.tenantId,
};

_GyroscopeUncalibratedData _$GyroscopeUncalibratedDataFromJson(
  Map<String, dynamic> json,
) => _GyroscopeUncalibratedData(
  x: (json['x'] as num).toDouble(),
  y: (json['y'] as num).toDouble(),
  z: (json['z'] as num).toDouble(),
  xDrift: (json['xDrift'] as num).toDouble(),
  yDrift: (json['yDrift'] as num).toDouble(),
  zDrift: (json['zDrift'] as num).toDouble(),
  timestamp: DateTime.parse(json['timestamp'] as String),
  tenantId: json['tenantId'] as String?,
);

Map<String, dynamic> _$GyroscopeUncalibratedDataToJson(
  _GyroscopeUncalibratedData instance,
) => <String, dynamic>{
  'x': instance.x,
  'y': instance.y,
  'z': instance.z,
  'xDrift': instance.xDrift,
  'yDrift': instance.yDrift,
  'zDrift': instance.zDrift,
  'timestamp': instance.timestamp.toIso8601String(),
  'tenantId': instance.tenantId,
};

_EnhancedSensorData _$EnhancedSensorDataFromJson(
  Map<String, dynamic> json,
) => _EnhancedSensorData(
  timestamp: DateTime.parse(json['timestamp'] as String),
  tenantId: json['tenantId'] as String?,
  accelerometer:
      json['accelerometer'] == null
          ? null
          : AccelerometerData.fromJson(
            json['accelerometer'] as Map<String, dynamic>,
          ),
  gyroscope:
      json['gyroscope'] == null
          ? null
          : GyroscopeData.fromJson(json['gyroscope'] as Map<String, dynamic>),
  magnetometer:
      json['magnetometer'] == null
          ? null
          : MagnetometerData.fromJson(
            json['magnetometer'] as Map<String, dynamic>,
          ),
  proximity:
      json['proximity'] == null
          ? null
          : ProximityData.fromJson(json['proximity'] as Map<String, dynamic>),
  light:
      json['light'] == null
          ? null
          : LightSensorData.fromJson(json['light'] as Map<String, dynamic>),
  pressure:
      json['pressure'] == null
          ? null
          : PressureData.fromJson(json['pressure'] as Map<String, dynamic>),
  stepCounter:
      json['stepCounter'] == null
          ? null
          : StepCounterData.fromJson(
            json['stepCounter'] as Map<String, dynamic>,
          ),
  stepDetector:
      json['stepDetector'] == null
          ? null
          : StepDetectorData.fromJson(
            json['stepDetector'] as Map<String, dynamic>,
          ),
  rotationVector:
      json['rotationVector'] == null
          ? null
          : RotationVectorData.fromJson(
            json['rotationVector'] as Map<String, dynamic>,
          ),
  orientation:
      json['orientation'] == null
          ? null
          : OrientationData.fromJson(
            json['orientation'] as Map<String, dynamic>,
          ),
  gravity:
      json['gravity'] == null
          ? null
          : GravityData.fromJson(json['gravity'] as Map<String, dynamic>),
  linearAcceleration:
      json['linearAcceleration'] == null
          ? null
          : LinearAccelerationData.fromJson(
            json['linearAcceleration'] as Map<String, dynamic>,
          ),
  deviceOrientation:
      json['deviceOrientation'] == null
          ? null
          : DeviceOrientationData.fromJson(
            json['deviceOrientation'] as Map<String, dynamic>,
          ),
  gameRotationVector:
      json['gameRotationVector'] == null
          ? null
          : GameRotationVectorData.fromJson(
            json['gameRotationVector'] as Map<String, dynamic>,
          ),
  geomagneticRotationVector:
      json['geomagneticRotationVector'] == null
          ? null
          : GeomagneticRotationVectorData.fromJson(
            json['geomagneticRotationVector'] as Map<String, dynamic>,
          ),
  significantMotion:
      json['significantMotion'] == null
          ? null
          : SignificantMotionData.fromJson(
            json['significantMotion'] as Map<String, dynamic>,
          ),
  stationaryDetect:
      json['stationaryDetect'] == null
          ? null
          : StationaryDetectData.fromJson(
            json['stationaryDetect'] as Map<String, dynamic>,
          ),
  wakeGesture:
      json['wakeGesture'] == null
          ? null
          : WakeGestureData.fromJson(
            json['wakeGesture'] as Map<String, dynamic>,
          ),
  pickupDetect:
      json['pickupDetect'] == null
          ? null
          : PickupDetectData.fromJson(
            json['pickupDetect'] as Map<String, dynamic>,
          ),
  accelerometerUncalibrated:
      json['accelerometerUncalibrated'] == null
          ? null
          : AccelerometerUncalibratedData.fromJson(
            json['accelerometerUncalibrated'] as Map<String, dynamic>,
          ),
  magneticFieldUncalibrated:
      json['magneticFieldUncalibrated'] == null
          ? null
          : MagneticFieldUncalibratedData.fromJson(
            json['magneticFieldUncalibrated'] as Map<String, dynamic>,
          ),
  gyroscopeUncalibrated:
      json['gyroscopeUncalibrated'] == null
          ? null
          : GyroscopeUncalibratedData.fromJson(
            json['gyroscopeUncalibrated'] as Map<String, dynamic>,
          ),
);

Map<String, dynamic> _$EnhancedSensorDataToJson(_EnhancedSensorData instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp.toIso8601String(),
      'tenantId': instance.tenantId,
      'accelerometer': instance.accelerometer,
      'gyroscope': instance.gyroscope,
      'magnetometer': instance.magnetometer,
      'proximity': instance.proximity,
      'light': instance.light,
      'pressure': instance.pressure,
      'stepCounter': instance.stepCounter,
      'stepDetector': instance.stepDetector,
      'rotationVector': instance.rotationVector,
      'orientation': instance.orientation,
      'gravity': instance.gravity,
      'linearAcceleration': instance.linearAcceleration,
      'deviceOrientation': instance.deviceOrientation,
      'gameRotationVector': instance.gameRotationVector,
      'geomagneticRotationVector': instance.geomagneticRotationVector,
      'significantMotion': instance.significantMotion,
      'stationaryDetect': instance.stationaryDetect,
      'wakeGesture': instance.wakeGesture,
      'pickupDetect': instance.pickupDetect,
      'accelerometerUncalibrated': instance.accelerometerUncalibrated,
      'magneticFieldUncalibrated': instance.magneticFieldUncalibrated,
      'gyroscopeUncalibrated': instance.gyroscopeUncalibrated,
    };
