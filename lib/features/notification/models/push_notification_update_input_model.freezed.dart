// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'push_notification_update_input_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PushNotificationUpdateInput {

 String get settingType; String get settingKey; bool get isEnabled;
/// Create a copy of PushNotificationUpdateInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PushNotificationUpdateInputCopyWith<PushNotificationUpdateInput> get copyWith => _$PushNotificationUpdateInputCopyWithImpl<PushNotificationUpdateInput>(this as PushNotificationUpdateInput, _$identity);

  /// Serializes this PushNotificationUpdateInput to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PushNotificationUpdateInput&&(identical(other.settingType, settingType) || other.settingType == settingType)&&(identical(other.settingKey, settingKey) || other.settingKey == settingKey)&&(identical(other.isEnabled, isEnabled) || other.isEnabled == isEnabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,settingType,settingKey,isEnabled);

@override
String toString() {
  return 'PushNotificationUpdateInput(settingType: $settingType, settingKey: $settingKey, isEnabled: $isEnabled)';
}


}

/// @nodoc
abstract mixin class $PushNotificationUpdateInputCopyWith<$Res>  {
  factory $PushNotificationUpdateInputCopyWith(PushNotificationUpdateInput value, $Res Function(PushNotificationUpdateInput) _then) = _$PushNotificationUpdateInputCopyWithImpl;
@useResult
$Res call({
 String settingType, String settingKey, bool isEnabled
});




}
/// @nodoc
class _$PushNotificationUpdateInputCopyWithImpl<$Res>
    implements $PushNotificationUpdateInputCopyWith<$Res> {
  _$PushNotificationUpdateInputCopyWithImpl(this._self, this._then);

  final PushNotificationUpdateInput _self;
  final $Res Function(PushNotificationUpdateInput) _then;

/// Create a copy of PushNotificationUpdateInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? settingType = null,Object? settingKey = null,Object? isEnabled = null,}) {
  return _then(_self.copyWith(
settingType: null == settingType ? _self.settingType : settingType // ignore: cast_nullable_to_non_nullable
as String,settingKey: null == settingKey ? _self.settingKey : settingKey // ignore: cast_nullable_to_non_nullable
as String,isEnabled: null == isEnabled ? _self.isEnabled : isEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PushNotificationUpdateInput].
extension PushNotificationUpdateInputPatterns on PushNotificationUpdateInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PushNotificationUpdateInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PushNotificationUpdateInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PushNotificationUpdateInput value)  $default,){
final _that = this;
switch (_that) {
case _PushNotificationUpdateInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PushNotificationUpdateInput value)?  $default,){
final _that = this;
switch (_that) {
case _PushNotificationUpdateInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String settingType,  String settingKey,  bool isEnabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PushNotificationUpdateInput() when $default != null:
return $default(_that.settingType,_that.settingKey,_that.isEnabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String settingType,  String settingKey,  bool isEnabled)  $default,) {final _that = this;
switch (_that) {
case _PushNotificationUpdateInput():
return $default(_that.settingType,_that.settingKey,_that.isEnabled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String settingType,  String settingKey,  bool isEnabled)?  $default,) {final _that = this;
switch (_that) {
case _PushNotificationUpdateInput() when $default != null:
return $default(_that.settingType,_that.settingKey,_that.isEnabled);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PushNotificationUpdateInput implements PushNotificationUpdateInput {
  const _PushNotificationUpdateInput({required this.settingType, required this.settingKey, required this.isEnabled});
  factory _PushNotificationUpdateInput.fromJson(Map<String, dynamic> json) => _$PushNotificationUpdateInputFromJson(json);

@override final  String settingType;
@override final  String settingKey;
@override final  bool isEnabled;

/// Create a copy of PushNotificationUpdateInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PushNotificationUpdateInputCopyWith<_PushNotificationUpdateInput> get copyWith => __$PushNotificationUpdateInputCopyWithImpl<_PushNotificationUpdateInput>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PushNotificationUpdateInputToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PushNotificationUpdateInput&&(identical(other.settingType, settingType) || other.settingType == settingType)&&(identical(other.settingKey, settingKey) || other.settingKey == settingKey)&&(identical(other.isEnabled, isEnabled) || other.isEnabled == isEnabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,settingType,settingKey,isEnabled);

@override
String toString() {
  return 'PushNotificationUpdateInput(settingType: $settingType, settingKey: $settingKey, isEnabled: $isEnabled)';
}


}

/// @nodoc
abstract mixin class _$PushNotificationUpdateInputCopyWith<$Res> implements $PushNotificationUpdateInputCopyWith<$Res> {
  factory _$PushNotificationUpdateInputCopyWith(_PushNotificationUpdateInput value, $Res Function(_PushNotificationUpdateInput) _then) = __$PushNotificationUpdateInputCopyWithImpl;
@override @useResult
$Res call({
 String settingType, String settingKey, bool isEnabled
});




}
/// @nodoc
class __$PushNotificationUpdateInputCopyWithImpl<$Res>
    implements _$PushNotificationUpdateInputCopyWith<$Res> {
  __$PushNotificationUpdateInputCopyWithImpl(this._self, this._then);

  final _PushNotificationUpdateInput _self;
  final $Res Function(_PushNotificationUpdateInput) _then;

/// Create a copy of PushNotificationUpdateInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? settingType = null,Object? settingKey = null,Object? isEnabled = null,}) {
  return _then(_PushNotificationUpdateInput(
settingType: null == settingType ? _self.settingType : settingType // ignore: cast_nullable_to_non_nullable
as String,settingKey: null == settingKey ? _self.settingKey : settingKey // ignore: cast_nullable_to_non_nullable
as String,isEnabled: null == isEnabled ? _self.isEnabled : isEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
