// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_provider_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileProviderState {

/// The state of logging out the user.
 LogoutState get logoutState;
/// Create a copy of ProfileProviderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileProviderStateCopyWith<ProfileProviderState> get copyWith => _$ProfileProviderStateCopyWithImpl<ProfileProviderState>(this as ProfileProviderState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileProviderState&&(identical(other.logoutState, logoutState) || other.logoutState == logoutState));
}


@override
int get hashCode => Object.hash(runtimeType,logoutState);

@override
String toString() {
  return 'ProfileProviderState(logoutState: $logoutState)';
}


}

/// @nodoc
abstract mixin class $ProfileProviderStateCopyWith<$Res>  {
  factory $ProfileProviderStateCopyWith(ProfileProviderState value, $Res Function(ProfileProviderState) _then) = _$ProfileProviderStateCopyWithImpl;
@useResult
$Res call({
 LogoutState logoutState
});


$LogoutStateCopyWith<$Res> get logoutState;

}
/// @nodoc
class _$ProfileProviderStateCopyWithImpl<$Res>
    implements $ProfileProviderStateCopyWith<$Res> {
  _$ProfileProviderStateCopyWithImpl(this._self, this._then);

  final ProfileProviderState _self;
  final $Res Function(ProfileProviderState) _then;

/// Create a copy of ProfileProviderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? logoutState = null,}) {
  return _then(_self.copyWith(
logoutState: null == logoutState ? _self.logoutState : logoutState // ignore: cast_nullable_to_non_nullable
as LogoutState,
  ));
}
/// Create a copy of ProfileProviderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LogoutStateCopyWith<$Res> get logoutState {
  
  return $LogoutStateCopyWith<$Res>(_self.logoutState, (value) {
    return _then(_self.copyWith(logoutState: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileProviderState].
extension ProfileProviderStatePatterns on ProfileProviderState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileProviderState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileProviderState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileProviderState value)  $default,){
final _that = this;
switch (_that) {
case _ProfileProviderState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileProviderState value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileProviderState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LogoutState logoutState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileProviderState() when $default != null:
return $default(_that.logoutState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LogoutState logoutState)  $default,) {final _that = this;
switch (_that) {
case _ProfileProviderState():
return $default(_that.logoutState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LogoutState logoutState)?  $default,) {final _that = this;
switch (_that) {
case _ProfileProviderState() when $default != null:
return $default(_that.logoutState);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileProviderState implements ProfileProviderState {
  const _ProfileProviderState({this.logoutState = const LogoutState.initial()});
  

/// The state of logging out the user.
@override@JsonKey() final  LogoutState logoutState;

/// Create a copy of ProfileProviderState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileProviderStateCopyWith<_ProfileProviderState> get copyWith => __$ProfileProviderStateCopyWithImpl<_ProfileProviderState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileProviderState&&(identical(other.logoutState, logoutState) || other.logoutState == logoutState));
}


@override
int get hashCode => Object.hash(runtimeType,logoutState);

@override
String toString() {
  return 'ProfileProviderState(logoutState: $logoutState)';
}


}

/// @nodoc
abstract mixin class _$ProfileProviderStateCopyWith<$Res> implements $ProfileProviderStateCopyWith<$Res> {
  factory _$ProfileProviderStateCopyWith(_ProfileProviderState value, $Res Function(_ProfileProviderState) _then) = __$ProfileProviderStateCopyWithImpl;
@override @useResult
$Res call({
 LogoutState logoutState
});


@override $LogoutStateCopyWith<$Res> get logoutState;

}
/// @nodoc
class __$ProfileProviderStateCopyWithImpl<$Res>
    implements _$ProfileProviderStateCopyWith<$Res> {
  __$ProfileProviderStateCopyWithImpl(this._self, this._then);

  final _ProfileProviderState _self;
  final $Res Function(_ProfileProviderState) _then;

/// Create a copy of ProfileProviderState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? logoutState = null,}) {
  return _then(_ProfileProviderState(
logoutState: null == logoutState ? _self.logoutState : logoutState // ignore: cast_nullable_to_non_nullable
as LogoutState,
  ));
}

/// Create a copy of ProfileProviderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LogoutStateCopyWith<$Res> get logoutState {
  
  return $LogoutStateCopyWith<$Res>(_self.logoutState, (value) {
    return _then(_self.copyWith(logoutState: value));
  });
}
}

/// @nodoc
mixin _$LogoutState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoutState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LogoutState()';
}


}

/// @nodoc
class $LogoutStateCopyWith<$Res>  {
$LogoutStateCopyWith(LogoutState _, $Res Function(LogoutState) __);
}


/// Adds pattern-matching-related methods to [LogoutState].
extension LogoutStatePatterns on LogoutState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LogoutStateInitial value)?  initial,TResult Function( _LogoutStateLoading value)?  loading,TResult Function( _LogoutStateSuccess value)?  success,TResult Function( _LogoutStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LogoutStateInitial() when initial != null:
return initial(_that);case _LogoutStateLoading() when loading != null:
return loading(_that);case _LogoutStateSuccess() when success != null:
return success(_that);case _LogoutStateError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LogoutStateInitial value)  initial,required TResult Function( _LogoutStateLoading value)  loading,required TResult Function( _LogoutStateSuccess value)  success,required TResult Function( _LogoutStateError value)  error,}){
final _that = this;
switch (_that) {
case _LogoutStateInitial():
return initial(_that);case _LogoutStateLoading():
return loading(_that);case _LogoutStateSuccess():
return success(_that);case _LogoutStateError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LogoutStateInitial value)?  initial,TResult? Function( _LogoutStateLoading value)?  loading,TResult? Function( _LogoutStateSuccess value)?  success,TResult? Function( _LogoutStateError value)?  error,}){
final _that = this;
switch (_that) {
case _LogoutStateInitial() when initial != null:
return initial(_that);case _LogoutStateLoading() when loading != null:
return loading(_that);case _LogoutStateSuccess() when success != null:
return success(_that);case _LogoutStateError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  success,TResult Function( AppError error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LogoutStateInitial() when initial != null:
return initial();case _LogoutStateLoading() when loading != null:
return loading();case _LogoutStateSuccess() when success != null:
return success();case _LogoutStateError() when error != null:
return error(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  success,required TResult Function( AppError error)  error,}) {final _that = this;
switch (_that) {
case _LogoutStateInitial():
return initial();case _LogoutStateLoading():
return loading();case _LogoutStateSuccess():
return success();case _LogoutStateError():
return error(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  success,TResult? Function( AppError error)?  error,}) {final _that = this;
switch (_that) {
case _LogoutStateInitial() when initial != null:
return initial();case _LogoutStateLoading() when loading != null:
return loading();case _LogoutStateSuccess() when success != null:
return success();case _LogoutStateError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _LogoutStateInitial implements LogoutState {
  const _LogoutStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogoutStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LogoutState.initial()';
}


}




/// @nodoc


class _LogoutStateLoading implements LogoutState {
  const _LogoutStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogoutStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LogoutState.loading()';
}


}




/// @nodoc


class _LogoutStateSuccess implements LogoutState {
  const _LogoutStateSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogoutStateSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LogoutState.success()';
}


}




/// @nodoc


class _LogoutStateError implements LogoutState {
  const _LogoutStateError(this.error);
  

 final  AppError error;

/// Create a copy of LogoutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogoutStateErrorCopyWith<_LogoutStateError> get copyWith => __$LogoutStateErrorCopyWithImpl<_LogoutStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogoutStateError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'LogoutState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class _$LogoutStateErrorCopyWith<$Res> implements $LogoutStateCopyWith<$Res> {
  factory _$LogoutStateErrorCopyWith(_LogoutStateError value, $Res Function(_LogoutStateError) _then) = __$LogoutStateErrorCopyWithImpl;
@useResult
$Res call({
 AppError error
});


$AppErrorCopyWith<$Res> get error;

}
/// @nodoc
class __$LogoutStateErrorCopyWithImpl<$Res>
    implements _$LogoutStateErrorCopyWith<$Res> {
  __$LogoutStateErrorCopyWithImpl(this._self, this._then);

  final _LogoutStateError _self;
  final $Res Function(_LogoutStateError) _then;

/// Create a copy of LogoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_LogoutStateError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppError,
  ));
}

/// Create a copy of LogoutState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppErrorCopyWith<$Res> get error {
  
  return $AppErrorCopyWith<$Res>(_self.error, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

// dart format on
