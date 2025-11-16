// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OnboardingResponse {

 OnboardingStep get nextOnboardingStep;
/// Create a copy of OnboardingResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingResponseCopyWith<OnboardingResponse> get copyWith => _$OnboardingResponseCopyWithImpl<OnboardingResponse>(this as OnboardingResponse, _$identity);

  /// Serializes this OnboardingResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingResponse&&(identical(other.nextOnboardingStep, nextOnboardingStep) || other.nextOnboardingStep == nextOnboardingStep));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nextOnboardingStep);

@override
String toString() {
  return 'OnboardingResponse(nextOnboardingStep: $nextOnboardingStep)';
}


}

/// @nodoc
abstract mixin class $OnboardingResponseCopyWith<$Res>  {
  factory $OnboardingResponseCopyWith(OnboardingResponse value, $Res Function(OnboardingResponse) _then) = _$OnboardingResponseCopyWithImpl;
@useResult
$Res call({
 OnboardingStep nextOnboardingStep
});




}
/// @nodoc
class _$OnboardingResponseCopyWithImpl<$Res>
    implements $OnboardingResponseCopyWith<$Res> {
  _$OnboardingResponseCopyWithImpl(this._self, this._then);

  final OnboardingResponse _self;
  final $Res Function(OnboardingResponse) _then;

/// Create a copy of OnboardingResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nextOnboardingStep = null,}) {
  return _then(_self.copyWith(
nextOnboardingStep: null == nextOnboardingStep ? _self.nextOnboardingStep : nextOnboardingStep // ignore: cast_nullable_to_non_nullable
as OnboardingStep,
  ));
}

}


/// Adds pattern-matching-related methods to [OnboardingResponse].
extension OnboardingResponsePatterns on OnboardingResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnboardingResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnboardingResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnboardingResponse value)  $default,){
final _that = this;
switch (_that) {
case _OnboardingResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnboardingResponse value)?  $default,){
final _that = this;
switch (_that) {
case _OnboardingResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( OnboardingStep nextOnboardingStep)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnboardingResponse() when $default != null:
return $default(_that.nextOnboardingStep);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( OnboardingStep nextOnboardingStep)  $default,) {final _that = this;
switch (_that) {
case _OnboardingResponse():
return $default(_that.nextOnboardingStep);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( OnboardingStep nextOnboardingStep)?  $default,) {final _that = this;
switch (_that) {
case _OnboardingResponse() when $default != null:
return $default(_that.nextOnboardingStep);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OnboardingResponse implements OnboardingResponse {
  const _OnboardingResponse({required this.nextOnboardingStep});
  factory _OnboardingResponse.fromJson(Map<String, dynamic> json) => _$OnboardingResponseFromJson(json);

@override final  OnboardingStep nextOnboardingStep;

/// Create a copy of OnboardingResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingResponseCopyWith<_OnboardingResponse> get copyWith => __$OnboardingResponseCopyWithImpl<_OnboardingResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OnboardingResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingResponse&&(identical(other.nextOnboardingStep, nextOnboardingStep) || other.nextOnboardingStep == nextOnboardingStep));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nextOnboardingStep);

@override
String toString() {
  return 'OnboardingResponse(nextOnboardingStep: $nextOnboardingStep)';
}


}

/// @nodoc
abstract mixin class _$OnboardingResponseCopyWith<$Res> implements $OnboardingResponseCopyWith<$Res> {
  factory _$OnboardingResponseCopyWith(_OnboardingResponse value, $Res Function(_OnboardingResponse) _then) = __$OnboardingResponseCopyWithImpl;
@override @useResult
$Res call({
 OnboardingStep nextOnboardingStep
});




}
/// @nodoc
class __$OnboardingResponseCopyWithImpl<$Res>
    implements _$OnboardingResponseCopyWith<$Res> {
  __$OnboardingResponseCopyWithImpl(this._self, this._then);

  final _OnboardingResponse _self;
  final $Res Function(_OnboardingResponse) _then;

/// Create a copy of OnboardingResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nextOnboardingStep = null,}) {
  return _then(_OnboardingResponse(
nextOnboardingStep: null == nextOnboardingStep ? _self.nextOnboardingStep : nextOnboardingStep // ignore: cast_nullable_to_non_nullable
as OnboardingStep,
  ));
}


}

// dart format on
