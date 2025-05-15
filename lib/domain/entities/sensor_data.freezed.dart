// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sensor_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SensorData {

 String get sensorName; String get sensorType; List<double> get values; DateTime get timestamp; String? get tenantId;
/// Create a copy of SensorData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SensorDataCopyWith<SensorData> get copyWith => _$SensorDataCopyWithImpl<SensorData>(this as SensorData, _$identity);

  /// Serializes this SensorData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SensorData&&(identical(other.sensorName, sensorName) || other.sensorName == sensorName)&&(identical(other.sensorType, sensorType) || other.sensorType == sensorType)&&const DeepCollectionEquality().equals(other.values, values)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sensorName,sensorType,const DeepCollectionEquality().hash(values),timestamp,tenantId);

@override
String toString() {
  return 'SensorData(sensorName: $sensorName, sensorType: $sensorType, values: $values, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class $SensorDataCopyWith<$Res>  {
  factory $SensorDataCopyWith(SensorData value, $Res Function(SensorData) _then) = _$SensorDataCopyWithImpl;
@useResult
$Res call({
 String sensorName, String sensorType, List<double> values, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class _$SensorDataCopyWithImpl<$Res>
    implements $SensorDataCopyWith<$Res> {
  _$SensorDataCopyWithImpl(this._self, this._then);

  final SensorData _self;
  final $Res Function(SensorData) _then;

/// Create a copy of SensorData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sensorName = null,Object? sensorType = null,Object? values = null,Object? timestamp = null,Object? tenantId = freezed,}) {
  return _then(_self.copyWith(
sensorName: null == sensorName ? _self.sensorName : sensorName // ignore: cast_nullable_to_non_nullable
as String,sensorType: null == sensorType ? _self.sensorType : sensorType // ignore: cast_nullable_to_non_nullable
as String,values: null == values ? _self.values : values // ignore: cast_nullable_to_non_nullable
as List<double>,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SensorData implements SensorData {
  const _SensorData({required this.sensorName, required this.sensorType, required final  List<double> values, required this.timestamp, this.tenantId}): _values = values;
  factory _SensorData.fromJson(Map<String, dynamic> json) => _$SensorDataFromJson(json);

@override final  String sensorName;
@override final  String sensorType;
 final  List<double> _values;
@override List<double> get values {
  if (_values is EqualUnmodifiableListView) return _values;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_values);
}

@override final  DateTime timestamp;
@override final  String? tenantId;

/// Create a copy of SensorData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SensorDataCopyWith<_SensorData> get copyWith => __$SensorDataCopyWithImpl<_SensorData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SensorDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SensorData&&(identical(other.sensorName, sensorName) || other.sensorName == sensorName)&&(identical(other.sensorType, sensorType) || other.sensorType == sensorType)&&const DeepCollectionEquality().equals(other._values, _values)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sensorName,sensorType,const DeepCollectionEquality().hash(_values),timestamp,tenantId);

@override
String toString() {
  return 'SensorData(sensorName: $sensorName, sensorType: $sensorType, values: $values, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class _$SensorDataCopyWith<$Res> implements $SensorDataCopyWith<$Res> {
  factory _$SensorDataCopyWith(_SensorData value, $Res Function(_SensorData) _then) = __$SensorDataCopyWithImpl;
@override @useResult
$Res call({
 String sensorName, String sensorType, List<double> values, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class __$SensorDataCopyWithImpl<$Res>
    implements _$SensorDataCopyWith<$Res> {
  __$SensorDataCopyWithImpl(this._self, this._then);

  final _SensorData _self;
  final $Res Function(_SensorData) _then;

/// Create a copy of SensorData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sensorName = null,Object? sensorType = null,Object? values = null,Object? timestamp = null,Object? tenantId = freezed,}) {
  return _then(_SensorData(
sensorName: null == sensorName ? _self.sensorName : sensorName // ignore: cast_nullable_to_non_nullable
as String,sensorType: null == sensorType ? _self.sensorType : sensorType // ignore: cast_nullable_to_non_nullable
as String,values: null == values ? _self._values : values // ignore: cast_nullable_to_non_nullable
as List<double>,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AccelerometerData {

 double get x; double get y; double get z; DateTime get timestamp; String? get tenantId;
/// Create a copy of AccelerometerData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccelerometerDataCopyWith<AccelerometerData> get copyWith => _$AccelerometerDataCopyWithImpl<AccelerometerData>(this as AccelerometerData, _$identity);

  /// Serializes this AccelerometerData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccelerometerData&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.z, z) || other.z == z)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,x,y,z,timestamp,tenantId);

@override
String toString() {
  return 'AccelerometerData(x: $x, y: $y, z: $z, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class $AccelerometerDataCopyWith<$Res>  {
  factory $AccelerometerDataCopyWith(AccelerometerData value, $Res Function(AccelerometerData) _then) = _$AccelerometerDataCopyWithImpl;
@useResult
$Res call({
 double x, double y, double z, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class _$AccelerometerDataCopyWithImpl<$Res>
    implements $AccelerometerDataCopyWith<$Res> {
  _$AccelerometerDataCopyWithImpl(this._self, this._then);

  final AccelerometerData _self;
  final $Res Function(AccelerometerData) _then;

/// Create a copy of AccelerometerData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? x = null,Object? y = null,Object? z = null,Object? timestamp = null,Object? tenantId = freezed,}) {
  return _then(_self.copyWith(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,z: null == z ? _self.z : z // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AccelerometerData implements AccelerometerData {
  const _AccelerometerData({required this.x, required this.y, required this.z, required this.timestamp, this.tenantId});
  factory _AccelerometerData.fromJson(Map<String, dynamic> json) => _$AccelerometerDataFromJson(json);

@override final  double x;
@override final  double y;
@override final  double z;
@override final  DateTime timestamp;
@override final  String? tenantId;

/// Create a copy of AccelerometerData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccelerometerDataCopyWith<_AccelerometerData> get copyWith => __$AccelerometerDataCopyWithImpl<_AccelerometerData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccelerometerDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccelerometerData&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.z, z) || other.z == z)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,x,y,z,timestamp,tenantId);

@override
String toString() {
  return 'AccelerometerData(x: $x, y: $y, z: $z, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class _$AccelerometerDataCopyWith<$Res> implements $AccelerometerDataCopyWith<$Res> {
  factory _$AccelerometerDataCopyWith(_AccelerometerData value, $Res Function(_AccelerometerData) _then) = __$AccelerometerDataCopyWithImpl;
@override @useResult
$Res call({
 double x, double y, double z, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class __$AccelerometerDataCopyWithImpl<$Res>
    implements _$AccelerometerDataCopyWith<$Res> {
  __$AccelerometerDataCopyWithImpl(this._self, this._then);

  final _AccelerometerData _self;
  final $Res Function(_AccelerometerData) _then;

/// Create a copy of AccelerometerData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? x = null,Object? y = null,Object? z = null,Object? timestamp = null,Object? tenantId = freezed,}) {
  return _then(_AccelerometerData(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,z: null == z ? _self.z : z // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$GyroscopeData {

 double get x; double get y; double get z; DateTime get timestamp; String? get tenantId;
/// Create a copy of GyroscopeData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GyroscopeDataCopyWith<GyroscopeData> get copyWith => _$GyroscopeDataCopyWithImpl<GyroscopeData>(this as GyroscopeData, _$identity);

  /// Serializes this GyroscopeData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GyroscopeData&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.z, z) || other.z == z)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,x,y,z,timestamp,tenantId);

@override
String toString() {
  return 'GyroscopeData(x: $x, y: $y, z: $z, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class $GyroscopeDataCopyWith<$Res>  {
  factory $GyroscopeDataCopyWith(GyroscopeData value, $Res Function(GyroscopeData) _then) = _$GyroscopeDataCopyWithImpl;
@useResult
$Res call({
 double x, double y, double z, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class _$GyroscopeDataCopyWithImpl<$Res>
    implements $GyroscopeDataCopyWith<$Res> {
  _$GyroscopeDataCopyWithImpl(this._self, this._then);

  final GyroscopeData _self;
  final $Res Function(GyroscopeData) _then;

/// Create a copy of GyroscopeData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? x = null,Object? y = null,Object? z = null,Object? timestamp = null,Object? tenantId = freezed,}) {
  return _then(_self.copyWith(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,z: null == z ? _self.z : z // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _GyroscopeData implements GyroscopeData {
  const _GyroscopeData({required this.x, required this.y, required this.z, required this.timestamp, this.tenantId});
  factory _GyroscopeData.fromJson(Map<String, dynamic> json) => _$GyroscopeDataFromJson(json);

@override final  double x;
@override final  double y;
@override final  double z;
@override final  DateTime timestamp;
@override final  String? tenantId;

/// Create a copy of GyroscopeData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GyroscopeDataCopyWith<_GyroscopeData> get copyWith => __$GyroscopeDataCopyWithImpl<_GyroscopeData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GyroscopeDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GyroscopeData&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.z, z) || other.z == z)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,x,y,z,timestamp,tenantId);

@override
String toString() {
  return 'GyroscopeData(x: $x, y: $y, z: $z, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class _$GyroscopeDataCopyWith<$Res> implements $GyroscopeDataCopyWith<$Res> {
  factory _$GyroscopeDataCopyWith(_GyroscopeData value, $Res Function(_GyroscopeData) _then) = __$GyroscopeDataCopyWithImpl;
@override @useResult
$Res call({
 double x, double y, double z, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class __$GyroscopeDataCopyWithImpl<$Res>
    implements _$GyroscopeDataCopyWith<$Res> {
  __$GyroscopeDataCopyWithImpl(this._self, this._then);

  final _GyroscopeData _self;
  final $Res Function(_GyroscopeData) _then;

/// Create a copy of GyroscopeData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? x = null,Object? y = null,Object? z = null,Object? timestamp = null,Object? tenantId = freezed,}) {
  return _then(_GyroscopeData(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,z: null == z ? _self.z : z // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$MagnetometerData {

 double get x; double get y; double get z; DateTime get timestamp; String? get tenantId;
/// Create a copy of MagnetometerData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MagnetometerDataCopyWith<MagnetometerData> get copyWith => _$MagnetometerDataCopyWithImpl<MagnetometerData>(this as MagnetometerData, _$identity);

  /// Serializes this MagnetometerData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MagnetometerData&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.z, z) || other.z == z)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,x,y,z,timestamp,tenantId);

@override
String toString() {
  return 'MagnetometerData(x: $x, y: $y, z: $z, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class $MagnetometerDataCopyWith<$Res>  {
  factory $MagnetometerDataCopyWith(MagnetometerData value, $Res Function(MagnetometerData) _then) = _$MagnetometerDataCopyWithImpl;
@useResult
$Res call({
 double x, double y, double z, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class _$MagnetometerDataCopyWithImpl<$Res>
    implements $MagnetometerDataCopyWith<$Res> {
  _$MagnetometerDataCopyWithImpl(this._self, this._then);

  final MagnetometerData _self;
  final $Res Function(MagnetometerData) _then;

/// Create a copy of MagnetometerData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? x = null,Object? y = null,Object? z = null,Object? timestamp = null,Object? tenantId = freezed,}) {
  return _then(_self.copyWith(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,z: null == z ? _self.z : z // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MagnetometerData implements MagnetometerData {
  const _MagnetometerData({required this.x, required this.y, required this.z, required this.timestamp, this.tenantId});
  factory _MagnetometerData.fromJson(Map<String, dynamic> json) => _$MagnetometerDataFromJson(json);

@override final  double x;
@override final  double y;
@override final  double z;
@override final  DateTime timestamp;
@override final  String? tenantId;

/// Create a copy of MagnetometerData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MagnetometerDataCopyWith<_MagnetometerData> get copyWith => __$MagnetometerDataCopyWithImpl<_MagnetometerData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MagnetometerDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MagnetometerData&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.z, z) || other.z == z)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,x,y,z,timestamp,tenantId);

@override
String toString() {
  return 'MagnetometerData(x: $x, y: $y, z: $z, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class _$MagnetometerDataCopyWith<$Res> implements $MagnetometerDataCopyWith<$Res> {
  factory _$MagnetometerDataCopyWith(_MagnetometerData value, $Res Function(_MagnetometerData) _then) = __$MagnetometerDataCopyWithImpl;
@override @useResult
$Res call({
 double x, double y, double z, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class __$MagnetometerDataCopyWithImpl<$Res>
    implements _$MagnetometerDataCopyWith<$Res> {
  __$MagnetometerDataCopyWithImpl(this._self, this._then);

  final _MagnetometerData _self;
  final $Res Function(_MagnetometerData) _then;

/// Create a copy of MagnetometerData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? x = null,Object? y = null,Object? z = null,Object? timestamp = null,Object? tenantId = freezed,}) {
  return _then(_MagnetometerData(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,z: null == z ? _self.z : z // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ProximityData {

 double get distance; bool get isNear; DateTime get timestamp; String? get tenantId;
/// Create a copy of ProximityData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProximityDataCopyWith<ProximityData> get copyWith => _$ProximityDataCopyWithImpl<ProximityData>(this as ProximityData, _$identity);

  /// Serializes this ProximityData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProximityData&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.isNear, isNear) || other.isNear == isNear)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,distance,isNear,timestamp,tenantId);

@override
String toString() {
  return 'ProximityData(distance: $distance, isNear: $isNear, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class $ProximityDataCopyWith<$Res>  {
  factory $ProximityDataCopyWith(ProximityData value, $Res Function(ProximityData) _then) = _$ProximityDataCopyWithImpl;
@useResult
$Res call({
 double distance, bool isNear, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class _$ProximityDataCopyWithImpl<$Res>
    implements $ProximityDataCopyWith<$Res> {
  _$ProximityDataCopyWithImpl(this._self, this._then);

  final ProximityData _self;
  final $Res Function(ProximityData) _then;

/// Create a copy of ProximityData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? distance = null,Object? isNear = null,Object? timestamp = null,Object? tenantId = freezed,}) {
  return _then(_self.copyWith(
distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double,isNear: null == isNear ? _self.isNear : isNear // ignore: cast_nullable_to_non_nullable
as bool,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ProximityData implements ProximityData {
  const _ProximityData({required this.distance, required this.isNear, required this.timestamp, this.tenantId});
  factory _ProximityData.fromJson(Map<String, dynamic> json) => _$ProximityDataFromJson(json);

@override final  double distance;
@override final  bool isNear;
@override final  DateTime timestamp;
@override final  String? tenantId;

/// Create a copy of ProximityData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProximityDataCopyWith<_ProximityData> get copyWith => __$ProximityDataCopyWithImpl<_ProximityData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProximityDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProximityData&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.isNear, isNear) || other.isNear == isNear)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,distance,isNear,timestamp,tenantId);

@override
String toString() {
  return 'ProximityData(distance: $distance, isNear: $isNear, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class _$ProximityDataCopyWith<$Res> implements $ProximityDataCopyWith<$Res> {
  factory _$ProximityDataCopyWith(_ProximityData value, $Res Function(_ProximityData) _then) = __$ProximityDataCopyWithImpl;
@override @useResult
$Res call({
 double distance, bool isNear, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class __$ProximityDataCopyWithImpl<$Res>
    implements _$ProximityDataCopyWith<$Res> {
  __$ProximityDataCopyWithImpl(this._self, this._then);

  final _ProximityData _self;
  final $Res Function(_ProximityData) _then;

/// Create a copy of ProximityData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? distance = null,Object? isNear = null,Object? timestamp = null,Object? tenantId = freezed,}) {
  return _then(_ProximityData(
distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double,isNear: null == isNear ? _self.isNear : isNear // ignore: cast_nullable_to_non_nullable
as bool,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$LightSensorData {

 double get illuminance; DateTime get timestamp; String? get tenantId;
/// Create a copy of LightSensorData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LightSensorDataCopyWith<LightSensorData> get copyWith => _$LightSensorDataCopyWithImpl<LightSensorData>(this as LightSensorData, _$identity);

  /// Serializes this LightSensorData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LightSensorData&&(identical(other.illuminance, illuminance) || other.illuminance == illuminance)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,illuminance,timestamp,tenantId);

@override
String toString() {
  return 'LightSensorData(illuminance: $illuminance, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class $LightSensorDataCopyWith<$Res>  {
  factory $LightSensorDataCopyWith(LightSensorData value, $Res Function(LightSensorData) _then) = _$LightSensorDataCopyWithImpl;
@useResult
$Res call({
 double illuminance, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class _$LightSensorDataCopyWithImpl<$Res>
    implements $LightSensorDataCopyWith<$Res> {
  _$LightSensorDataCopyWithImpl(this._self, this._then);

  final LightSensorData _self;
  final $Res Function(LightSensorData) _then;

/// Create a copy of LightSensorData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? illuminance = null,Object? timestamp = null,Object? tenantId = freezed,}) {
  return _then(_self.copyWith(
illuminance: null == illuminance ? _self.illuminance : illuminance // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _LightSensorData implements LightSensorData {
  const _LightSensorData({required this.illuminance, required this.timestamp, this.tenantId});
  factory _LightSensorData.fromJson(Map<String, dynamic> json) => _$LightSensorDataFromJson(json);

@override final  double illuminance;
@override final  DateTime timestamp;
@override final  String? tenantId;

/// Create a copy of LightSensorData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LightSensorDataCopyWith<_LightSensorData> get copyWith => __$LightSensorDataCopyWithImpl<_LightSensorData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LightSensorDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LightSensorData&&(identical(other.illuminance, illuminance) || other.illuminance == illuminance)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,illuminance,timestamp,tenantId);

@override
String toString() {
  return 'LightSensorData(illuminance: $illuminance, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class _$LightSensorDataCopyWith<$Res> implements $LightSensorDataCopyWith<$Res> {
  factory _$LightSensorDataCopyWith(_LightSensorData value, $Res Function(_LightSensorData) _then) = __$LightSensorDataCopyWithImpl;
@override @useResult
$Res call({
 double illuminance, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class __$LightSensorDataCopyWithImpl<$Res>
    implements _$LightSensorDataCopyWith<$Res> {
  __$LightSensorDataCopyWithImpl(this._self, this._then);

  final _LightSensorData _self;
  final $Res Function(_LightSensorData) _then;

/// Create a copy of LightSensorData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? illuminance = null,Object? timestamp = null,Object? tenantId = freezed,}) {
  return _then(_LightSensorData(
illuminance: null == illuminance ? _self.illuminance : illuminance // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PressureData {

 double get pressure; DateTime get timestamp; String? get tenantId;
/// Create a copy of PressureData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PressureDataCopyWith<PressureData> get copyWith => _$PressureDataCopyWithImpl<PressureData>(this as PressureData, _$identity);

  /// Serializes this PressureData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PressureData&&(identical(other.pressure, pressure) || other.pressure == pressure)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pressure,timestamp,tenantId);

@override
String toString() {
  return 'PressureData(pressure: $pressure, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class $PressureDataCopyWith<$Res>  {
  factory $PressureDataCopyWith(PressureData value, $Res Function(PressureData) _then) = _$PressureDataCopyWithImpl;
@useResult
$Res call({
 double pressure, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class _$PressureDataCopyWithImpl<$Res>
    implements $PressureDataCopyWith<$Res> {
  _$PressureDataCopyWithImpl(this._self, this._then);

  final PressureData _self;
  final $Res Function(PressureData) _then;

/// Create a copy of PressureData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pressure = null,Object? timestamp = null,Object? tenantId = freezed,}) {
  return _then(_self.copyWith(
pressure: null == pressure ? _self.pressure : pressure // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PressureData implements PressureData {
  const _PressureData({required this.pressure, required this.timestamp, this.tenantId});
  factory _PressureData.fromJson(Map<String, dynamic> json) => _$PressureDataFromJson(json);

@override final  double pressure;
@override final  DateTime timestamp;
@override final  String? tenantId;

/// Create a copy of PressureData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PressureDataCopyWith<_PressureData> get copyWith => __$PressureDataCopyWithImpl<_PressureData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PressureDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PressureData&&(identical(other.pressure, pressure) || other.pressure == pressure)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pressure,timestamp,tenantId);

@override
String toString() {
  return 'PressureData(pressure: $pressure, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class _$PressureDataCopyWith<$Res> implements $PressureDataCopyWith<$Res> {
  factory _$PressureDataCopyWith(_PressureData value, $Res Function(_PressureData) _then) = __$PressureDataCopyWithImpl;
@override @useResult
$Res call({
 double pressure, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class __$PressureDataCopyWithImpl<$Res>
    implements _$PressureDataCopyWith<$Res> {
  __$PressureDataCopyWithImpl(this._self, this._then);

  final _PressureData _self;
  final $Res Function(_PressureData) _then;

/// Create a copy of PressureData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pressure = null,Object? timestamp = null,Object? tenantId = freezed,}) {
  return _then(_PressureData(
pressure: null == pressure ? _self.pressure : pressure // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CombinedSensorData {

 AccelerometerData? get accelerometer; GyroscopeData? get gyroscope; MagnetometerData? get magnetometer; ProximityData? get proximity; LightSensorData? get light; PressureData? get pressure; DateTime get timestamp; String? get tenantId;
/// Create a copy of CombinedSensorData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CombinedSensorDataCopyWith<CombinedSensorData> get copyWith => _$CombinedSensorDataCopyWithImpl<CombinedSensorData>(this as CombinedSensorData, _$identity);

  /// Serializes this CombinedSensorData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CombinedSensorData&&(identical(other.accelerometer, accelerometer) || other.accelerometer == accelerometer)&&(identical(other.gyroscope, gyroscope) || other.gyroscope == gyroscope)&&(identical(other.magnetometer, magnetometer) || other.magnetometer == magnetometer)&&(identical(other.proximity, proximity) || other.proximity == proximity)&&(identical(other.light, light) || other.light == light)&&(identical(other.pressure, pressure) || other.pressure == pressure)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accelerometer,gyroscope,magnetometer,proximity,light,pressure,timestamp,tenantId);

@override
String toString() {
  return 'CombinedSensorData(accelerometer: $accelerometer, gyroscope: $gyroscope, magnetometer: $magnetometer, proximity: $proximity, light: $light, pressure: $pressure, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class $CombinedSensorDataCopyWith<$Res>  {
  factory $CombinedSensorDataCopyWith(CombinedSensorData value, $Res Function(CombinedSensorData) _then) = _$CombinedSensorDataCopyWithImpl;
@useResult
$Res call({
 AccelerometerData? accelerometer, GyroscopeData? gyroscope, MagnetometerData? magnetometer, ProximityData? proximity, LightSensorData? light, PressureData? pressure, DateTime timestamp, String? tenantId
});


$AccelerometerDataCopyWith<$Res>? get accelerometer;$GyroscopeDataCopyWith<$Res>? get gyroscope;$MagnetometerDataCopyWith<$Res>? get magnetometer;$ProximityDataCopyWith<$Res>? get proximity;$LightSensorDataCopyWith<$Res>? get light;$PressureDataCopyWith<$Res>? get pressure;

}
/// @nodoc
class _$CombinedSensorDataCopyWithImpl<$Res>
    implements $CombinedSensorDataCopyWith<$Res> {
  _$CombinedSensorDataCopyWithImpl(this._self, this._then);

  final CombinedSensorData _self;
  final $Res Function(CombinedSensorData) _then;

/// Create a copy of CombinedSensorData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accelerometer = freezed,Object? gyroscope = freezed,Object? magnetometer = freezed,Object? proximity = freezed,Object? light = freezed,Object? pressure = freezed,Object? timestamp = null,Object? tenantId = freezed,}) {
  return _then(_self.copyWith(
accelerometer: freezed == accelerometer ? _self.accelerometer : accelerometer // ignore: cast_nullable_to_non_nullable
as AccelerometerData?,gyroscope: freezed == gyroscope ? _self.gyroscope : gyroscope // ignore: cast_nullable_to_non_nullable
as GyroscopeData?,magnetometer: freezed == magnetometer ? _self.magnetometer : magnetometer // ignore: cast_nullable_to_non_nullable
as MagnetometerData?,proximity: freezed == proximity ? _self.proximity : proximity // ignore: cast_nullable_to_non_nullable
as ProximityData?,light: freezed == light ? _self.light : light // ignore: cast_nullable_to_non_nullable
as LightSensorData?,pressure: freezed == pressure ? _self.pressure : pressure // ignore: cast_nullable_to_non_nullable
as PressureData?,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of CombinedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccelerometerDataCopyWith<$Res>? get accelerometer {
    if (_self.accelerometer == null) {
    return null;
  }

  return $AccelerometerDataCopyWith<$Res>(_self.accelerometer!, (value) {
    return _then(_self.copyWith(accelerometer: value));
  });
}/// Create a copy of CombinedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GyroscopeDataCopyWith<$Res>? get gyroscope {
    if (_self.gyroscope == null) {
    return null;
  }

  return $GyroscopeDataCopyWith<$Res>(_self.gyroscope!, (value) {
    return _then(_self.copyWith(gyroscope: value));
  });
}/// Create a copy of CombinedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MagnetometerDataCopyWith<$Res>? get magnetometer {
    if (_self.magnetometer == null) {
    return null;
  }

  return $MagnetometerDataCopyWith<$Res>(_self.magnetometer!, (value) {
    return _then(_self.copyWith(magnetometer: value));
  });
}/// Create a copy of CombinedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProximityDataCopyWith<$Res>? get proximity {
    if (_self.proximity == null) {
    return null;
  }

  return $ProximityDataCopyWith<$Res>(_self.proximity!, (value) {
    return _then(_self.copyWith(proximity: value));
  });
}/// Create a copy of CombinedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LightSensorDataCopyWith<$Res>? get light {
    if (_self.light == null) {
    return null;
  }

  return $LightSensorDataCopyWith<$Res>(_self.light!, (value) {
    return _then(_self.copyWith(light: value));
  });
}/// Create a copy of CombinedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PressureDataCopyWith<$Res>? get pressure {
    if (_self.pressure == null) {
    return null;
  }

  return $PressureDataCopyWith<$Res>(_self.pressure!, (value) {
    return _then(_self.copyWith(pressure: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _CombinedSensorData implements CombinedSensorData {
  const _CombinedSensorData({this.accelerometer, this.gyroscope, this.magnetometer, this.proximity, this.light, this.pressure, required this.timestamp, this.tenantId});
  factory _CombinedSensorData.fromJson(Map<String, dynamic> json) => _$CombinedSensorDataFromJson(json);

@override final  AccelerometerData? accelerometer;
@override final  GyroscopeData? gyroscope;
@override final  MagnetometerData? magnetometer;
@override final  ProximityData? proximity;
@override final  LightSensorData? light;
@override final  PressureData? pressure;
@override final  DateTime timestamp;
@override final  String? tenantId;

/// Create a copy of CombinedSensorData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CombinedSensorDataCopyWith<_CombinedSensorData> get copyWith => __$CombinedSensorDataCopyWithImpl<_CombinedSensorData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CombinedSensorDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CombinedSensorData&&(identical(other.accelerometer, accelerometer) || other.accelerometer == accelerometer)&&(identical(other.gyroscope, gyroscope) || other.gyroscope == gyroscope)&&(identical(other.magnetometer, magnetometer) || other.magnetometer == magnetometer)&&(identical(other.proximity, proximity) || other.proximity == proximity)&&(identical(other.light, light) || other.light == light)&&(identical(other.pressure, pressure) || other.pressure == pressure)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accelerometer,gyroscope,magnetometer,proximity,light,pressure,timestamp,tenantId);

@override
String toString() {
  return 'CombinedSensorData(accelerometer: $accelerometer, gyroscope: $gyroscope, magnetometer: $magnetometer, proximity: $proximity, light: $light, pressure: $pressure, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class _$CombinedSensorDataCopyWith<$Res> implements $CombinedSensorDataCopyWith<$Res> {
  factory _$CombinedSensorDataCopyWith(_CombinedSensorData value, $Res Function(_CombinedSensorData) _then) = __$CombinedSensorDataCopyWithImpl;
@override @useResult
$Res call({
 AccelerometerData? accelerometer, GyroscopeData? gyroscope, MagnetometerData? magnetometer, ProximityData? proximity, LightSensorData? light, PressureData? pressure, DateTime timestamp, String? tenantId
});


@override $AccelerometerDataCopyWith<$Res>? get accelerometer;@override $GyroscopeDataCopyWith<$Res>? get gyroscope;@override $MagnetometerDataCopyWith<$Res>? get magnetometer;@override $ProximityDataCopyWith<$Res>? get proximity;@override $LightSensorDataCopyWith<$Res>? get light;@override $PressureDataCopyWith<$Res>? get pressure;

}
/// @nodoc
class __$CombinedSensorDataCopyWithImpl<$Res>
    implements _$CombinedSensorDataCopyWith<$Res> {
  __$CombinedSensorDataCopyWithImpl(this._self, this._then);

  final _CombinedSensorData _self;
  final $Res Function(_CombinedSensorData) _then;

/// Create a copy of CombinedSensorData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accelerometer = freezed,Object? gyroscope = freezed,Object? magnetometer = freezed,Object? proximity = freezed,Object? light = freezed,Object? pressure = freezed,Object? timestamp = null,Object? tenantId = freezed,}) {
  return _then(_CombinedSensorData(
accelerometer: freezed == accelerometer ? _self.accelerometer : accelerometer // ignore: cast_nullable_to_non_nullable
as AccelerometerData?,gyroscope: freezed == gyroscope ? _self.gyroscope : gyroscope // ignore: cast_nullable_to_non_nullable
as GyroscopeData?,magnetometer: freezed == magnetometer ? _self.magnetometer : magnetometer // ignore: cast_nullable_to_non_nullable
as MagnetometerData?,proximity: freezed == proximity ? _self.proximity : proximity // ignore: cast_nullable_to_non_nullable
as ProximityData?,light: freezed == light ? _self.light : light // ignore: cast_nullable_to_non_nullable
as LightSensorData?,pressure: freezed == pressure ? _self.pressure : pressure // ignore: cast_nullable_to_non_nullable
as PressureData?,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of CombinedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccelerometerDataCopyWith<$Res>? get accelerometer {
    if (_self.accelerometer == null) {
    return null;
  }

  return $AccelerometerDataCopyWith<$Res>(_self.accelerometer!, (value) {
    return _then(_self.copyWith(accelerometer: value));
  });
}/// Create a copy of CombinedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GyroscopeDataCopyWith<$Res>? get gyroscope {
    if (_self.gyroscope == null) {
    return null;
  }

  return $GyroscopeDataCopyWith<$Res>(_self.gyroscope!, (value) {
    return _then(_self.copyWith(gyroscope: value));
  });
}/// Create a copy of CombinedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MagnetometerDataCopyWith<$Res>? get magnetometer {
    if (_self.magnetometer == null) {
    return null;
  }

  return $MagnetometerDataCopyWith<$Res>(_self.magnetometer!, (value) {
    return _then(_self.copyWith(magnetometer: value));
  });
}/// Create a copy of CombinedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProximityDataCopyWith<$Res>? get proximity {
    if (_self.proximity == null) {
    return null;
  }

  return $ProximityDataCopyWith<$Res>(_self.proximity!, (value) {
    return _then(_self.copyWith(proximity: value));
  });
}/// Create a copy of CombinedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LightSensorDataCopyWith<$Res>? get light {
    if (_self.light == null) {
    return null;
  }

  return $LightSensorDataCopyWith<$Res>(_self.light!, (value) {
    return _then(_self.copyWith(light: value));
  });
}/// Create a copy of CombinedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PressureDataCopyWith<$Res>? get pressure {
    if (_self.pressure == null) {
    return null;
  }

  return $PressureDataCopyWith<$Res>(_self.pressure!, (value) {
    return _then(_self.copyWith(pressure: value));
  });
}
}


/// @nodoc
mixin _$SensorApiResponse {

 bool get success; String get message; dynamic get data;
/// Create a copy of SensorApiResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SensorApiResponseCopyWith<SensorApiResponse> get copyWith => _$SensorApiResponseCopyWithImpl<SensorApiResponse>(this as SensorApiResponse, _$identity);

  /// Serializes this SensorApiResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SensorApiResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'SensorApiResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $SensorApiResponseCopyWith<$Res>  {
  factory $SensorApiResponseCopyWith(SensorApiResponse value, $Res Function(SensorApiResponse) _then) = _$SensorApiResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, dynamic data
});




}
/// @nodoc
class _$SensorApiResponseCopyWithImpl<$Res>
    implements $SensorApiResponseCopyWith<$Res> {
  _$SensorApiResponseCopyWithImpl(this._self, this._then);

  final SensorApiResponse _self;
  final $Res Function(SensorApiResponse) _then;

/// Create a copy of SensorApiResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SensorApiResponse implements SensorApiResponse {
  const _SensorApiResponse({required this.success, required this.message, this.data});
  factory _SensorApiResponse.fromJson(Map<String, dynamic> json) => _$SensorApiResponseFromJson(json);

@override final  bool success;
@override final  String message;
@override final  dynamic data;

/// Create a copy of SensorApiResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SensorApiResponseCopyWith<_SensorApiResponse> get copyWith => __$SensorApiResponseCopyWithImpl<_SensorApiResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SensorApiResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SensorApiResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'SensorApiResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$SensorApiResponseCopyWith<$Res> implements $SensorApiResponseCopyWith<$Res> {
  factory _$SensorApiResponseCopyWith(_SensorApiResponse value, $Res Function(_SensorApiResponse) _then) = __$SensorApiResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, dynamic data
});




}
/// @nodoc
class __$SensorApiResponseCopyWithImpl<$Res>
    implements _$SensorApiResponseCopyWith<$Res> {
  __$SensorApiResponseCopyWithImpl(this._self, this._then);

  final _SensorApiResponse _self;
  final $Res Function(_SensorApiResponse) _then;

/// Create a copy of SensorApiResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = freezed,}) {
  return _then(_SensorApiResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
