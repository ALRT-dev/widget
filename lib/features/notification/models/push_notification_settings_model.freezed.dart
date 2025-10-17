// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'push_notification_settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PushNotificationSettings {

/// Push notifications settings by severity level.
 PushNotificationSettingsBySeverity get severity;
/// Create a copy of PushNotificationSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PushNotificationSettingsCopyWith<PushNotificationSettings> get copyWith => _$PushNotificationSettingsCopyWithImpl<PushNotificationSettings>(this as PushNotificationSettings, _$identity);

  /// Serializes this PushNotificationSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PushNotificationSettings&&(identical(other.severity, severity) || other.severity == severity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,severity);

@override
String toString() {
  return 'PushNotificationSettings(severity: $severity)';
}


}

/// @nodoc
abstract mixin class $PushNotificationSettingsCopyWith<$Res>  {
  factory $PushNotificationSettingsCopyWith(PushNotificationSettings value, $Res Function(PushNotificationSettings) _then) = _$PushNotificationSettingsCopyWithImpl;
@useResult
$Res call({
 PushNotificationSettingsBySeverity severity
});


$PushNotificationSettingsBySeverityCopyWith<$Res> get severity;

}
/// @nodoc
class _$PushNotificationSettingsCopyWithImpl<$Res>
    implements $PushNotificationSettingsCopyWith<$Res> {
  _$PushNotificationSettingsCopyWithImpl(this._self, this._then);

  final PushNotificationSettings _self;
  final $Res Function(PushNotificationSettings) _then;

/// Create a copy of PushNotificationSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? severity = null,}) {
  return _then(_self.copyWith(
severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as PushNotificationSettingsBySeverity,
  ));
}
/// Create a copy of PushNotificationSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PushNotificationSettingsBySeverityCopyWith<$Res> get severity {
  
  return $PushNotificationSettingsBySeverityCopyWith<$Res>(_self.severity, (value) {
    return _then(_self.copyWith(severity: value));
  });
}
}


/// Adds pattern-matching-related methods to [PushNotificationSettings].
extension PushNotificationSettingsPatterns on PushNotificationSettings {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PushNotificationSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PushNotificationSettings() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PushNotificationSettings value)  $default,){
final _that = this;
switch (_that) {
case _PushNotificationSettings():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PushNotificationSettings value)?  $default,){
final _that = this;
switch (_that) {
case _PushNotificationSettings() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PushNotificationSettingsBySeverity severity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PushNotificationSettings() when $default != null:
return $default(_that.severity);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PushNotificationSettingsBySeverity severity)  $default,) {final _that = this;
switch (_that) {
case _PushNotificationSettings():
return $default(_that.severity);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PushNotificationSettingsBySeverity severity)?  $default,) {final _that = this;
switch (_that) {
case _PushNotificationSettings() when $default != null:
return $default(_that.severity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PushNotificationSettings extends PushNotificationSettings {
  const _PushNotificationSettings({this.severity = const PushNotificationSettingsBySeverity()}): super._();
  factory _PushNotificationSettings.fromJson(Map<String, dynamic> json) => _$PushNotificationSettingsFromJson(json);

/// Push notifications settings by severity level.
@override@JsonKey() final  PushNotificationSettingsBySeverity severity;

/// Create a copy of PushNotificationSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PushNotificationSettingsCopyWith<_PushNotificationSettings> get copyWith => __$PushNotificationSettingsCopyWithImpl<_PushNotificationSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PushNotificationSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PushNotificationSettings&&(identical(other.severity, severity) || other.severity == severity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,severity);

@override
String toString() {
  return 'PushNotificationSettings(severity: $severity)';
}


}

/// @nodoc
abstract mixin class _$PushNotificationSettingsCopyWith<$Res> implements $PushNotificationSettingsCopyWith<$Res> {
  factory _$PushNotificationSettingsCopyWith(_PushNotificationSettings value, $Res Function(_PushNotificationSettings) _then) = __$PushNotificationSettingsCopyWithImpl;
@override @useResult
$Res call({
 PushNotificationSettingsBySeverity severity
});


@override $PushNotificationSettingsBySeverityCopyWith<$Res> get severity;

}
/// @nodoc
class __$PushNotificationSettingsCopyWithImpl<$Res>
    implements _$PushNotificationSettingsCopyWith<$Res> {
  __$PushNotificationSettingsCopyWithImpl(this._self, this._then);

  final _PushNotificationSettings _self;
  final $Res Function(_PushNotificationSettings) _then;

/// Create a copy of PushNotificationSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? severity = null,}) {
  return _then(_PushNotificationSettings(
severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as PushNotificationSettingsBySeverity,
  ));
}

/// Create a copy of PushNotificationSettings
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PushNotificationSettingsBySeverityCopyWith<$Res> get severity {
  
  return $PushNotificationSettingsBySeverityCopyWith<$Res>(_self.severity, (value) {
    return _then(_self.copyWith(severity: value));
  });
}
}


/// @nodoc
mixin _$PushNotificationSettingsBySeverity {

 bool get info; bool get advice; bool get watchAndAct; bool get emergency;
/// Create a copy of PushNotificationSettingsBySeverity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PushNotificationSettingsBySeverityCopyWith<PushNotificationSettingsBySeverity> get copyWith => _$PushNotificationSettingsBySeverityCopyWithImpl<PushNotificationSettingsBySeverity>(this as PushNotificationSettingsBySeverity, _$identity);

  /// Serializes this PushNotificationSettingsBySeverity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PushNotificationSettingsBySeverity&&(identical(other.info, info) || other.info == info)&&(identical(other.advice, advice) || other.advice == advice)&&(identical(other.watchAndAct, watchAndAct) || other.watchAndAct == watchAndAct)&&(identical(other.emergency, emergency) || other.emergency == emergency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,info,advice,watchAndAct,emergency);

@override
String toString() {
  return 'PushNotificationSettingsBySeverity(info: $info, advice: $advice, watchAndAct: $watchAndAct, emergency: $emergency)';
}


}

/// @nodoc
abstract mixin class $PushNotificationSettingsBySeverityCopyWith<$Res>  {
  factory $PushNotificationSettingsBySeverityCopyWith(PushNotificationSettingsBySeverity value, $Res Function(PushNotificationSettingsBySeverity) _then) = _$PushNotificationSettingsBySeverityCopyWithImpl;
@useResult
$Res call({
 bool info, bool advice, bool watchAndAct, bool emergency
});




}
/// @nodoc
class _$PushNotificationSettingsBySeverityCopyWithImpl<$Res>
    implements $PushNotificationSettingsBySeverityCopyWith<$Res> {
  _$PushNotificationSettingsBySeverityCopyWithImpl(this._self, this._then);

  final PushNotificationSettingsBySeverity _self;
  final $Res Function(PushNotificationSettingsBySeverity) _then;

/// Create a copy of PushNotificationSettingsBySeverity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? info = null,Object? advice = null,Object? watchAndAct = null,Object? emergency = null,}) {
  return _then(_self.copyWith(
info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as bool,advice: null == advice ? _self.advice : advice // ignore: cast_nullable_to_non_nullable
as bool,watchAndAct: null == watchAndAct ? _self.watchAndAct : watchAndAct // ignore: cast_nullable_to_non_nullable
as bool,emergency: null == emergency ? _self.emergency : emergency // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PushNotificationSettingsBySeverity].
extension PushNotificationSettingsBySeverityPatterns on PushNotificationSettingsBySeverity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PushNotificationSettingsBySeverity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PushNotificationSettingsBySeverity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PushNotificationSettingsBySeverity value)  $default,){
final _that = this;
switch (_that) {
case _PushNotificationSettingsBySeverity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PushNotificationSettingsBySeverity value)?  $default,){
final _that = this;
switch (_that) {
case _PushNotificationSettingsBySeverity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool info,  bool advice,  bool watchAndAct,  bool emergency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PushNotificationSettingsBySeverity() when $default != null:
return $default(_that.info,_that.advice,_that.watchAndAct,_that.emergency);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool info,  bool advice,  bool watchAndAct,  bool emergency)  $default,) {final _that = this;
switch (_that) {
case _PushNotificationSettingsBySeverity():
return $default(_that.info,_that.advice,_that.watchAndAct,_that.emergency);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool info,  bool advice,  bool watchAndAct,  bool emergency)?  $default,) {final _that = this;
switch (_that) {
case _PushNotificationSettingsBySeverity() when $default != null:
return $default(_that.info,_that.advice,_that.watchAndAct,_that.emergency);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PushNotificationSettingsBySeverity implements PushNotificationSettingsBySeverity {
  const _PushNotificationSettingsBySeverity({this.info = true, this.advice = true, this.watchAndAct = true, this.emergency = true});
  factory _PushNotificationSettingsBySeverity.fromJson(Map<String, dynamic> json) => _$PushNotificationSettingsBySeverityFromJson(json);

@override@JsonKey() final  bool info;
@override@JsonKey() final  bool advice;
@override@JsonKey() final  bool watchAndAct;
@override@JsonKey() final  bool emergency;

/// Create a copy of PushNotificationSettingsBySeverity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PushNotificationSettingsBySeverityCopyWith<_PushNotificationSettingsBySeverity> get copyWith => __$PushNotificationSettingsBySeverityCopyWithImpl<_PushNotificationSettingsBySeverity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PushNotificationSettingsBySeverityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PushNotificationSettingsBySeverity&&(identical(other.info, info) || other.info == info)&&(identical(other.advice, advice) || other.advice == advice)&&(identical(other.watchAndAct, watchAndAct) || other.watchAndAct == watchAndAct)&&(identical(other.emergency, emergency) || other.emergency == emergency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,info,advice,watchAndAct,emergency);

@override
String toString() {
  return 'PushNotificationSettingsBySeverity(info: $info, advice: $advice, watchAndAct: $watchAndAct, emergency: $emergency)';
}


}

/// @nodoc
abstract mixin class _$PushNotificationSettingsBySeverityCopyWith<$Res> implements $PushNotificationSettingsBySeverityCopyWith<$Res> {
  factory _$PushNotificationSettingsBySeverityCopyWith(_PushNotificationSettingsBySeverity value, $Res Function(_PushNotificationSettingsBySeverity) _then) = __$PushNotificationSettingsBySeverityCopyWithImpl;
@override @useResult
$Res call({
 bool info, bool advice, bool watchAndAct, bool emergency
});




}
/// @nodoc
class __$PushNotificationSettingsBySeverityCopyWithImpl<$Res>
    implements _$PushNotificationSettingsBySeverityCopyWith<$Res> {
  __$PushNotificationSettingsBySeverityCopyWithImpl(this._self, this._then);

  final _PushNotificationSettingsBySeverity _self;
  final $Res Function(_PushNotificationSettingsBySeverity) _then;

/// Create a copy of PushNotificationSettingsBySeverity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? info = null,Object? advice = null,Object? watchAndAct = null,Object? emergency = null,}) {
  return _then(_PushNotificationSettingsBySeverity(
info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as bool,advice: null == advice ? _self.advice : advice // ignore: cast_nullable_to_non_nullable
as bool,watchAndAct: null == watchAndAct ? _self.watchAndAct : watchAndAct // ignore: cast_nullable_to_non_nullable
as bool,emergency: null == emergency ? _self.emergency : emergency // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
