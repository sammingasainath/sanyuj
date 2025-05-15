// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'additional_sensors.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StepCounterData {

 int get steps; DateTime get timestamp; String? get tenantId;
/// Create a copy of StepCounterData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StepCounterDataCopyWith<StepCounterData> get copyWith => _$StepCounterDataCopyWithImpl<StepCounterData>(this as StepCounterData, _$identity);

  /// Serializes this StepCounterData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StepCounterData&&(identical(other.steps, steps) || other.steps == steps)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,steps,timestamp,tenantId);

@override
String toString() {
  return 'StepCounterData(steps: $steps, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class $StepCounterDataCopyWith<$Res>  {
  factory $StepCounterDataCopyWith(StepCounterData value, $Res Function(StepCounterData) _then) = _$StepCounterDataCopyWithImpl;
@useResult
$Res call({
 int steps, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class _$StepCounterDataCopyWithImpl<$Res>
    implements $StepCounterDataCopyWith<$Res> {
  _$StepCounterDataCopyWithImpl(this._self, this._then);

  final StepCounterData _self;
  final $Res Function(StepCounterData) _then;

/// Create a copy of StepCounterData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? steps = null,Object? timestamp = null,Object? tenantId = freezed,}) {
  return _then(_self.copyWith(
steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as int,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _StepCounterData implements StepCounterData {
  const _StepCounterData({required this.steps, required this.timestamp, this.tenantId});
  factory _StepCounterData.fromJson(Map<String, dynamic> json) => _$StepCounterDataFromJson(json);

@override final  int steps;
@override final  DateTime timestamp;
@override final  String? tenantId;

/// Create a copy of StepCounterData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StepCounterDataCopyWith<_StepCounterData> get copyWith => __$StepCounterDataCopyWithImpl<_StepCounterData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StepCounterDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StepCounterData&&(identical(other.steps, steps) || other.steps == steps)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,steps,timestamp,tenantId);

@override
String toString() {
  return 'StepCounterData(steps: $steps, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class _$StepCounterDataCopyWith<$Res> implements $StepCounterDataCopyWith<$Res> {
  factory _$StepCounterDataCopyWith(_StepCounterData value, $Res Function(_StepCounterData) _then) = __$StepCounterDataCopyWithImpl;
@override @useResult
$Res call({
 int steps, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class __$StepCounterDataCopyWithImpl<$Res>
    implements _$StepCounterDataCopyWith<$Res> {
  __$StepCounterDataCopyWithImpl(this._self, this._then);

  final _StepCounterData _self;
  final $Res Function(_StepCounterData) _then;

/// Create a copy of StepCounterData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? steps = null,Object? timestamp = null,Object? tenantId = freezed,}) {
  return _then(_StepCounterData(
steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as int,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$StepDetectorData {

 bool get detected; DateTime get timestamp; String? get tenantId;
/// Create a copy of StepDetectorData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StepDetectorDataCopyWith<StepDetectorData> get copyWith => _$StepDetectorDataCopyWithImpl<StepDetectorData>(this as StepDetectorData, _$identity);

  /// Serializes this StepDetectorData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StepDetectorData&&(identical(other.detected, detected) || other.detected == detected)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,detected,timestamp,tenantId);

@override
String toString() {
  return 'StepDetectorData(detected: $detected, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class $StepDetectorDataCopyWith<$Res>  {
  factory $StepDetectorDataCopyWith(StepDetectorData value, $Res Function(StepDetectorData) _then) = _$StepDetectorDataCopyWithImpl;
@useResult
$Res call({
 bool detected, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class _$StepDetectorDataCopyWithImpl<$Res>
    implements $StepDetectorDataCopyWith<$Res> {
  _$StepDetectorDataCopyWithImpl(this._self, this._then);

  final StepDetectorData _self;
  final $Res Function(StepDetectorData) _then;

/// Create a copy of StepDetectorData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? detected = null,Object? timestamp = null,Object? tenantId = freezed,}) {
  return _then(_self.copyWith(
detected: null == detected ? _self.detected : detected // ignore: cast_nullable_to_non_nullable
as bool,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _StepDetectorData implements StepDetectorData {
  const _StepDetectorData({required this.detected, required this.timestamp, this.tenantId});
  factory _StepDetectorData.fromJson(Map<String, dynamic> json) => _$StepDetectorDataFromJson(json);

@override final  bool detected;
@override final  DateTime timestamp;
@override final  String? tenantId;

/// Create a copy of StepDetectorData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StepDetectorDataCopyWith<_StepDetectorData> get copyWith => __$StepDetectorDataCopyWithImpl<_StepDetectorData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StepDetectorDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StepDetectorData&&(identical(other.detected, detected) || other.detected == detected)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,detected,timestamp,tenantId);

@override
String toString() {
  return 'StepDetectorData(detected: $detected, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class _$StepDetectorDataCopyWith<$Res> implements $StepDetectorDataCopyWith<$Res> {
  factory _$StepDetectorDataCopyWith(_StepDetectorData value, $Res Function(_StepDetectorData) _then) = __$StepDetectorDataCopyWithImpl;
@override @useResult
$Res call({
 bool detected, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class __$StepDetectorDataCopyWithImpl<$Res>
    implements _$StepDetectorDataCopyWith<$Res> {
  __$StepDetectorDataCopyWithImpl(this._self, this._then);

  final _StepDetectorData _self;
  final $Res Function(_StepDetectorData) _then;

/// Create a copy of StepDetectorData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? detected = null,Object? timestamp = null,Object? tenantId = freezed,}) {
  return _then(_StepDetectorData(
detected: null == detected ? _self.detected : detected // ignore: cast_nullable_to_non_nullable
as bool,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$RotationVectorData {

 double get x; double get y; double get z; double get w;// cos(θ/2), where θ is the rotation angle
 DateTime get timestamp; String? get tenantId;
/// Create a copy of RotationVectorData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RotationVectorDataCopyWith<RotationVectorData> get copyWith => _$RotationVectorDataCopyWithImpl<RotationVectorData>(this as RotationVectorData, _$identity);

  /// Serializes this RotationVectorData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RotationVectorData&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.z, z) || other.z == z)&&(identical(other.w, w) || other.w == w)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,x,y,z,w,timestamp,tenantId);

@override
String toString() {
  return 'RotationVectorData(x: $x, y: $y, z: $z, w: $w, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class $RotationVectorDataCopyWith<$Res>  {
  factory $RotationVectorDataCopyWith(RotationVectorData value, $Res Function(RotationVectorData) _then) = _$RotationVectorDataCopyWithImpl;
@useResult
$Res call({
 double x, double y, double z, double w, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class _$RotationVectorDataCopyWithImpl<$Res>
    implements $RotationVectorDataCopyWith<$Res> {
  _$RotationVectorDataCopyWithImpl(this._self, this._then);

  final RotationVectorData _self;
  final $Res Function(RotationVectorData) _then;

/// Create a copy of RotationVectorData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? x = null,Object? y = null,Object? z = null,Object? w = null,Object? timestamp = null,Object? tenantId = freezed,}) {
  return _then(_self.copyWith(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,z: null == z ? _self.z : z // ignore: cast_nullable_to_non_nullable
as double,w: null == w ? _self.w : w // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _RotationVectorData implements RotationVectorData {
  const _RotationVectorData({required this.x, required this.y, required this.z, required this.w, required this.timestamp, this.tenantId});
  factory _RotationVectorData.fromJson(Map<String, dynamic> json) => _$RotationVectorDataFromJson(json);

@override final  double x;
@override final  double y;
@override final  double z;
@override final  double w;
// cos(θ/2), where θ is the rotation angle
@override final  DateTime timestamp;
@override final  String? tenantId;

/// Create a copy of RotationVectorData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RotationVectorDataCopyWith<_RotationVectorData> get copyWith => __$RotationVectorDataCopyWithImpl<_RotationVectorData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RotationVectorDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RotationVectorData&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.z, z) || other.z == z)&&(identical(other.w, w) || other.w == w)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,x,y,z,w,timestamp,tenantId);

@override
String toString() {
  return 'RotationVectorData(x: $x, y: $y, z: $z, w: $w, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class _$RotationVectorDataCopyWith<$Res> implements $RotationVectorDataCopyWith<$Res> {
  factory _$RotationVectorDataCopyWith(_RotationVectorData value, $Res Function(_RotationVectorData) _then) = __$RotationVectorDataCopyWithImpl;
@override @useResult
$Res call({
 double x, double y, double z, double w, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class __$RotationVectorDataCopyWithImpl<$Res>
    implements _$RotationVectorDataCopyWith<$Res> {
  __$RotationVectorDataCopyWithImpl(this._self, this._then);

  final _RotationVectorData _self;
  final $Res Function(_RotationVectorData) _then;

/// Create a copy of RotationVectorData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? x = null,Object? y = null,Object? z = null,Object? w = null,Object? timestamp = null,Object? tenantId = freezed,}) {
  return _then(_RotationVectorData(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,z: null == z ? _self.z : z // ignore: cast_nullable_to_non_nullable
as double,w: null == w ? _self.w : w // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$OrientationData {

 double get azimuth;// Z-axis rotation in degrees (0-359)
 double get pitch;// X-axis rotation in degrees (-180 to 180)
 double get roll;// Y-axis rotation in degrees (-90 to 90)
 DateTime get timestamp; String? get tenantId;
/// Create a copy of OrientationData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrientationDataCopyWith<OrientationData> get copyWith => _$OrientationDataCopyWithImpl<OrientationData>(this as OrientationData, _$identity);

  /// Serializes this OrientationData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrientationData&&(identical(other.azimuth, azimuth) || other.azimuth == azimuth)&&(identical(other.pitch, pitch) || other.pitch == pitch)&&(identical(other.roll, roll) || other.roll == roll)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,azimuth,pitch,roll,timestamp,tenantId);

@override
String toString() {
  return 'OrientationData(azimuth: $azimuth, pitch: $pitch, roll: $roll, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class $OrientationDataCopyWith<$Res>  {
  factory $OrientationDataCopyWith(OrientationData value, $Res Function(OrientationData) _then) = _$OrientationDataCopyWithImpl;
@useResult
$Res call({
 double azimuth, double pitch, double roll, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class _$OrientationDataCopyWithImpl<$Res>
    implements $OrientationDataCopyWith<$Res> {
  _$OrientationDataCopyWithImpl(this._self, this._then);

  final OrientationData _self;
  final $Res Function(OrientationData) _then;

/// Create a copy of OrientationData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? azimuth = null,Object? pitch = null,Object? roll = null,Object? timestamp = null,Object? tenantId = freezed,}) {
  return _then(_self.copyWith(
azimuth: null == azimuth ? _self.azimuth : azimuth // ignore: cast_nullable_to_non_nullable
as double,pitch: null == pitch ? _self.pitch : pitch // ignore: cast_nullable_to_non_nullable
as double,roll: null == roll ? _self.roll : roll // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _OrientationData implements OrientationData {
  const _OrientationData({required this.azimuth, required this.pitch, required this.roll, required this.timestamp, this.tenantId});
  factory _OrientationData.fromJson(Map<String, dynamic> json) => _$OrientationDataFromJson(json);

@override final  double azimuth;
// Z-axis rotation in degrees (0-359)
@override final  double pitch;
// X-axis rotation in degrees (-180 to 180)
@override final  double roll;
// Y-axis rotation in degrees (-90 to 90)
@override final  DateTime timestamp;
@override final  String? tenantId;

/// Create a copy of OrientationData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrientationDataCopyWith<_OrientationData> get copyWith => __$OrientationDataCopyWithImpl<_OrientationData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrientationDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrientationData&&(identical(other.azimuth, azimuth) || other.azimuth == azimuth)&&(identical(other.pitch, pitch) || other.pitch == pitch)&&(identical(other.roll, roll) || other.roll == roll)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,azimuth,pitch,roll,timestamp,tenantId);

@override
String toString() {
  return 'OrientationData(azimuth: $azimuth, pitch: $pitch, roll: $roll, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class _$OrientationDataCopyWith<$Res> implements $OrientationDataCopyWith<$Res> {
  factory _$OrientationDataCopyWith(_OrientationData value, $Res Function(_OrientationData) _then) = __$OrientationDataCopyWithImpl;
@override @useResult
$Res call({
 double azimuth, double pitch, double roll, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class __$OrientationDataCopyWithImpl<$Res>
    implements _$OrientationDataCopyWith<$Res> {
  __$OrientationDataCopyWithImpl(this._self, this._then);

  final _OrientationData _self;
  final $Res Function(_OrientationData) _then;

/// Create a copy of OrientationData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? azimuth = null,Object? pitch = null,Object? roll = null,Object? timestamp = null,Object? tenantId = freezed,}) {
  return _then(_OrientationData(
azimuth: null == azimuth ? _self.azimuth : azimuth // ignore: cast_nullable_to_non_nullable
as double,pitch: null == pitch ? _self.pitch : pitch // ignore: cast_nullable_to_non_nullable
as double,roll: null == roll ? _self.roll : roll // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$GravityData {

 double get x; double get y; double get z; DateTime get timestamp; String? get tenantId;
/// Create a copy of GravityData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GravityDataCopyWith<GravityData> get copyWith => _$GravityDataCopyWithImpl<GravityData>(this as GravityData, _$identity);

  /// Serializes this GravityData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GravityData&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.z, z) || other.z == z)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,x,y,z,timestamp,tenantId);

@override
String toString() {
  return 'GravityData(x: $x, y: $y, z: $z, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class $GravityDataCopyWith<$Res>  {
  factory $GravityDataCopyWith(GravityData value, $Res Function(GravityData) _then) = _$GravityDataCopyWithImpl;
@useResult
$Res call({
 double x, double y, double z, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class _$GravityDataCopyWithImpl<$Res>
    implements $GravityDataCopyWith<$Res> {
  _$GravityDataCopyWithImpl(this._self, this._then);

  final GravityData _self;
  final $Res Function(GravityData) _then;

/// Create a copy of GravityData
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

class _GravityData implements GravityData {
  const _GravityData({required this.x, required this.y, required this.z, required this.timestamp, this.tenantId});
  factory _GravityData.fromJson(Map<String, dynamic> json) => _$GravityDataFromJson(json);

@override final  double x;
@override final  double y;
@override final  double z;
@override final  DateTime timestamp;
@override final  String? tenantId;

/// Create a copy of GravityData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GravityDataCopyWith<_GravityData> get copyWith => __$GravityDataCopyWithImpl<_GravityData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GravityDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GravityData&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.z, z) || other.z == z)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,x,y,z,timestamp,tenantId);

@override
String toString() {
  return 'GravityData(x: $x, y: $y, z: $z, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class _$GravityDataCopyWith<$Res> implements $GravityDataCopyWith<$Res> {
  factory _$GravityDataCopyWith(_GravityData value, $Res Function(_GravityData) _then) = __$GravityDataCopyWithImpl;
@override @useResult
$Res call({
 double x, double y, double z, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class __$GravityDataCopyWithImpl<$Res>
    implements _$GravityDataCopyWith<$Res> {
  __$GravityDataCopyWithImpl(this._self, this._then);

  final _GravityData _self;
  final $Res Function(_GravityData) _then;

/// Create a copy of GravityData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? x = null,Object? y = null,Object? z = null,Object? timestamp = null,Object? tenantId = freezed,}) {
  return _then(_GravityData(
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
mixin _$LinearAccelerationData {

 double get x; double get y; double get z; DateTime get timestamp; String? get tenantId;
/// Create a copy of LinearAccelerationData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LinearAccelerationDataCopyWith<LinearAccelerationData> get copyWith => _$LinearAccelerationDataCopyWithImpl<LinearAccelerationData>(this as LinearAccelerationData, _$identity);

  /// Serializes this LinearAccelerationData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LinearAccelerationData&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.z, z) || other.z == z)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,x,y,z,timestamp,tenantId);

@override
String toString() {
  return 'LinearAccelerationData(x: $x, y: $y, z: $z, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class $LinearAccelerationDataCopyWith<$Res>  {
  factory $LinearAccelerationDataCopyWith(LinearAccelerationData value, $Res Function(LinearAccelerationData) _then) = _$LinearAccelerationDataCopyWithImpl;
@useResult
$Res call({
 double x, double y, double z, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class _$LinearAccelerationDataCopyWithImpl<$Res>
    implements $LinearAccelerationDataCopyWith<$Res> {
  _$LinearAccelerationDataCopyWithImpl(this._self, this._then);

  final LinearAccelerationData _self;
  final $Res Function(LinearAccelerationData) _then;

/// Create a copy of LinearAccelerationData
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

class _LinearAccelerationData implements LinearAccelerationData {
  const _LinearAccelerationData({required this.x, required this.y, required this.z, required this.timestamp, this.tenantId});
  factory _LinearAccelerationData.fromJson(Map<String, dynamic> json) => _$LinearAccelerationDataFromJson(json);

@override final  double x;
@override final  double y;
@override final  double z;
@override final  DateTime timestamp;
@override final  String? tenantId;

/// Create a copy of LinearAccelerationData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LinearAccelerationDataCopyWith<_LinearAccelerationData> get copyWith => __$LinearAccelerationDataCopyWithImpl<_LinearAccelerationData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LinearAccelerationDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LinearAccelerationData&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.z, z) || other.z == z)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,x,y,z,timestamp,tenantId);

@override
String toString() {
  return 'LinearAccelerationData(x: $x, y: $y, z: $z, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class _$LinearAccelerationDataCopyWith<$Res> implements $LinearAccelerationDataCopyWith<$Res> {
  factory _$LinearAccelerationDataCopyWith(_LinearAccelerationData value, $Res Function(_LinearAccelerationData) _then) = __$LinearAccelerationDataCopyWithImpl;
@override @useResult
$Res call({
 double x, double y, double z, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class __$LinearAccelerationDataCopyWithImpl<$Res>
    implements _$LinearAccelerationDataCopyWith<$Res> {
  __$LinearAccelerationDataCopyWithImpl(this._self, this._then);

  final _LinearAccelerationData _self;
  final $Res Function(_LinearAccelerationData) _then;

/// Create a copy of LinearAccelerationData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? x = null,Object? y = null,Object? z = null,Object? timestamp = null,Object? tenantId = freezed,}) {
  return _then(_LinearAccelerationData(
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
mixin _$DeviceOrientationData {

 int get orientation;// 0: portrait, 1: landscape left, 2: portrait upside down, 3: landscape right
 DateTime get timestamp; String? get tenantId;
/// Create a copy of DeviceOrientationData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceOrientationDataCopyWith<DeviceOrientationData> get copyWith => _$DeviceOrientationDataCopyWithImpl<DeviceOrientationData>(this as DeviceOrientationData, _$identity);

  /// Serializes this DeviceOrientationData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceOrientationData&&(identical(other.orientation, orientation) || other.orientation == orientation)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orientation,timestamp,tenantId);

@override
String toString() {
  return 'DeviceOrientationData(orientation: $orientation, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class $DeviceOrientationDataCopyWith<$Res>  {
  factory $DeviceOrientationDataCopyWith(DeviceOrientationData value, $Res Function(DeviceOrientationData) _then) = _$DeviceOrientationDataCopyWithImpl;
@useResult
$Res call({
 int orientation, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class _$DeviceOrientationDataCopyWithImpl<$Res>
    implements $DeviceOrientationDataCopyWith<$Res> {
  _$DeviceOrientationDataCopyWithImpl(this._self, this._then);

  final DeviceOrientationData _self;
  final $Res Function(DeviceOrientationData) _then;

/// Create a copy of DeviceOrientationData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orientation = null,Object? timestamp = null,Object? tenantId = freezed,}) {
  return _then(_self.copyWith(
orientation: null == orientation ? _self.orientation : orientation // ignore: cast_nullable_to_non_nullable
as int,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _DeviceOrientationData implements DeviceOrientationData {
  const _DeviceOrientationData({required this.orientation, required this.timestamp, this.tenantId});
  factory _DeviceOrientationData.fromJson(Map<String, dynamic> json) => _$DeviceOrientationDataFromJson(json);

@override final  int orientation;
// 0: portrait, 1: landscape left, 2: portrait upside down, 3: landscape right
@override final  DateTime timestamp;
@override final  String? tenantId;

/// Create a copy of DeviceOrientationData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceOrientationDataCopyWith<_DeviceOrientationData> get copyWith => __$DeviceOrientationDataCopyWithImpl<_DeviceOrientationData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeviceOrientationDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceOrientationData&&(identical(other.orientation, orientation) || other.orientation == orientation)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orientation,timestamp,tenantId);

@override
String toString() {
  return 'DeviceOrientationData(orientation: $orientation, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class _$DeviceOrientationDataCopyWith<$Res> implements $DeviceOrientationDataCopyWith<$Res> {
  factory _$DeviceOrientationDataCopyWith(_DeviceOrientationData value, $Res Function(_DeviceOrientationData) _then) = __$DeviceOrientationDataCopyWithImpl;
@override @useResult
$Res call({
 int orientation, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class __$DeviceOrientationDataCopyWithImpl<$Res>
    implements _$DeviceOrientationDataCopyWith<$Res> {
  __$DeviceOrientationDataCopyWithImpl(this._self, this._then);

  final _DeviceOrientationData _self;
  final $Res Function(_DeviceOrientationData) _then;

/// Create a copy of DeviceOrientationData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orientation = null,Object? timestamp = null,Object? tenantId = freezed,}) {
  return _then(_DeviceOrientationData(
orientation: null == orientation ? _self.orientation : orientation // ignore: cast_nullable_to_non_nullable
as int,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$GameRotationVectorData {

 double get x; double get y; double get z; double get w; DateTime get timestamp; String? get tenantId;
/// Create a copy of GameRotationVectorData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameRotationVectorDataCopyWith<GameRotationVectorData> get copyWith => _$GameRotationVectorDataCopyWithImpl<GameRotationVectorData>(this as GameRotationVectorData, _$identity);

  /// Serializes this GameRotationVectorData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameRotationVectorData&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.z, z) || other.z == z)&&(identical(other.w, w) || other.w == w)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,x,y,z,w,timestamp,tenantId);

@override
String toString() {
  return 'GameRotationVectorData(x: $x, y: $y, z: $z, w: $w, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class $GameRotationVectorDataCopyWith<$Res>  {
  factory $GameRotationVectorDataCopyWith(GameRotationVectorData value, $Res Function(GameRotationVectorData) _then) = _$GameRotationVectorDataCopyWithImpl;
@useResult
$Res call({
 double x, double y, double z, double w, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class _$GameRotationVectorDataCopyWithImpl<$Res>
    implements $GameRotationVectorDataCopyWith<$Res> {
  _$GameRotationVectorDataCopyWithImpl(this._self, this._then);

  final GameRotationVectorData _self;
  final $Res Function(GameRotationVectorData) _then;

/// Create a copy of GameRotationVectorData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? x = null,Object? y = null,Object? z = null,Object? w = null,Object? timestamp = null,Object? tenantId = freezed,}) {
  return _then(_self.copyWith(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,z: null == z ? _self.z : z // ignore: cast_nullable_to_non_nullable
as double,w: null == w ? _self.w : w // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _GameRotationVectorData implements GameRotationVectorData {
  const _GameRotationVectorData({required this.x, required this.y, required this.z, required this.w, required this.timestamp, this.tenantId});
  factory _GameRotationVectorData.fromJson(Map<String, dynamic> json) => _$GameRotationVectorDataFromJson(json);

@override final  double x;
@override final  double y;
@override final  double z;
@override final  double w;
@override final  DateTime timestamp;
@override final  String? tenantId;

/// Create a copy of GameRotationVectorData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameRotationVectorDataCopyWith<_GameRotationVectorData> get copyWith => __$GameRotationVectorDataCopyWithImpl<_GameRotationVectorData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GameRotationVectorDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameRotationVectorData&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.z, z) || other.z == z)&&(identical(other.w, w) || other.w == w)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,x,y,z,w,timestamp,tenantId);

@override
String toString() {
  return 'GameRotationVectorData(x: $x, y: $y, z: $z, w: $w, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class _$GameRotationVectorDataCopyWith<$Res> implements $GameRotationVectorDataCopyWith<$Res> {
  factory _$GameRotationVectorDataCopyWith(_GameRotationVectorData value, $Res Function(_GameRotationVectorData) _then) = __$GameRotationVectorDataCopyWithImpl;
@override @useResult
$Res call({
 double x, double y, double z, double w, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class __$GameRotationVectorDataCopyWithImpl<$Res>
    implements _$GameRotationVectorDataCopyWith<$Res> {
  __$GameRotationVectorDataCopyWithImpl(this._self, this._then);

  final _GameRotationVectorData _self;
  final $Res Function(_GameRotationVectorData) _then;

/// Create a copy of GameRotationVectorData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? x = null,Object? y = null,Object? z = null,Object? w = null,Object? timestamp = null,Object? tenantId = freezed,}) {
  return _then(_GameRotationVectorData(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,z: null == z ? _self.z : z // ignore: cast_nullable_to_non_nullable
as double,w: null == w ? _self.w : w // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$GeomagneticRotationVectorData {

 double get x; double get y; double get z; double get w; DateTime get timestamp; String? get tenantId;
/// Create a copy of GeomagneticRotationVectorData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeomagneticRotationVectorDataCopyWith<GeomagneticRotationVectorData> get copyWith => _$GeomagneticRotationVectorDataCopyWithImpl<GeomagneticRotationVectorData>(this as GeomagneticRotationVectorData, _$identity);

  /// Serializes this GeomagneticRotationVectorData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeomagneticRotationVectorData&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.z, z) || other.z == z)&&(identical(other.w, w) || other.w == w)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,x,y,z,w,timestamp,tenantId);

@override
String toString() {
  return 'GeomagneticRotationVectorData(x: $x, y: $y, z: $z, w: $w, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class $GeomagneticRotationVectorDataCopyWith<$Res>  {
  factory $GeomagneticRotationVectorDataCopyWith(GeomagneticRotationVectorData value, $Res Function(GeomagneticRotationVectorData) _then) = _$GeomagneticRotationVectorDataCopyWithImpl;
@useResult
$Res call({
 double x, double y, double z, double w, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class _$GeomagneticRotationVectorDataCopyWithImpl<$Res>
    implements $GeomagneticRotationVectorDataCopyWith<$Res> {
  _$GeomagneticRotationVectorDataCopyWithImpl(this._self, this._then);

  final GeomagneticRotationVectorData _self;
  final $Res Function(GeomagneticRotationVectorData) _then;

/// Create a copy of GeomagneticRotationVectorData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? x = null,Object? y = null,Object? z = null,Object? w = null,Object? timestamp = null,Object? tenantId = freezed,}) {
  return _then(_self.copyWith(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,z: null == z ? _self.z : z // ignore: cast_nullable_to_non_nullable
as double,w: null == w ? _self.w : w // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _GeomagneticRotationVectorData implements GeomagneticRotationVectorData {
  const _GeomagneticRotationVectorData({required this.x, required this.y, required this.z, required this.w, required this.timestamp, this.tenantId});
  factory _GeomagneticRotationVectorData.fromJson(Map<String, dynamic> json) => _$GeomagneticRotationVectorDataFromJson(json);

@override final  double x;
@override final  double y;
@override final  double z;
@override final  double w;
@override final  DateTime timestamp;
@override final  String? tenantId;

/// Create a copy of GeomagneticRotationVectorData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeomagneticRotationVectorDataCopyWith<_GeomagneticRotationVectorData> get copyWith => __$GeomagneticRotationVectorDataCopyWithImpl<_GeomagneticRotationVectorData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GeomagneticRotationVectorDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeomagneticRotationVectorData&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.z, z) || other.z == z)&&(identical(other.w, w) || other.w == w)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,x,y,z,w,timestamp,tenantId);

@override
String toString() {
  return 'GeomagneticRotationVectorData(x: $x, y: $y, z: $z, w: $w, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class _$GeomagneticRotationVectorDataCopyWith<$Res> implements $GeomagneticRotationVectorDataCopyWith<$Res> {
  factory _$GeomagneticRotationVectorDataCopyWith(_GeomagneticRotationVectorData value, $Res Function(_GeomagneticRotationVectorData) _then) = __$GeomagneticRotationVectorDataCopyWithImpl;
@override @useResult
$Res call({
 double x, double y, double z, double w, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class __$GeomagneticRotationVectorDataCopyWithImpl<$Res>
    implements _$GeomagneticRotationVectorDataCopyWith<$Res> {
  __$GeomagneticRotationVectorDataCopyWithImpl(this._self, this._then);

  final _GeomagneticRotationVectorData _self;
  final $Res Function(_GeomagneticRotationVectorData) _then;

/// Create a copy of GeomagneticRotationVectorData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? x = null,Object? y = null,Object? z = null,Object? w = null,Object? timestamp = null,Object? tenantId = freezed,}) {
  return _then(_GeomagneticRotationVectorData(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,z: null == z ? _self.z : z // ignore: cast_nullable_to_non_nullable
as double,w: null == w ? _self.w : w // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$EnhancedSensorData {

// Basic sensors
 DateTime get timestamp; String? get tenantId;// Motion sensors
 AccelerometerData? get accelerometer; GyroscopeData? get gyroscope; MagnetometerData? get magnetometer;// Environmental sensors
 ProximityData? get proximity; LightSensorData? get light; PressureData? get pressure;// Activity sensors
 StepCounterData? get stepCounter; StepDetectorData? get stepDetector;// Position sensors
 RotationVectorData? get rotationVector; OrientationData? get orientation; GravityData? get gravity; LinearAccelerationData? get linearAcceleration; DeviceOrientationData? get deviceOrientation; GameRotationVectorData? get gameRotationVector; GeomagneticRotationVectorData? get geomagneticRotationVector;
/// Create a copy of EnhancedSensorData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EnhancedSensorDataCopyWith<EnhancedSensorData> get copyWith => _$EnhancedSensorDataCopyWithImpl<EnhancedSensorData>(this as EnhancedSensorData, _$identity);

  /// Serializes this EnhancedSensorData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EnhancedSensorData&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.accelerometer, accelerometer) || other.accelerometer == accelerometer)&&(identical(other.gyroscope, gyroscope) || other.gyroscope == gyroscope)&&(identical(other.magnetometer, magnetometer) || other.magnetometer == magnetometer)&&(identical(other.proximity, proximity) || other.proximity == proximity)&&(identical(other.light, light) || other.light == light)&&(identical(other.pressure, pressure) || other.pressure == pressure)&&(identical(other.stepCounter, stepCounter) || other.stepCounter == stepCounter)&&(identical(other.stepDetector, stepDetector) || other.stepDetector == stepDetector)&&(identical(other.rotationVector, rotationVector) || other.rotationVector == rotationVector)&&(identical(other.orientation, orientation) || other.orientation == orientation)&&(identical(other.gravity, gravity) || other.gravity == gravity)&&(identical(other.linearAcceleration, linearAcceleration) || other.linearAcceleration == linearAcceleration)&&(identical(other.deviceOrientation, deviceOrientation) || other.deviceOrientation == deviceOrientation)&&(identical(other.gameRotationVector, gameRotationVector) || other.gameRotationVector == gameRotationVector)&&(identical(other.geomagneticRotationVector, geomagneticRotationVector) || other.geomagneticRotationVector == geomagneticRotationVector));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timestamp,tenantId,accelerometer,gyroscope,magnetometer,proximity,light,pressure,stepCounter,stepDetector,rotationVector,orientation,gravity,linearAcceleration,deviceOrientation,gameRotationVector,geomagneticRotationVector);

@override
String toString() {
  return 'EnhancedSensorData(timestamp: $timestamp, tenantId: $tenantId, accelerometer: $accelerometer, gyroscope: $gyroscope, magnetometer: $magnetometer, proximity: $proximity, light: $light, pressure: $pressure, stepCounter: $stepCounter, stepDetector: $stepDetector, rotationVector: $rotationVector, orientation: $orientation, gravity: $gravity, linearAcceleration: $linearAcceleration, deviceOrientation: $deviceOrientation, gameRotationVector: $gameRotationVector, geomagneticRotationVector: $geomagneticRotationVector)';
}


}

/// @nodoc
abstract mixin class $EnhancedSensorDataCopyWith<$Res>  {
  factory $EnhancedSensorDataCopyWith(EnhancedSensorData value, $Res Function(EnhancedSensorData) _then) = _$EnhancedSensorDataCopyWithImpl;
@useResult
$Res call({
 DateTime timestamp, String? tenantId, AccelerometerData? accelerometer, GyroscopeData? gyroscope, MagnetometerData? magnetometer, ProximityData? proximity, LightSensorData? light, PressureData? pressure, StepCounterData? stepCounter, StepDetectorData? stepDetector, RotationVectorData? rotationVector, OrientationData? orientation, GravityData? gravity, LinearAccelerationData? linearAcceleration, DeviceOrientationData? deviceOrientation, GameRotationVectorData? gameRotationVector, GeomagneticRotationVectorData? geomagneticRotationVector
});


$AccelerometerDataCopyWith<$Res>? get accelerometer;$GyroscopeDataCopyWith<$Res>? get gyroscope;$MagnetometerDataCopyWith<$Res>? get magnetometer;$ProximityDataCopyWith<$Res>? get proximity;$LightSensorDataCopyWith<$Res>? get light;$PressureDataCopyWith<$Res>? get pressure;$StepCounterDataCopyWith<$Res>? get stepCounter;$StepDetectorDataCopyWith<$Res>? get stepDetector;$RotationVectorDataCopyWith<$Res>? get rotationVector;$OrientationDataCopyWith<$Res>? get orientation;$GravityDataCopyWith<$Res>? get gravity;$LinearAccelerationDataCopyWith<$Res>? get linearAcceleration;$DeviceOrientationDataCopyWith<$Res>? get deviceOrientation;$GameRotationVectorDataCopyWith<$Res>? get gameRotationVector;$GeomagneticRotationVectorDataCopyWith<$Res>? get geomagneticRotationVector;

}
/// @nodoc
class _$EnhancedSensorDataCopyWithImpl<$Res>
    implements $EnhancedSensorDataCopyWith<$Res> {
  _$EnhancedSensorDataCopyWithImpl(this._self, this._then);

  final EnhancedSensorData _self;
  final $Res Function(EnhancedSensorData) _then;

/// Create a copy of EnhancedSensorData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timestamp = null,Object? tenantId = freezed,Object? accelerometer = freezed,Object? gyroscope = freezed,Object? magnetometer = freezed,Object? proximity = freezed,Object? light = freezed,Object? pressure = freezed,Object? stepCounter = freezed,Object? stepDetector = freezed,Object? rotationVector = freezed,Object? orientation = freezed,Object? gravity = freezed,Object? linearAcceleration = freezed,Object? deviceOrientation = freezed,Object? gameRotationVector = freezed,Object? geomagneticRotationVector = freezed,}) {
  return _then(_self.copyWith(
timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,accelerometer: freezed == accelerometer ? _self.accelerometer : accelerometer // ignore: cast_nullable_to_non_nullable
as AccelerometerData?,gyroscope: freezed == gyroscope ? _self.gyroscope : gyroscope // ignore: cast_nullable_to_non_nullable
as GyroscopeData?,magnetometer: freezed == magnetometer ? _self.magnetometer : magnetometer // ignore: cast_nullable_to_non_nullable
as MagnetometerData?,proximity: freezed == proximity ? _self.proximity : proximity // ignore: cast_nullable_to_non_nullable
as ProximityData?,light: freezed == light ? _self.light : light // ignore: cast_nullable_to_non_nullable
as LightSensorData?,pressure: freezed == pressure ? _self.pressure : pressure // ignore: cast_nullable_to_non_nullable
as PressureData?,stepCounter: freezed == stepCounter ? _self.stepCounter : stepCounter // ignore: cast_nullable_to_non_nullable
as StepCounterData?,stepDetector: freezed == stepDetector ? _self.stepDetector : stepDetector // ignore: cast_nullable_to_non_nullable
as StepDetectorData?,rotationVector: freezed == rotationVector ? _self.rotationVector : rotationVector // ignore: cast_nullable_to_non_nullable
as RotationVectorData?,orientation: freezed == orientation ? _self.orientation : orientation // ignore: cast_nullable_to_non_nullable
as OrientationData?,gravity: freezed == gravity ? _self.gravity : gravity // ignore: cast_nullable_to_non_nullable
as GravityData?,linearAcceleration: freezed == linearAcceleration ? _self.linearAcceleration : linearAcceleration // ignore: cast_nullable_to_non_nullable
as LinearAccelerationData?,deviceOrientation: freezed == deviceOrientation ? _self.deviceOrientation : deviceOrientation // ignore: cast_nullable_to_non_nullable
as DeviceOrientationData?,gameRotationVector: freezed == gameRotationVector ? _self.gameRotationVector : gameRotationVector // ignore: cast_nullable_to_non_nullable
as GameRotationVectorData?,geomagneticRotationVector: freezed == geomagneticRotationVector ? _self.geomagneticRotationVector : geomagneticRotationVector // ignore: cast_nullable_to_non_nullable
as GeomagneticRotationVectorData?,
  ));
}
/// Create a copy of EnhancedSensorData
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
}/// Create a copy of EnhancedSensorData
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
}/// Create a copy of EnhancedSensorData
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
}/// Create a copy of EnhancedSensorData
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
}/// Create a copy of EnhancedSensorData
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
}/// Create a copy of EnhancedSensorData
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
}/// Create a copy of EnhancedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StepCounterDataCopyWith<$Res>? get stepCounter {
    if (_self.stepCounter == null) {
    return null;
  }

  return $StepCounterDataCopyWith<$Res>(_self.stepCounter!, (value) {
    return _then(_self.copyWith(stepCounter: value));
  });
}/// Create a copy of EnhancedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StepDetectorDataCopyWith<$Res>? get stepDetector {
    if (_self.stepDetector == null) {
    return null;
  }

  return $StepDetectorDataCopyWith<$Res>(_self.stepDetector!, (value) {
    return _then(_self.copyWith(stepDetector: value));
  });
}/// Create a copy of EnhancedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RotationVectorDataCopyWith<$Res>? get rotationVector {
    if (_self.rotationVector == null) {
    return null;
  }

  return $RotationVectorDataCopyWith<$Res>(_self.rotationVector!, (value) {
    return _then(_self.copyWith(rotationVector: value));
  });
}/// Create a copy of EnhancedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrientationDataCopyWith<$Res>? get orientation {
    if (_self.orientation == null) {
    return null;
  }

  return $OrientationDataCopyWith<$Res>(_self.orientation!, (value) {
    return _then(_self.copyWith(orientation: value));
  });
}/// Create a copy of EnhancedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GravityDataCopyWith<$Res>? get gravity {
    if (_self.gravity == null) {
    return null;
  }

  return $GravityDataCopyWith<$Res>(_self.gravity!, (value) {
    return _then(_self.copyWith(gravity: value));
  });
}/// Create a copy of EnhancedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LinearAccelerationDataCopyWith<$Res>? get linearAcceleration {
    if (_self.linearAcceleration == null) {
    return null;
  }

  return $LinearAccelerationDataCopyWith<$Res>(_self.linearAcceleration!, (value) {
    return _then(_self.copyWith(linearAcceleration: value));
  });
}/// Create a copy of EnhancedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeviceOrientationDataCopyWith<$Res>? get deviceOrientation {
    if (_self.deviceOrientation == null) {
    return null;
  }

  return $DeviceOrientationDataCopyWith<$Res>(_self.deviceOrientation!, (value) {
    return _then(_self.copyWith(deviceOrientation: value));
  });
}/// Create a copy of EnhancedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GameRotationVectorDataCopyWith<$Res>? get gameRotationVector {
    if (_self.gameRotationVector == null) {
    return null;
  }

  return $GameRotationVectorDataCopyWith<$Res>(_self.gameRotationVector!, (value) {
    return _then(_self.copyWith(gameRotationVector: value));
  });
}/// Create a copy of EnhancedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeomagneticRotationVectorDataCopyWith<$Res>? get geomagneticRotationVector {
    if (_self.geomagneticRotationVector == null) {
    return null;
  }

  return $GeomagneticRotationVectorDataCopyWith<$Res>(_self.geomagneticRotationVector!, (value) {
    return _then(_self.copyWith(geomagneticRotationVector: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _EnhancedSensorData implements EnhancedSensorData {
  const _EnhancedSensorData({required this.timestamp, this.tenantId, this.accelerometer, this.gyroscope, this.magnetometer, this.proximity, this.light, this.pressure, this.stepCounter, this.stepDetector, this.rotationVector, this.orientation, this.gravity, this.linearAcceleration, this.deviceOrientation, this.gameRotationVector, this.geomagneticRotationVector});
  factory _EnhancedSensorData.fromJson(Map<String, dynamic> json) => _$EnhancedSensorDataFromJson(json);

// Basic sensors
@override final  DateTime timestamp;
@override final  String? tenantId;
// Motion sensors
@override final  AccelerometerData? accelerometer;
@override final  GyroscopeData? gyroscope;
@override final  MagnetometerData? magnetometer;
// Environmental sensors
@override final  ProximityData? proximity;
@override final  LightSensorData? light;
@override final  PressureData? pressure;
// Activity sensors
@override final  StepCounterData? stepCounter;
@override final  StepDetectorData? stepDetector;
// Position sensors
@override final  RotationVectorData? rotationVector;
@override final  OrientationData? orientation;
@override final  GravityData? gravity;
@override final  LinearAccelerationData? linearAcceleration;
@override final  DeviceOrientationData? deviceOrientation;
@override final  GameRotationVectorData? gameRotationVector;
@override final  GeomagneticRotationVectorData? geomagneticRotationVector;

/// Create a copy of EnhancedSensorData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EnhancedSensorDataCopyWith<_EnhancedSensorData> get copyWith => __$EnhancedSensorDataCopyWithImpl<_EnhancedSensorData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EnhancedSensorDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EnhancedSensorData&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.accelerometer, accelerometer) || other.accelerometer == accelerometer)&&(identical(other.gyroscope, gyroscope) || other.gyroscope == gyroscope)&&(identical(other.magnetometer, magnetometer) || other.magnetometer == magnetometer)&&(identical(other.proximity, proximity) || other.proximity == proximity)&&(identical(other.light, light) || other.light == light)&&(identical(other.pressure, pressure) || other.pressure == pressure)&&(identical(other.stepCounter, stepCounter) || other.stepCounter == stepCounter)&&(identical(other.stepDetector, stepDetector) || other.stepDetector == stepDetector)&&(identical(other.rotationVector, rotationVector) || other.rotationVector == rotationVector)&&(identical(other.orientation, orientation) || other.orientation == orientation)&&(identical(other.gravity, gravity) || other.gravity == gravity)&&(identical(other.linearAcceleration, linearAcceleration) || other.linearAcceleration == linearAcceleration)&&(identical(other.deviceOrientation, deviceOrientation) || other.deviceOrientation == deviceOrientation)&&(identical(other.gameRotationVector, gameRotationVector) || other.gameRotationVector == gameRotationVector)&&(identical(other.geomagneticRotationVector, geomagneticRotationVector) || other.geomagneticRotationVector == geomagneticRotationVector));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timestamp,tenantId,accelerometer,gyroscope,magnetometer,proximity,light,pressure,stepCounter,stepDetector,rotationVector,orientation,gravity,linearAcceleration,deviceOrientation,gameRotationVector,geomagneticRotationVector);

@override
String toString() {
  return 'EnhancedSensorData(timestamp: $timestamp, tenantId: $tenantId, accelerometer: $accelerometer, gyroscope: $gyroscope, magnetometer: $magnetometer, proximity: $proximity, light: $light, pressure: $pressure, stepCounter: $stepCounter, stepDetector: $stepDetector, rotationVector: $rotationVector, orientation: $orientation, gravity: $gravity, linearAcceleration: $linearAcceleration, deviceOrientation: $deviceOrientation, gameRotationVector: $gameRotationVector, geomagneticRotationVector: $geomagneticRotationVector)';
}


}

/// @nodoc
abstract mixin class _$EnhancedSensorDataCopyWith<$Res> implements $EnhancedSensorDataCopyWith<$Res> {
  factory _$EnhancedSensorDataCopyWith(_EnhancedSensorData value, $Res Function(_EnhancedSensorData) _then) = __$EnhancedSensorDataCopyWithImpl;
@override @useResult
$Res call({
 DateTime timestamp, String? tenantId, AccelerometerData? accelerometer, GyroscopeData? gyroscope, MagnetometerData? magnetometer, ProximityData? proximity, LightSensorData? light, PressureData? pressure, StepCounterData? stepCounter, StepDetectorData? stepDetector, RotationVectorData? rotationVector, OrientationData? orientation, GravityData? gravity, LinearAccelerationData? linearAcceleration, DeviceOrientationData? deviceOrientation, GameRotationVectorData? gameRotationVector, GeomagneticRotationVectorData? geomagneticRotationVector
});


@override $AccelerometerDataCopyWith<$Res>? get accelerometer;@override $GyroscopeDataCopyWith<$Res>? get gyroscope;@override $MagnetometerDataCopyWith<$Res>? get magnetometer;@override $ProximityDataCopyWith<$Res>? get proximity;@override $LightSensorDataCopyWith<$Res>? get light;@override $PressureDataCopyWith<$Res>? get pressure;@override $StepCounterDataCopyWith<$Res>? get stepCounter;@override $StepDetectorDataCopyWith<$Res>? get stepDetector;@override $RotationVectorDataCopyWith<$Res>? get rotationVector;@override $OrientationDataCopyWith<$Res>? get orientation;@override $GravityDataCopyWith<$Res>? get gravity;@override $LinearAccelerationDataCopyWith<$Res>? get linearAcceleration;@override $DeviceOrientationDataCopyWith<$Res>? get deviceOrientation;@override $GameRotationVectorDataCopyWith<$Res>? get gameRotationVector;@override $GeomagneticRotationVectorDataCopyWith<$Res>? get geomagneticRotationVector;

}
/// @nodoc
class __$EnhancedSensorDataCopyWithImpl<$Res>
    implements _$EnhancedSensorDataCopyWith<$Res> {
  __$EnhancedSensorDataCopyWithImpl(this._self, this._then);

  final _EnhancedSensorData _self;
  final $Res Function(_EnhancedSensorData) _then;

/// Create a copy of EnhancedSensorData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timestamp = null,Object? tenantId = freezed,Object? accelerometer = freezed,Object? gyroscope = freezed,Object? magnetometer = freezed,Object? proximity = freezed,Object? light = freezed,Object? pressure = freezed,Object? stepCounter = freezed,Object? stepDetector = freezed,Object? rotationVector = freezed,Object? orientation = freezed,Object? gravity = freezed,Object? linearAcceleration = freezed,Object? deviceOrientation = freezed,Object? gameRotationVector = freezed,Object? geomagneticRotationVector = freezed,}) {
  return _then(_EnhancedSensorData(
timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,accelerometer: freezed == accelerometer ? _self.accelerometer : accelerometer // ignore: cast_nullable_to_non_nullable
as AccelerometerData?,gyroscope: freezed == gyroscope ? _self.gyroscope : gyroscope // ignore: cast_nullable_to_non_nullable
as GyroscopeData?,magnetometer: freezed == magnetometer ? _self.magnetometer : magnetometer // ignore: cast_nullable_to_non_nullable
as MagnetometerData?,proximity: freezed == proximity ? _self.proximity : proximity // ignore: cast_nullable_to_non_nullable
as ProximityData?,light: freezed == light ? _self.light : light // ignore: cast_nullable_to_non_nullable
as LightSensorData?,pressure: freezed == pressure ? _self.pressure : pressure // ignore: cast_nullable_to_non_nullable
as PressureData?,stepCounter: freezed == stepCounter ? _self.stepCounter : stepCounter // ignore: cast_nullable_to_non_nullable
as StepCounterData?,stepDetector: freezed == stepDetector ? _self.stepDetector : stepDetector // ignore: cast_nullable_to_non_nullable
as StepDetectorData?,rotationVector: freezed == rotationVector ? _self.rotationVector : rotationVector // ignore: cast_nullable_to_non_nullable
as RotationVectorData?,orientation: freezed == orientation ? _self.orientation : orientation // ignore: cast_nullable_to_non_nullable
as OrientationData?,gravity: freezed == gravity ? _self.gravity : gravity // ignore: cast_nullable_to_non_nullable
as GravityData?,linearAcceleration: freezed == linearAcceleration ? _self.linearAcceleration : linearAcceleration // ignore: cast_nullable_to_non_nullable
as LinearAccelerationData?,deviceOrientation: freezed == deviceOrientation ? _self.deviceOrientation : deviceOrientation // ignore: cast_nullable_to_non_nullable
as DeviceOrientationData?,gameRotationVector: freezed == gameRotationVector ? _self.gameRotationVector : gameRotationVector // ignore: cast_nullable_to_non_nullable
as GameRotationVectorData?,geomagneticRotationVector: freezed == geomagneticRotationVector ? _self.geomagneticRotationVector : geomagneticRotationVector // ignore: cast_nullable_to_non_nullable
as GeomagneticRotationVectorData?,
  ));
}

/// Create a copy of EnhancedSensorData
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
}/// Create a copy of EnhancedSensorData
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
}/// Create a copy of EnhancedSensorData
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
}/// Create a copy of EnhancedSensorData
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
}/// Create a copy of EnhancedSensorData
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
}/// Create a copy of EnhancedSensorData
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
}/// Create a copy of EnhancedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StepCounterDataCopyWith<$Res>? get stepCounter {
    if (_self.stepCounter == null) {
    return null;
  }

  return $StepCounterDataCopyWith<$Res>(_self.stepCounter!, (value) {
    return _then(_self.copyWith(stepCounter: value));
  });
}/// Create a copy of EnhancedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StepDetectorDataCopyWith<$Res>? get stepDetector {
    if (_self.stepDetector == null) {
    return null;
  }

  return $StepDetectorDataCopyWith<$Res>(_self.stepDetector!, (value) {
    return _then(_self.copyWith(stepDetector: value));
  });
}/// Create a copy of EnhancedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RotationVectorDataCopyWith<$Res>? get rotationVector {
    if (_self.rotationVector == null) {
    return null;
  }

  return $RotationVectorDataCopyWith<$Res>(_self.rotationVector!, (value) {
    return _then(_self.copyWith(rotationVector: value));
  });
}/// Create a copy of EnhancedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrientationDataCopyWith<$Res>? get orientation {
    if (_self.orientation == null) {
    return null;
  }

  return $OrientationDataCopyWith<$Res>(_self.orientation!, (value) {
    return _then(_self.copyWith(orientation: value));
  });
}/// Create a copy of EnhancedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GravityDataCopyWith<$Res>? get gravity {
    if (_self.gravity == null) {
    return null;
  }

  return $GravityDataCopyWith<$Res>(_self.gravity!, (value) {
    return _then(_self.copyWith(gravity: value));
  });
}/// Create a copy of EnhancedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LinearAccelerationDataCopyWith<$Res>? get linearAcceleration {
    if (_self.linearAcceleration == null) {
    return null;
  }

  return $LinearAccelerationDataCopyWith<$Res>(_self.linearAcceleration!, (value) {
    return _then(_self.copyWith(linearAcceleration: value));
  });
}/// Create a copy of EnhancedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeviceOrientationDataCopyWith<$Res>? get deviceOrientation {
    if (_self.deviceOrientation == null) {
    return null;
  }

  return $DeviceOrientationDataCopyWith<$Res>(_self.deviceOrientation!, (value) {
    return _then(_self.copyWith(deviceOrientation: value));
  });
}/// Create a copy of EnhancedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GameRotationVectorDataCopyWith<$Res>? get gameRotationVector {
    if (_self.gameRotationVector == null) {
    return null;
  }

  return $GameRotationVectorDataCopyWith<$Res>(_self.gameRotationVector!, (value) {
    return _then(_self.copyWith(gameRotationVector: value));
  });
}/// Create a copy of EnhancedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeomagneticRotationVectorDataCopyWith<$Res>? get geomagneticRotationVector {
    if (_self.geomagneticRotationVector == null) {
    return null;
  }

  return $GeomagneticRotationVectorDataCopyWith<$Res>(_self.geomagneticRotationVector!, (value) {
    return _then(_self.copyWith(geomagneticRotationVector: value));
  });
}
}

// dart format on
