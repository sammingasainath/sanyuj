// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SensorData _$SensorDataFromJson(Map<String, dynamic> json) => _SensorData(
  sensorName: json['sensorName'] as String,
  sensorType: json['sensorType'] as String,
  values:
      (json['values'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
  timestamp: DateTime.parse(json['timestamp'] as String),
  tenantId: json['tenantId'] as String?,
);

Map<String, dynamic> _$SensorDataToJson(_SensorData instance) =>
    <String, dynamic>{
      'sensorName': instance.sensorName,
      'sensorType': instance.sensorType,
      'values': instance.values,
      'timestamp': instance.timestamp.toIso8601String(),
      'tenantId': instance.tenantId,
    };

_AccelerometerData _$AccelerometerDataFromJson(Map<String, dynamic> json) =>
    _AccelerometerData(
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      z: (json['z'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      tenantId: json['tenantId'] as String?,
    );

Map<String, dynamic> _$AccelerometerDataToJson(_AccelerometerData instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'z': instance.z,
      'timestamp': instance.timestamp.toIso8601String(),
      'tenantId': instance.tenantId,
    };

_GyroscopeData _$GyroscopeDataFromJson(Map<String, dynamic> json) =>
    _GyroscopeData(
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      z: (json['z'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      tenantId: json['tenantId'] as String?,
    );

Map<String, dynamic> _$GyroscopeDataToJson(_GyroscopeData instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'z': instance.z,
      'timestamp': instance.timestamp.toIso8601String(),
      'tenantId': instance.tenantId,
    };

_MagnetometerData _$MagnetometerDataFromJson(Map<String, dynamic> json) =>
    _MagnetometerData(
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      z: (json['z'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      tenantId: json['tenantId'] as String?,
    );

Map<String, dynamic> _$MagnetometerDataToJson(_MagnetometerData instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'z': instance.z,
      'timestamp': instance.timestamp.toIso8601String(),
      'tenantId': instance.tenantId,
    };

_ProximityData _$ProximityDataFromJson(Map<String, dynamic> json) =>
    _ProximityData(
      distance: (json['distance'] as num).toDouble(),
      isNear: json['isNear'] as bool,
      timestamp: DateTime.parse(json['timestamp'] as String),
      tenantId: json['tenantId'] as String?,
    );

Map<String, dynamic> _$ProximityDataToJson(_ProximityData instance) =>
    <String, dynamic>{
      'distance': instance.distance,
      'isNear': instance.isNear,
      'timestamp': instance.timestamp.toIso8601String(),
      'tenantId': instance.tenantId,
    };

_LightSensorData _$LightSensorDataFromJson(Map<String, dynamic> json) =>
    _LightSensorData(
      illuminance: (json['illuminance'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      tenantId: json['tenantId'] as String?,
    );

Map<String, dynamic> _$LightSensorDataToJson(_LightSensorData instance) =>
    <String, dynamic>{
      'illuminance': instance.illuminance,
      'timestamp': instance.timestamp.toIso8601String(),
      'tenantId': instance.tenantId,
    };

_PressureData _$PressureDataFromJson(Map<String, dynamic> json) =>
    _PressureData(
      pressure: (json['pressure'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      tenantId: json['tenantId'] as String?,
    );

Map<String, dynamic> _$PressureDataToJson(_PressureData instance) =>
    <String, dynamic>{
      'pressure': instance.pressure,
      'timestamp': instance.timestamp.toIso8601String(),
      'tenantId': instance.tenantId,
    };

_CombinedSensorData _$CombinedSensorDataFromJson(
  Map<String, dynamic> json,
) => _CombinedSensorData(
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
  timestamp: DateTime.parse(json['timestamp'] as String),
  tenantId: json['tenantId'] as String?,
);

Map<String, dynamic> _$CombinedSensorDataToJson(_CombinedSensorData instance) =>
    <String, dynamic>{
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
      'gameRotationVector': instance.gameRotationVector,
      'geomagneticRotationVector': instance.geomagneticRotationVector,
      'significantMotion': instance.significantMotion,
      'stationaryDetect': instance.stationaryDetect,
      'wakeGesture': instance.wakeGesture,
      'pickupDetect': instance.pickupDetect,
      'accelerometerUncalibrated': instance.accelerometerUncalibrated,
      'magneticFieldUncalibrated': instance.magneticFieldUncalibrated,
      'gyroscopeUncalibrated': instance.gyroscopeUncalibrated,
      'timestamp': instance.timestamp.toIso8601String(),
      'tenantId': instance.tenantId,
    };

_SensorApiResponse _$SensorApiResponseFromJson(Map<String, dynamic> json) =>
    _SensorApiResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: json['data'],
    );

Map<String, dynamic> _$SensorApiResponseToJson(_SensorApiResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
