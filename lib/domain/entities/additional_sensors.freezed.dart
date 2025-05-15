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
mixin _$SignificantMotionData {

 bool get detected; DateTime get timestamp; String? get tenantId;
/// Create a copy of SignificantMotionData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignificantMotionDataCopyWith<SignificantMotionData> get copyWith => _$SignificantMotionDataCopyWithImpl<SignificantMotionData>(this as SignificantMotionData, _$identity);

  /// Serializes this SignificantMotionData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignificantMotionData&&(identical(other.detected, detected) || other.detected == detected)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,detected,timestamp,tenantId);

@override
String toString() {
  return 'SignificantMotionData(detected: $detected, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class $SignificantMotionDataCopyWith<$Res>  {
  factory $SignificantMotionDataCopyWith(SignificantMotionData value, $Res Function(SignificantMotionData) _then) = _$SignificantMotionDataCopyWithImpl;
@useResult
$Res call({
 bool detected, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class _$SignificantMotionDataCopyWithImpl<$Res>
    implements $SignificantMotionDataCopyWith<$Res> {
  _$SignificantMotionDataCopyWithImpl(this._self, this._then);

  final SignificantMotionData _self;
  final $Res Function(SignificantMotionData) _then;

/// Create a copy of SignificantMotionData
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

class _SignificantMotionData implements SignificantMotionData {
  const _SignificantMotionData({required this.detected, required this.timestamp, this.tenantId});
  factory _SignificantMotionData.fromJson(Map<String, dynamic> json) => _$SignificantMotionDataFromJson(json);

@override final  bool detected;
@override final  DateTime timestamp;
@override final  String? tenantId;

/// Create a copy of SignificantMotionData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignificantMotionDataCopyWith<_SignificantMotionData> get copyWith => __$SignificantMotionDataCopyWithImpl<_SignificantMotionData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SignificantMotionDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignificantMotionData&&(identical(other.detected, detected) || other.detected == detected)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,detected,timestamp,tenantId);

@override
String toString() {
  return 'SignificantMotionData(detected: $detected, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class _$SignificantMotionDataCopyWith<$Res> implements $SignificantMotionDataCopyWith<$Res> {
  factory _$SignificantMotionDataCopyWith(_SignificantMotionData value, $Res Function(_SignificantMotionData) _then) = __$SignificantMotionDataCopyWithImpl;
@override @useResult
$Res call({
 bool detected, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class __$SignificantMotionDataCopyWithImpl<$Res>
    implements _$SignificantMotionDataCopyWith<$Res> {
  __$SignificantMotionDataCopyWithImpl(this._self, this._then);

  final _SignificantMotionData _self;
  final $Res Function(_SignificantMotionData) _then;

/// Create a copy of SignificantMotionData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? detected = null,Object? timestamp = null,Object? tenantId = freezed,}) {
  return _then(_SignificantMotionData(
detected: null == detected ? _self.detected : detected // ignore: cast_nullable_to_non_nullable
as bool,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$StationaryDetectData {

 bool get isStationary; DateTime get timestamp; String? get tenantId;
/// Create a copy of StationaryDetectData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StationaryDetectDataCopyWith<StationaryDetectData> get copyWith => _$StationaryDetectDataCopyWithImpl<StationaryDetectData>(this as StationaryDetectData, _$identity);

  /// Serializes this StationaryDetectData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StationaryDetectData&&(identical(other.isStationary, isStationary) || other.isStationary == isStationary)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isStationary,timestamp,tenantId);

@override
String toString() {
  return 'StationaryDetectData(isStationary: $isStationary, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class $StationaryDetectDataCopyWith<$Res>  {
  factory $StationaryDetectDataCopyWith(StationaryDetectData value, $Res Function(StationaryDetectData) _then) = _$StationaryDetectDataCopyWithImpl;
@useResult
$Res call({
 bool isStationary, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class _$StationaryDetectDataCopyWithImpl<$Res>
    implements $StationaryDetectDataCopyWith<$Res> {
  _$StationaryDetectDataCopyWithImpl(this._self, this._then);

  final StationaryDetectData _self;
  final $Res Function(StationaryDetectData) _then;

/// Create a copy of StationaryDetectData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isStationary = null,Object? timestamp = null,Object? tenantId = freezed,}) {
  return _then(_self.copyWith(
isStationary: null == isStationary ? _self.isStationary : isStationary // ignore: cast_nullable_to_non_nullable
as bool,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _StationaryDetectData implements StationaryDetectData {
  const _StationaryDetectData({required this.isStationary, required this.timestamp, this.tenantId});
  factory _StationaryDetectData.fromJson(Map<String, dynamic> json) => _$StationaryDetectDataFromJson(json);

@override final  bool isStationary;
@override final  DateTime timestamp;
@override final  String? tenantId;

/// Create a copy of StationaryDetectData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StationaryDetectDataCopyWith<_StationaryDetectData> get copyWith => __$StationaryDetectDataCopyWithImpl<_StationaryDetectData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StationaryDetectDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StationaryDetectData&&(identical(other.isStationary, isStationary) || other.isStationary == isStationary)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isStationary,timestamp,tenantId);

@override
String toString() {
  return 'StationaryDetectData(isStationary: $isStationary, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class _$StationaryDetectDataCopyWith<$Res> implements $StationaryDetectDataCopyWith<$Res> {
  factory _$StationaryDetectDataCopyWith(_StationaryDetectData value, $Res Function(_StationaryDetectData) _then) = __$StationaryDetectDataCopyWithImpl;
@override @useResult
$Res call({
 bool isStationary, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class __$StationaryDetectDataCopyWithImpl<$Res>
    implements _$StationaryDetectDataCopyWith<$Res> {
  __$StationaryDetectDataCopyWithImpl(this._self, this._then);

  final _StationaryDetectData _self;
  final $Res Function(_StationaryDetectData) _then;

/// Create a copy of StationaryDetectData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isStationary = null,Object? timestamp = null,Object? tenantId = freezed,}) {
  return _then(_StationaryDetectData(
isStationary: null == isStationary ? _self.isStationary : isStationary // ignore: cast_nullable_to_non_nullable
as bool,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$WakeGestureData {

 bool get detected; DateTime get timestamp; String? get tenantId;
/// Create a copy of WakeGestureData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WakeGestureDataCopyWith<WakeGestureData> get copyWith => _$WakeGestureDataCopyWithImpl<WakeGestureData>(this as WakeGestureData, _$identity);

  /// Serializes this WakeGestureData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WakeGestureData&&(identical(other.detected, detected) || other.detected == detected)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,detected,timestamp,tenantId);

@override
String toString() {
  return 'WakeGestureData(detected: $detected, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class $WakeGestureDataCopyWith<$Res>  {
  factory $WakeGestureDataCopyWith(WakeGestureData value, $Res Function(WakeGestureData) _then) = _$WakeGestureDataCopyWithImpl;
@useResult
$Res call({
 bool detected, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class _$WakeGestureDataCopyWithImpl<$Res>
    implements $WakeGestureDataCopyWith<$Res> {
  _$WakeGestureDataCopyWithImpl(this._self, this._then);

  final WakeGestureData _self;
  final $Res Function(WakeGestureData) _then;

/// Create a copy of WakeGestureData
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

class _WakeGestureData implements WakeGestureData {
  const _WakeGestureData({required this.detected, required this.timestamp, this.tenantId});
  factory _WakeGestureData.fromJson(Map<String, dynamic> json) => _$WakeGestureDataFromJson(json);

@override final  bool detected;
@override final  DateTime timestamp;
@override final  String? tenantId;

/// Create a copy of WakeGestureData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WakeGestureDataCopyWith<_WakeGestureData> get copyWith => __$WakeGestureDataCopyWithImpl<_WakeGestureData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WakeGestureDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WakeGestureData&&(identical(other.detected, detected) || other.detected == detected)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,detected,timestamp,tenantId);

@override
String toString() {
  return 'WakeGestureData(detected: $detected, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class _$WakeGestureDataCopyWith<$Res> implements $WakeGestureDataCopyWith<$Res> {
  factory _$WakeGestureDataCopyWith(_WakeGestureData value, $Res Function(_WakeGestureData) _then) = __$WakeGestureDataCopyWithImpl;
@override @useResult
$Res call({
 bool detected, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class __$WakeGestureDataCopyWithImpl<$Res>
    implements _$WakeGestureDataCopyWith<$Res> {
  __$WakeGestureDataCopyWithImpl(this._self, this._then);

  final _WakeGestureData _self;
  final $Res Function(_WakeGestureData) _then;

/// Create a copy of WakeGestureData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? detected = null,Object? timestamp = null,Object? tenantId = freezed,}) {
  return _then(_WakeGestureData(
detected: null == detected ? _self.detected : detected // ignore: cast_nullable_to_non_nullable
as bool,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PickupDetectData {

 bool get detected; DateTime get timestamp; String? get tenantId;
/// Create a copy of PickupDetectData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PickupDetectDataCopyWith<PickupDetectData> get copyWith => _$PickupDetectDataCopyWithImpl<PickupDetectData>(this as PickupDetectData, _$identity);

  /// Serializes this PickupDetectData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PickupDetectData&&(identical(other.detected, detected) || other.detected == detected)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,detected,timestamp,tenantId);

@override
String toString() {
  return 'PickupDetectData(detected: $detected, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class $PickupDetectDataCopyWith<$Res>  {
  factory $PickupDetectDataCopyWith(PickupDetectData value, $Res Function(PickupDetectData) _then) = _$PickupDetectDataCopyWithImpl;
@useResult
$Res call({
 bool detected, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class _$PickupDetectDataCopyWithImpl<$Res>
    implements $PickupDetectDataCopyWith<$Res> {
  _$PickupDetectDataCopyWithImpl(this._self, this._then);

  final PickupDetectData _self;
  final $Res Function(PickupDetectData) _then;

/// Create a copy of PickupDetectData
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

class _PickupDetectData implements PickupDetectData {
  const _PickupDetectData({required this.detected, required this.timestamp, this.tenantId});
  factory _PickupDetectData.fromJson(Map<String, dynamic> json) => _$PickupDetectDataFromJson(json);

@override final  bool detected;
@override final  DateTime timestamp;
@override final  String? tenantId;

/// Create a copy of PickupDetectData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PickupDetectDataCopyWith<_PickupDetectData> get copyWith => __$PickupDetectDataCopyWithImpl<_PickupDetectData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PickupDetectDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PickupDetectData&&(identical(other.detected, detected) || other.detected == detected)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,detected,timestamp,tenantId);

@override
String toString() {
  return 'PickupDetectData(detected: $detected, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class _$PickupDetectDataCopyWith<$Res> implements $PickupDetectDataCopyWith<$Res> {
  factory _$PickupDetectDataCopyWith(_PickupDetectData value, $Res Function(_PickupDetectData) _then) = __$PickupDetectDataCopyWithImpl;
@override @useResult
$Res call({
 bool detected, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class __$PickupDetectDataCopyWithImpl<$Res>
    implements _$PickupDetectDataCopyWith<$Res> {
  __$PickupDetectDataCopyWithImpl(this._self, this._then);

  final _PickupDetectData _self;
  final $Res Function(_PickupDetectData) _then;

/// Create a copy of PickupDetectData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? detected = null,Object? timestamp = null,Object? tenantId = freezed,}) {
  return _then(_PickupDetectData(
detected: null == detected ? _self.detected : detected // ignore: cast_nullable_to_non_nullable
as bool,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AccelerometerUncalibratedData {

 double get x; double get y; double get z; double get xBias; double get yBias; double get zBias; DateTime get timestamp; String? get tenantId;
/// Create a copy of AccelerometerUncalibratedData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccelerometerUncalibratedDataCopyWith<AccelerometerUncalibratedData> get copyWith => _$AccelerometerUncalibratedDataCopyWithImpl<AccelerometerUncalibratedData>(this as AccelerometerUncalibratedData, _$identity);

  /// Serializes this AccelerometerUncalibratedData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccelerometerUncalibratedData&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.z, z) || other.z == z)&&(identical(other.xBias, xBias) || other.xBias == xBias)&&(identical(other.yBias, yBias) || other.yBias == yBias)&&(identical(other.zBias, zBias) || other.zBias == zBias)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,x,y,z,xBias,yBias,zBias,timestamp,tenantId);

@override
String toString() {
  return 'AccelerometerUncalibratedData(x: $x, y: $y, z: $z, xBias: $xBias, yBias: $yBias, zBias: $zBias, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class $AccelerometerUncalibratedDataCopyWith<$Res>  {
  factory $AccelerometerUncalibratedDataCopyWith(AccelerometerUncalibratedData value, $Res Function(AccelerometerUncalibratedData) _then) = _$AccelerometerUncalibratedDataCopyWithImpl;
@useResult
$Res call({
 double x, double y, double z, double xBias, double yBias, double zBias, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class _$AccelerometerUncalibratedDataCopyWithImpl<$Res>
    implements $AccelerometerUncalibratedDataCopyWith<$Res> {
  _$AccelerometerUncalibratedDataCopyWithImpl(this._self, this._then);

  final AccelerometerUncalibratedData _self;
  final $Res Function(AccelerometerUncalibratedData) _then;

/// Create a copy of AccelerometerUncalibratedData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? x = null,Object? y = null,Object? z = null,Object? xBias = null,Object? yBias = null,Object? zBias = null,Object? timestamp = null,Object? tenantId = freezed,}) {
  return _then(_self.copyWith(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,z: null == z ? _self.z : z // ignore: cast_nullable_to_non_nullable
as double,xBias: null == xBias ? _self.xBias : xBias // ignore: cast_nullable_to_non_nullable
as double,yBias: null == yBias ? _self.yBias : yBias // ignore: cast_nullable_to_non_nullable
as double,zBias: null == zBias ? _self.zBias : zBias // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AccelerometerUncalibratedData implements AccelerometerUncalibratedData {
  const _AccelerometerUncalibratedData({required this.x, required this.y, required this.z, required this.xBias, required this.yBias, required this.zBias, required this.timestamp, this.tenantId});
  factory _AccelerometerUncalibratedData.fromJson(Map<String, dynamic> json) => _$AccelerometerUncalibratedDataFromJson(json);

@override final  double x;
@override final  double y;
@override final  double z;
@override final  double xBias;
@override final  double yBias;
@override final  double zBias;
@override final  DateTime timestamp;
@override final  String? tenantId;

/// Create a copy of AccelerometerUncalibratedData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccelerometerUncalibratedDataCopyWith<_AccelerometerUncalibratedData> get copyWith => __$AccelerometerUncalibratedDataCopyWithImpl<_AccelerometerUncalibratedData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccelerometerUncalibratedDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccelerometerUncalibratedData&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.z, z) || other.z == z)&&(identical(other.xBias, xBias) || other.xBias == xBias)&&(identical(other.yBias, yBias) || other.yBias == yBias)&&(identical(other.zBias, zBias) || other.zBias == zBias)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,x,y,z,xBias,yBias,zBias,timestamp,tenantId);

@override
String toString() {
  return 'AccelerometerUncalibratedData(x: $x, y: $y, z: $z, xBias: $xBias, yBias: $yBias, zBias: $zBias, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class _$AccelerometerUncalibratedDataCopyWith<$Res> implements $AccelerometerUncalibratedDataCopyWith<$Res> {
  factory _$AccelerometerUncalibratedDataCopyWith(_AccelerometerUncalibratedData value, $Res Function(_AccelerometerUncalibratedData) _then) = __$AccelerometerUncalibratedDataCopyWithImpl;
@override @useResult
$Res call({
 double x, double y, double z, double xBias, double yBias, double zBias, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class __$AccelerometerUncalibratedDataCopyWithImpl<$Res>
    implements _$AccelerometerUncalibratedDataCopyWith<$Res> {
  __$AccelerometerUncalibratedDataCopyWithImpl(this._self, this._then);

  final _AccelerometerUncalibratedData _self;
  final $Res Function(_AccelerometerUncalibratedData) _then;

/// Create a copy of AccelerometerUncalibratedData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? x = null,Object? y = null,Object? z = null,Object? xBias = null,Object? yBias = null,Object? zBias = null,Object? timestamp = null,Object? tenantId = freezed,}) {
  return _then(_AccelerometerUncalibratedData(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,z: null == z ? _self.z : z // ignore: cast_nullable_to_non_nullable
as double,xBias: null == xBias ? _self.xBias : xBias // ignore: cast_nullable_to_non_nullable
as double,yBias: null == yBias ? _self.yBias : yBias // ignore: cast_nullable_to_non_nullable
as double,zBias: null == zBias ? _self.zBias : zBias // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$MagneticFieldUncalibratedData {

 double get x; double get y; double get z; double get xBias; double get yBias; double get zBias; DateTime get timestamp; String? get tenantId;
/// Create a copy of MagneticFieldUncalibratedData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MagneticFieldUncalibratedDataCopyWith<MagneticFieldUncalibratedData> get copyWith => _$MagneticFieldUncalibratedDataCopyWithImpl<MagneticFieldUncalibratedData>(this as MagneticFieldUncalibratedData, _$identity);

  /// Serializes this MagneticFieldUncalibratedData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MagneticFieldUncalibratedData&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.z, z) || other.z == z)&&(identical(other.xBias, xBias) || other.xBias == xBias)&&(identical(other.yBias, yBias) || other.yBias == yBias)&&(identical(other.zBias, zBias) || other.zBias == zBias)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,x,y,z,xBias,yBias,zBias,timestamp,tenantId);

@override
String toString() {
  return 'MagneticFieldUncalibratedData(x: $x, y: $y, z: $z, xBias: $xBias, yBias: $yBias, zBias: $zBias, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class $MagneticFieldUncalibratedDataCopyWith<$Res>  {
  factory $MagneticFieldUncalibratedDataCopyWith(MagneticFieldUncalibratedData value, $Res Function(MagneticFieldUncalibratedData) _then) = _$MagneticFieldUncalibratedDataCopyWithImpl;
@useResult
$Res call({
 double x, double y, double z, double xBias, double yBias, double zBias, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class _$MagneticFieldUncalibratedDataCopyWithImpl<$Res>
    implements $MagneticFieldUncalibratedDataCopyWith<$Res> {
  _$MagneticFieldUncalibratedDataCopyWithImpl(this._self, this._then);

  final MagneticFieldUncalibratedData _self;
  final $Res Function(MagneticFieldUncalibratedData) _then;

/// Create a copy of MagneticFieldUncalibratedData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? x = null,Object? y = null,Object? z = null,Object? xBias = null,Object? yBias = null,Object? zBias = null,Object? timestamp = null,Object? tenantId = freezed,}) {
  return _then(_self.copyWith(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,z: null == z ? _self.z : z // ignore: cast_nullable_to_non_nullable
as double,xBias: null == xBias ? _self.xBias : xBias // ignore: cast_nullable_to_non_nullable
as double,yBias: null == yBias ? _self.yBias : yBias // ignore: cast_nullable_to_non_nullable
as double,zBias: null == zBias ? _self.zBias : zBias // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MagneticFieldUncalibratedData implements MagneticFieldUncalibratedData {
  const _MagneticFieldUncalibratedData({required this.x, required this.y, required this.z, required this.xBias, required this.yBias, required this.zBias, required this.timestamp, this.tenantId});
  factory _MagneticFieldUncalibratedData.fromJson(Map<String, dynamic> json) => _$MagneticFieldUncalibratedDataFromJson(json);

@override final  double x;
@override final  double y;
@override final  double z;
@override final  double xBias;
@override final  double yBias;
@override final  double zBias;
@override final  DateTime timestamp;
@override final  String? tenantId;

/// Create a copy of MagneticFieldUncalibratedData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MagneticFieldUncalibratedDataCopyWith<_MagneticFieldUncalibratedData> get copyWith => __$MagneticFieldUncalibratedDataCopyWithImpl<_MagneticFieldUncalibratedData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MagneticFieldUncalibratedDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MagneticFieldUncalibratedData&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.z, z) || other.z == z)&&(identical(other.xBias, xBias) || other.xBias == xBias)&&(identical(other.yBias, yBias) || other.yBias == yBias)&&(identical(other.zBias, zBias) || other.zBias == zBias)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,x,y,z,xBias,yBias,zBias,timestamp,tenantId);

@override
String toString() {
  return 'MagneticFieldUncalibratedData(x: $x, y: $y, z: $z, xBias: $xBias, yBias: $yBias, zBias: $zBias, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class _$MagneticFieldUncalibratedDataCopyWith<$Res> implements $MagneticFieldUncalibratedDataCopyWith<$Res> {
  factory _$MagneticFieldUncalibratedDataCopyWith(_MagneticFieldUncalibratedData value, $Res Function(_MagneticFieldUncalibratedData) _then) = __$MagneticFieldUncalibratedDataCopyWithImpl;
@override @useResult
$Res call({
 double x, double y, double z, double xBias, double yBias, double zBias, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class __$MagneticFieldUncalibratedDataCopyWithImpl<$Res>
    implements _$MagneticFieldUncalibratedDataCopyWith<$Res> {
  __$MagneticFieldUncalibratedDataCopyWithImpl(this._self, this._then);

  final _MagneticFieldUncalibratedData _self;
  final $Res Function(_MagneticFieldUncalibratedData) _then;

/// Create a copy of MagneticFieldUncalibratedData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? x = null,Object? y = null,Object? z = null,Object? xBias = null,Object? yBias = null,Object? zBias = null,Object? timestamp = null,Object? tenantId = freezed,}) {
  return _then(_MagneticFieldUncalibratedData(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,z: null == z ? _self.z : z // ignore: cast_nullable_to_non_nullable
as double,xBias: null == xBias ? _self.xBias : xBias // ignore: cast_nullable_to_non_nullable
as double,yBias: null == yBias ? _self.yBias : yBias // ignore: cast_nullable_to_non_nullable
as double,zBias: null == zBias ? _self.zBias : zBias // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$GyroscopeUncalibratedData {

 double get x; double get y; double get z; double get xDrift; double get yDrift; double get zDrift; DateTime get timestamp; String? get tenantId;
/// Create a copy of GyroscopeUncalibratedData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GyroscopeUncalibratedDataCopyWith<GyroscopeUncalibratedData> get copyWith => _$GyroscopeUncalibratedDataCopyWithImpl<GyroscopeUncalibratedData>(this as GyroscopeUncalibratedData, _$identity);

  /// Serializes this GyroscopeUncalibratedData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GyroscopeUncalibratedData&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.z, z) || other.z == z)&&(identical(other.xDrift, xDrift) || other.xDrift == xDrift)&&(identical(other.yDrift, yDrift) || other.yDrift == yDrift)&&(identical(other.zDrift, zDrift) || other.zDrift == zDrift)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,x,y,z,xDrift,yDrift,zDrift,timestamp,tenantId);

@override
String toString() {
  return 'GyroscopeUncalibratedData(x: $x, y: $y, z: $z, xDrift: $xDrift, yDrift: $yDrift, zDrift: $zDrift, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class $GyroscopeUncalibratedDataCopyWith<$Res>  {
  factory $GyroscopeUncalibratedDataCopyWith(GyroscopeUncalibratedData value, $Res Function(GyroscopeUncalibratedData) _then) = _$GyroscopeUncalibratedDataCopyWithImpl;
@useResult
$Res call({
 double x, double y, double z, double xDrift, double yDrift, double zDrift, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class _$GyroscopeUncalibratedDataCopyWithImpl<$Res>
    implements $GyroscopeUncalibratedDataCopyWith<$Res> {
  _$GyroscopeUncalibratedDataCopyWithImpl(this._self, this._then);

  final GyroscopeUncalibratedData _self;
  final $Res Function(GyroscopeUncalibratedData) _then;

/// Create a copy of GyroscopeUncalibratedData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? x = null,Object? y = null,Object? z = null,Object? xDrift = null,Object? yDrift = null,Object? zDrift = null,Object? timestamp = null,Object? tenantId = freezed,}) {
  return _then(_self.copyWith(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,z: null == z ? _self.z : z // ignore: cast_nullable_to_non_nullable
as double,xDrift: null == xDrift ? _self.xDrift : xDrift // ignore: cast_nullable_to_non_nullable
as double,yDrift: null == yDrift ? _self.yDrift : yDrift // ignore: cast_nullable_to_non_nullable
as double,zDrift: null == zDrift ? _self.zDrift : zDrift // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _GyroscopeUncalibratedData implements GyroscopeUncalibratedData {
  const _GyroscopeUncalibratedData({required this.x, required this.y, required this.z, required this.xDrift, required this.yDrift, required this.zDrift, required this.timestamp, this.tenantId});
  factory _GyroscopeUncalibratedData.fromJson(Map<String, dynamic> json) => _$GyroscopeUncalibratedDataFromJson(json);

@override final  double x;
@override final  double y;
@override final  double z;
@override final  double xDrift;
@override final  double yDrift;
@override final  double zDrift;
@override final  DateTime timestamp;
@override final  String? tenantId;

/// Create a copy of GyroscopeUncalibratedData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GyroscopeUncalibratedDataCopyWith<_GyroscopeUncalibratedData> get copyWith => __$GyroscopeUncalibratedDataCopyWithImpl<_GyroscopeUncalibratedData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GyroscopeUncalibratedDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GyroscopeUncalibratedData&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y)&&(identical(other.z, z) || other.z == z)&&(identical(other.xDrift, xDrift) || other.xDrift == xDrift)&&(identical(other.yDrift, yDrift) || other.yDrift == yDrift)&&(identical(other.zDrift, zDrift) || other.zDrift == zDrift)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,x,y,z,xDrift,yDrift,zDrift,timestamp,tenantId);

@override
String toString() {
  return 'GyroscopeUncalibratedData(x: $x, y: $y, z: $z, xDrift: $xDrift, yDrift: $yDrift, zDrift: $zDrift, timestamp: $timestamp, tenantId: $tenantId)';
}


}

/// @nodoc
abstract mixin class _$GyroscopeUncalibratedDataCopyWith<$Res> implements $GyroscopeUncalibratedDataCopyWith<$Res> {
  factory _$GyroscopeUncalibratedDataCopyWith(_GyroscopeUncalibratedData value, $Res Function(_GyroscopeUncalibratedData) _then) = __$GyroscopeUncalibratedDataCopyWithImpl;
@override @useResult
$Res call({
 double x, double y, double z, double xDrift, double yDrift, double zDrift, DateTime timestamp, String? tenantId
});




}
/// @nodoc
class __$GyroscopeUncalibratedDataCopyWithImpl<$Res>
    implements _$GyroscopeUncalibratedDataCopyWith<$Res> {
  __$GyroscopeUncalibratedDataCopyWithImpl(this._self, this._then);

  final _GyroscopeUncalibratedData _self;
  final $Res Function(_GyroscopeUncalibratedData) _then;

/// Create a copy of GyroscopeUncalibratedData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? x = null,Object? y = null,Object? z = null,Object? xDrift = null,Object? yDrift = null,Object? zDrift = null,Object? timestamp = null,Object? tenantId = freezed,}) {
  return _then(_GyroscopeUncalibratedData(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,z: null == z ? _self.z : z // ignore: cast_nullable_to_non_nullable
as double,xDrift: null == xDrift ? _self.xDrift : xDrift // ignore: cast_nullable_to_non_nullable
as double,yDrift: null == yDrift ? _self.yDrift : yDrift // ignore: cast_nullable_to_non_nullable
as double,zDrift: null == zDrift ? _self.zDrift : zDrift // ignore: cast_nullable_to_non_nullable
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
 RotationVectorData? get rotationVector; OrientationData? get orientation; GravityData? get gravity; LinearAccelerationData? get linearAcceleration; DeviceOrientationData? get deviceOrientation; GameRotationVectorData? get gameRotationVector; GeomagneticRotationVectorData? get geomagneticRotationVector;// New sensors
 SignificantMotionData? get significantMotion; StationaryDetectData? get stationaryDetect; WakeGestureData? get wakeGesture; PickupDetectData? get pickupDetect; AccelerometerUncalibratedData? get accelerometerUncalibrated; MagneticFieldUncalibratedData? get magneticFieldUncalibrated; GyroscopeUncalibratedData? get gyroscopeUncalibrated;
/// Create a copy of EnhancedSensorData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EnhancedSensorDataCopyWith<EnhancedSensorData> get copyWith => _$EnhancedSensorDataCopyWithImpl<EnhancedSensorData>(this as EnhancedSensorData, _$identity);

  /// Serializes this EnhancedSensorData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EnhancedSensorData&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.accelerometer, accelerometer) || other.accelerometer == accelerometer)&&(identical(other.gyroscope, gyroscope) || other.gyroscope == gyroscope)&&(identical(other.magnetometer, magnetometer) || other.magnetometer == magnetometer)&&(identical(other.proximity, proximity) || other.proximity == proximity)&&(identical(other.light, light) || other.light == light)&&(identical(other.pressure, pressure) || other.pressure == pressure)&&(identical(other.stepCounter, stepCounter) || other.stepCounter == stepCounter)&&(identical(other.stepDetector, stepDetector) || other.stepDetector == stepDetector)&&(identical(other.rotationVector, rotationVector) || other.rotationVector == rotationVector)&&(identical(other.orientation, orientation) || other.orientation == orientation)&&(identical(other.gravity, gravity) || other.gravity == gravity)&&(identical(other.linearAcceleration, linearAcceleration) || other.linearAcceleration == linearAcceleration)&&(identical(other.deviceOrientation, deviceOrientation) || other.deviceOrientation == deviceOrientation)&&(identical(other.gameRotationVector, gameRotationVector) || other.gameRotationVector == gameRotationVector)&&(identical(other.geomagneticRotationVector, geomagneticRotationVector) || other.geomagneticRotationVector == geomagneticRotationVector)&&(identical(other.significantMotion, significantMotion) || other.significantMotion == significantMotion)&&(identical(other.stationaryDetect, stationaryDetect) || other.stationaryDetect == stationaryDetect)&&(identical(other.wakeGesture, wakeGesture) || other.wakeGesture == wakeGesture)&&(identical(other.pickupDetect, pickupDetect) || other.pickupDetect == pickupDetect)&&(identical(other.accelerometerUncalibrated, accelerometerUncalibrated) || other.accelerometerUncalibrated == accelerometerUncalibrated)&&(identical(other.magneticFieldUncalibrated, magneticFieldUncalibrated) || other.magneticFieldUncalibrated == magneticFieldUncalibrated)&&(identical(other.gyroscopeUncalibrated, gyroscopeUncalibrated) || other.gyroscopeUncalibrated == gyroscopeUncalibrated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,timestamp,tenantId,accelerometer,gyroscope,magnetometer,proximity,light,pressure,stepCounter,stepDetector,rotationVector,orientation,gravity,linearAcceleration,deviceOrientation,gameRotationVector,geomagneticRotationVector,significantMotion,stationaryDetect,wakeGesture,pickupDetect,accelerometerUncalibrated,magneticFieldUncalibrated,gyroscopeUncalibrated]);

@override
String toString() {
  return 'EnhancedSensorData(timestamp: $timestamp, tenantId: $tenantId, accelerometer: $accelerometer, gyroscope: $gyroscope, magnetometer: $magnetometer, proximity: $proximity, light: $light, pressure: $pressure, stepCounter: $stepCounter, stepDetector: $stepDetector, rotationVector: $rotationVector, orientation: $orientation, gravity: $gravity, linearAcceleration: $linearAcceleration, deviceOrientation: $deviceOrientation, gameRotationVector: $gameRotationVector, geomagneticRotationVector: $geomagneticRotationVector, significantMotion: $significantMotion, stationaryDetect: $stationaryDetect, wakeGesture: $wakeGesture, pickupDetect: $pickupDetect, accelerometerUncalibrated: $accelerometerUncalibrated, magneticFieldUncalibrated: $magneticFieldUncalibrated, gyroscopeUncalibrated: $gyroscopeUncalibrated)';
}


}

/// @nodoc
abstract mixin class $EnhancedSensorDataCopyWith<$Res>  {
  factory $EnhancedSensorDataCopyWith(EnhancedSensorData value, $Res Function(EnhancedSensorData) _then) = _$EnhancedSensorDataCopyWithImpl;
@useResult
$Res call({
 DateTime timestamp, String? tenantId, AccelerometerData? accelerometer, GyroscopeData? gyroscope, MagnetometerData? magnetometer, ProximityData? proximity, LightSensorData? light, PressureData? pressure, StepCounterData? stepCounter, StepDetectorData? stepDetector, RotationVectorData? rotationVector, OrientationData? orientation, GravityData? gravity, LinearAccelerationData? linearAcceleration, DeviceOrientationData? deviceOrientation, GameRotationVectorData? gameRotationVector, GeomagneticRotationVectorData? geomagneticRotationVector, SignificantMotionData? significantMotion, StationaryDetectData? stationaryDetect, WakeGestureData? wakeGesture, PickupDetectData? pickupDetect, AccelerometerUncalibratedData? accelerometerUncalibrated, MagneticFieldUncalibratedData? magneticFieldUncalibrated, GyroscopeUncalibratedData? gyroscopeUncalibrated
});


$AccelerometerDataCopyWith<$Res>? get accelerometer;$GyroscopeDataCopyWith<$Res>? get gyroscope;$MagnetometerDataCopyWith<$Res>? get magnetometer;$ProximityDataCopyWith<$Res>? get proximity;$LightSensorDataCopyWith<$Res>? get light;$PressureDataCopyWith<$Res>? get pressure;$StepCounterDataCopyWith<$Res>? get stepCounter;$StepDetectorDataCopyWith<$Res>? get stepDetector;$RotationVectorDataCopyWith<$Res>? get rotationVector;$OrientationDataCopyWith<$Res>? get orientation;$GravityDataCopyWith<$Res>? get gravity;$LinearAccelerationDataCopyWith<$Res>? get linearAcceleration;$DeviceOrientationDataCopyWith<$Res>? get deviceOrientation;$GameRotationVectorDataCopyWith<$Res>? get gameRotationVector;$GeomagneticRotationVectorDataCopyWith<$Res>? get geomagneticRotationVector;$SignificantMotionDataCopyWith<$Res>? get significantMotion;$StationaryDetectDataCopyWith<$Res>? get stationaryDetect;$WakeGestureDataCopyWith<$Res>? get wakeGesture;$PickupDetectDataCopyWith<$Res>? get pickupDetect;$AccelerometerUncalibratedDataCopyWith<$Res>? get accelerometerUncalibrated;$MagneticFieldUncalibratedDataCopyWith<$Res>? get magneticFieldUncalibrated;$GyroscopeUncalibratedDataCopyWith<$Res>? get gyroscopeUncalibrated;

}
/// @nodoc
class _$EnhancedSensorDataCopyWithImpl<$Res>
    implements $EnhancedSensorDataCopyWith<$Res> {
  _$EnhancedSensorDataCopyWithImpl(this._self, this._then);

  final EnhancedSensorData _self;
  final $Res Function(EnhancedSensorData) _then;

/// Create a copy of EnhancedSensorData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timestamp = null,Object? tenantId = freezed,Object? accelerometer = freezed,Object? gyroscope = freezed,Object? magnetometer = freezed,Object? proximity = freezed,Object? light = freezed,Object? pressure = freezed,Object? stepCounter = freezed,Object? stepDetector = freezed,Object? rotationVector = freezed,Object? orientation = freezed,Object? gravity = freezed,Object? linearAcceleration = freezed,Object? deviceOrientation = freezed,Object? gameRotationVector = freezed,Object? geomagneticRotationVector = freezed,Object? significantMotion = freezed,Object? stationaryDetect = freezed,Object? wakeGesture = freezed,Object? pickupDetect = freezed,Object? accelerometerUncalibrated = freezed,Object? magneticFieldUncalibrated = freezed,Object? gyroscopeUncalibrated = freezed,}) {
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
as GeomagneticRotationVectorData?,significantMotion: freezed == significantMotion ? _self.significantMotion : significantMotion // ignore: cast_nullable_to_non_nullable
as SignificantMotionData?,stationaryDetect: freezed == stationaryDetect ? _self.stationaryDetect : stationaryDetect // ignore: cast_nullable_to_non_nullable
as StationaryDetectData?,wakeGesture: freezed == wakeGesture ? _self.wakeGesture : wakeGesture // ignore: cast_nullable_to_non_nullable
as WakeGestureData?,pickupDetect: freezed == pickupDetect ? _self.pickupDetect : pickupDetect // ignore: cast_nullable_to_non_nullable
as PickupDetectData?,accelerometerUncalibrated: freezed == accelerometerUncalibrated ? _self.accelerometerUncalibrated : accelerometerUncalibrated // ignore: cast_nullable_to_non_nullable
as AccelerometerUncalibratedData?,magneticFieldUncalibrated: freezed == magneticFieldUncalibrated ? _self.magneticFieldUncalibrated : magneticFieldUncalibrated // ignore: cast_nullable_to_non_nullable
as MagneticFieldUncalibratedData?,gyroscopeUncalibrated: freezed == gyroscopeUncalibrated ? _self.gyroscopeUncalibrated : gyroscopeUncalibrated // ignore: cast_nullable_to_non_nullable
as GyroscopeUncalibratedData?,
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
}/// Create a copy of EnhancedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SignificantMotionDataCopyWith<$Res>? get significantMotion {
    if (_self.significantMotion == null) {
    return null;
  }

  return $SignificantMotionDataCopyWith<$Res>(_self.significantMotion!, (value) {
    return _then(_self.copyWith(significantMotion: value));
  });
}/// Create a copy of EnhancedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StationaryDetectDataCopyWith<$Res>? get stationaryDetect {
    if (_self.stationaryDetect == null) {
    return null;
  }

  return $StationaryDetectDataCopyWith<$Res>(_self.stationaryDetect!, (value) {
    return _then(_self.copyWith(stationaryDetect: value));
  });
}/// Create a copy of EnhancedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WakeGestureDataCopyWith<$Res>? get wakeGesture {
    if (_self.wakeGesture == null) {
    return null;
  }

  return $WakeGestureDataCopyWith<$Res>(_self.wakeGesture!, (value) {
    return _then(_self.copyWith(wakeGesture: value));
  });
}/// Create a copy of EnhancedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PickupDetectDataCopyWith<$Res>? get pickupDetect {
    if (_self.pickupDetect == null) {
    return null;
  }

  return $PickupDetectDataCopyWith<$Res>(_self.pickupDetect!, (value) {
    return _then(_self.copyWith(pickupDetect: value));
  });
}/// Create a copy of EnhancedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccelerometerUncalibratedDataCopyWith<$Res>? get accelerometerUncalibrated {
    if (_self.accelerometerUncalibrated == null) {
    return null;
  }

  return $AccelerometerUncalibratedDataCopyWith<$Res>(_self.accelerometerUncalibrated!, (value) {
    return _then(_self.copyWith(accelerometerUncalibrated: value));
  });
}/// Create a copy of EnhancedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MagneticFieldUncalibratedDataCopyWith<$Res>? get magneticFieldUncalibrated {
    if (_self.magneticFieldUncalibrated == null) {
    return null;
  }

  return $MagneticFieldUncalibratedDataCopyWith<$Res>(_self.magneticFieldUncalibrated!, (value) {
    return _then(_self.copyWith(magneticFieldUncalibrated: value));
  });
}/// Create a copy of EnhancedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GyroscopeUncalibratedDataCopyWith<$Res>? get gyroscopeUncalibrated {
    if (_self.gyroscopeUncalibrated == null) {
    return null;
  }

  return $GyroscopeUncalibratedDataCopyWith<$Res>(_self.gyroscopeUncalibrated!, (value) {
    return _then(_self.copyWith(gyroscopeUncalibrated: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _EnhancedSensorData implements EnhancedSensorData {
  const _EnhancedSensorData({required this.timestamp, this.tenantId, this.accelerometer, this.gyroscope, this.magnetometer, this.proximity, this.light, this.pressure, this.stepCounter, this.stepDetector, this.rotationVector, this.orientation, this.gravity, this.linearAcceleration, this.deviceOrientation, this.gameRotationVector, this.geomagneticRotationVector, this.significantMotion, this.stationaryDetect, this.wakeGesture, this.pickupDetect, this.accelerometerUncalibrated, this.magneticFieldUncalibrated, this.gyroscopeUncalibrated});
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
// New sensors
@override final  SignificantMotionData? significantMotion;
@override final  StationaryDetectData? stationaryDetect;
@override final  WakeGestureData? wakeGesture;
@override final  PickupDetectData? pickupDetect;
@override final  AccelerometerUncalibratedData? accelerometerUncalibrated;
@override final  MagneticFieldUncalibratedData? magneticFieldUncalibrated;
@override final  GyroscopeUncalibratedData? gyroscopeUncalibrated;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EnhancedSensorData&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.accelerometer, accelerometer) || other.accelerometer == accelerometer)&&(identical(other.gyroscope, gyroscope) || other.gyroscope == gyroscope)&&(identical(other.magnetometer, magnetometer) || other.magnetometer == magnetometer)&&(identical(other.proximity, proximity) || other.proximity == proximity)&&(identical(other.light, light) || other.light == light)&&(identical(other.pressure, pressure) || other.pressure == pressure)&&(identical(other.stepCounter, stepCounter) || other.stepCounter == stepCounter)&&(identical(other.stepDetector, stepDetector) || other.stepDetector == stepDetector)&&(identical(other.rotationVector, rotationVector) || other.rotationVector == rotationVector)&&(identical(other.orientation, orientation) || other.orientation == orientation)&&(identical(other.gravity, gravity) || other.gravity == gravity)&&(identical(other.linearAcceleration, linearAcceleration) || other.linearAcceleration == linearAcceleration)&&(identical(other.deviceOrientation, deviceOrientation) || other.deviceOrientation == deviceOrientation)&&(identical(other.gameRotationVector, gameRotationVector) || other.gameRotationVector == gameRotationVector)&&(identical(other.geomagneticRotationVector, geomagneticRotationVector) || other.geomagneticRotationVector == geomagneticRotationVector)&&(identical(other.significantMotion, significantMotion) || other.significantMotion == significantMotion)&&(identical(other.stationaryDetect, stationaryDetect) || other.stationaryDetect == stationaryDetect)&&(identical(other.wakeGesture, wakeGesture) || other.wakeGesture == wakeGesture)&&(identical(other.pickupDetect, pickupDetect) || other.pickupDetect == pickupDetect)&&(identical(other.accelerometerUncalibrated, accelerometerUncalibrated) || other.accelerometerUncalibrated == accelerometerUncalibrated)&&(identical(other.magneticFieldUncalibrated, magneticFieldUncalibrated) || other.magneticFieldUncalibrated == magneticFieldUncalibrated)&&(identical(other.gyroscopeUncalibrated, gyroscopeUncalibrated) || other.gyroscopeUncalibrated == gyroscopeUncalibrated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,timestamp,tenantId,accelerometer,gyroscope,magnetometer,proximity,light,pressure,stepCounter,stepDetector,rotationVector,orientation,gravity,linearAcceleration,deviceOrientation,gameRotationVector,geomagneticRotationVector,significantMotion,stationaryDetect,wakeGesture,pickupDetect,accelerometerUncalibrated,magneticFieldUncalibrated,gyroscopeUncalibrated]);

@override
String toString() {
  return 'EnhancedSensorData(timestamp: $timestamp, tenantId: $tenantId, accelerometer: $accelerometer, gyroscope: $gyroscope, magnetometer: $magnetometer, proximity: $proximity, light: $light, pressure: $pressure, stepCounter: $stepCounter, stepDetector: $stepDetector, rotationVector: $rotationVector, orientation: $orientation, gravity: $gravity, linearAcceleration: $linearAcceleration, deviceOrientation: $deviceOrientation, gameRotationVector: $gameRotationVector, geomagneticRotationVector: $geomagneticRotationVector, significantMotion: $significantMotion, stationaryDetect: $stationaryDetect, wakeGesture: $wakeGesture, pickupDetect: $pickupDetect, accelerometerUncalibrated: $accelerometerUncalibrated, magneticFieldUncalibrated: $magneticFieldUncalibrated, gyroscopeUncalibrated: $gyroscopeUncalibrated)';
}


}

/// @nodoc
abstract mixin class _$EnhancedSensorDataCopyWith<$Res> implements $EnhancedSensorDataCopyWith<$Res> {
  factory _$EnhancedSensorDataCopyWith(_EnhancedSensorData value, $Res Function(_EnhancedSensorData) _then) = __$EnhancedSensorDataCopyWithImpl;
@override @useResult
$Res call({
 DateTime timestamp, String? tenantId, AccelerometerData? accelerometer, GyroscopeData? gyroscope, MagnetometerData? magnetometer, ProximityData? proximity, LightSensorData? light, PressureData? pressure, StepCounterData? stepCounter, StepDetectorData? stepDetector, RotationVectorData? rotationVector, OrientationData? orientation, GravityData? gravity, LinearAccelerationData? linearAcceleration, DeviceOrientationData? deviceOrientation, GameRotationVectorData? gameRotationVector, GeomagneticRotationVectorData? geomagneticRotationVector, SignificantMotionData? significantMotion, StationaryDetectData? stationaryDetect, WakeGestureData? wakeGesture, PickupDetectData? pickupDetect, AccelerometerUncalibratedData? accelerometerUncalibrated, MagneticFieldUncalibratedData? magneticFieldUncalibrated, GyroscopeUncalibratedData? gyroscopeUncalibrated
});


@override $AccelerometerDataCopyWith<$Res>? get accelerometer;@override $GyroscopeDataCopyWith<$Res>? get gyroscope;@override $MagnetometerDataCopyWith<$Res>? get magnetometer;@override $ProximityDataCopyWith<$Res>? get proximity;@override $LightSensorDataCopyWith<$Res>? get light;@override $PressureDataCopyWith<$Res>? get pressure;@override $StepCounterDataCopyWith<$Res>? get stepCounter;@override $StepDetectorDataCopyWith<$Res>? get stepDetector;@override $RotationVectorDataCopyWith<$Res>? get rotationVector;@override $OrientationDataCopyWith<$Res>? get orientation;@override $GravityDataCopyWith<$Res>? get gravity;@override $LinearAccelerationDataCopyWith<$Res>? get linearAcceleration;@override $DeviceOrientationDataCopyWith<$Res>? get deviceOrientation;@override $GameRotationVectorDataCopyWith<$Res>? get gameRotationVector;@override $GeomagneticRotationVectorDataCopyWith<$Res>? get geomagneticRotationVector;@override $SignificantMotionDataCopyWith<$Res>? get significantMotion;@override $StationaryDetectDataCopyWith<$Res>? get stationaryDetect;@override $WakeGestureDataCopyWith<$Res>? get wakeGesture;@override $PickupDetectDataCopyWith<$Res>? get pickupDetect;@override $AccelerometerUncalibratedDataCopyWith<$Res>? get accelerometerUncalibrated;@override $MagneticFieldUncalibratedDataCopyWith<$Res>? get magneticFieldUncalibrated;@override $GyroscopeUncalibratedDataCopyWith<$Res>? get gyroscopeUncalibrated;

}
/// @nodoc
class __$EnhancedSensorDataCopyWithImpl<$Res>
    implements _$EnhancedSensorDataCopyWith<$Res> {
  __$EnhancedSensorDataCopyWithImpl(this._self, this._then);

  final _EnhancedSensorData _self;
  final $Res Function(_EnhancedSensorData) _then;

/// Create a copy of EnhancedSensorData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timestamp = null,Object? tenantId = freezed,Object? accelerometer = freezed,Object? gyroscope = freezed,Object? magnetometer = freezed,Object? proximity = freezed,Object? light = freezed,Object? pressure = freezed,Object? stepCounter = freezed,Object? stepDetector = freezed,Object? rotationVector = freezed,Object? orientation = freezed,Object? gravity = freezed,Object? linearAcceleration = freezed,Object? deviceOrientation = freezed,Object? gameRotationVector = freezed,Object? geomagneticRotationVector = freezed,Object? significantMotion = freezed,Object? stationaryDetect = freezed,Object? wakeGesture = freezed,Object? pickupDetect = freezed,Object? accelerometerUncalibrated = freezed,Object? magneticFieldUncalibrated = freezed,Object? gyroscopeUncalibrated = freezed,}) {
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
as GeomagneticRotationVectorData?,significantMotion: freezed == significantMotion ? _self.significantMotion : significantMotion // ignore: cast_nullable_to_non_nullable
as SignificantMotionData?,stationaryDetect: freezed == stationaryDetect ? _self.stationaryDetect : stationaryDetect // ignore: cast_nullable_to_non_nullable
as StationaryDetectData?,wakeGesture: freezed == wakeGesture ? _self.wakeGesture : wakeGesture // ignore: cast_nullable_to_non_nullable
as WakeGestureData?,pickupDetect: freezed == pickupDetect ? _self.pickupDetect : pickupDetect // ignore: cast_nullable_to_non_nullable
as PickupDetectData?,accelerometerUncalibrated: freezed == accelerometerUncalibrated ? _self.accelerometerUncalibrated : accelerometerUncalibrated // ignore: cast_nullable_to_non_nullable
as AccelerometerUncalibratedData?,magneticFieldUncalibrated: freezed == magneticFieldUncalibrated ? _self.magneticFieldUncalibrated : magneticFieldUncalibrated // ignore: cast_nullable_to_non_nullable
as MagneticFieldUncalibratedData?,gyroscopeUncalibrated: freezed == gyroscopeUncalibrated ? _self.gyroscopeUncalibrated : gyroscopeUncalibrated // ignore: cast_nullable_to_non_nullable
as GyroscopeUncalibratedData?,
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
}/// Create a copy of EnhancedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SignificantMotionDataCopyWith<$Res>? get significantMotion {
    if (_self.significantMotion == null) {
    return null;
  }

  return $SignificantMotionDataCopyWith<$Res>(_self.significantMotion!, (value) {
    return _then(_self.copyWith(significantMotion: value));
  });
}/// Create a copy of EnhancedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StationaryDetectDataCopyWith<$Res>? get stationaryDetect {
    if (_self.stationaryDetect == null) {
    return null;
  }

  return $StationaryDetectDataCopyWith<$Res>(_self.stationaryDetect!, (value) {
    return _then(_self.copyWith(stationaryDetect: value));
  });
}/// Create a copy of EnhancedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WakeGestureDataCopyWith<$Res>? get wakeGesture {
    if (_self.wakeGesture == null) {
    return null;
  }

  return $WakeGestureDataCopyWith<$Res>(_self.wakeGesture!, (value) {
    return _then(_self.copyWith(wakeGesture: value));
  });
}/// Create a copy of EnhancedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PickupDetectDataCopyWith<$Res>? get pickupDetect {
    if (_self.pickupDetect == null) {
    return null;
  }

  return $PickupDetectDataCopyWith<$Res>(_self.pickupDetect!, (value) {
    return _then(_self.copyWith(pickupDetect: value));
  });
}/// Create a copy of EnhancedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccelerometerUncalibratedDataCopyWith<$Res>? get accelerometerUncalibrated {
    if (_self.accelerometerUncalibrated == null) {
    return null;
  }

  return $AccelerometerUncalibratedDataCopyWith<$Res>(_self.accelerometerUncalibrated!, (value) {
    return _then(_self.copyWith(accelerometerUncalibrated: value));
  });
}/// Create a copy of EnhancedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MagneticFieldUncalibratedDataCopyWith<$Res>? get magneticFieldUncalibrated {
    if (_self.magneticFieldUncalibrated == null) {
    return null;
  }

  return $MagneticFieldUncalibratedDataCopyWith<$Res>(_self.magneticFieldUncalibrated!, (value) {
    return _then(_self.copyWith(magneticFieldUncalibrated: value));
  });
}/// Create a copy of EnhancedSensorData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GyroscopeUncalibratedDataCopyWith<$Res>? get gyroscopeUncalibrated {
    if (_self.gyroscopeUncalibrated == null) {
    return null;
  }

  return $GyroscopeUncalibratedDataCopyWith<$Res>(_self.gyroscopeUncalibrated!, (value) {
    return _then(_self.copyWith(gyroscopeUncalibrated: value));
  });
}
}

// dart format on
