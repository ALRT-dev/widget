// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_provider_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeProviderState {

/// The state of sending push notification token to the server
 SendPushNotificationTokenState get sendPushNotificationTokenState;
/// Create a copy of HomeProviderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeProviderStateCopyWith<HomeProviderState> get copyWith => _$HomeProviderStateCopyWithImpl<HomeProviderState>(this as HomeProviderState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeProviderState&&(identical(other.sendPushNotificationTokenState, sendPushNotificationTokenState) || other.sendPushNotificationTokenState == sendPushNotificationTokenState));
}


@override
int get hashCode => Object.hash(runtimeType,sendPushNotificationTokenState);

@override
String toString() {
  return 'HomeProviderState(sendPushNotificationTokenState: $sendPushNotificationTokenState)';
}


}

/// @nodoc
abstract mixin class $HomeProviderStateCopyWith<$Res>  {
  factory $HomeProviderStateCopyWith(HomeProviderState value, $Res Function(HomeProviderState) _then) = _$HomeProviderStateCopyWithImpl;
@useResult
$Res call({
 SendPushNotificationTokenState sendPushNotificationTokenState
});


$SendPushNotificationTokenStateCopyWith<$Res> get sendPushNotificationTokenState;

}
/// @nodoc
class _$HomeProviderStateCopyWithImpl<$Res>
    implements $HomeProviderStateCopyWith<$Res> {
  _$HomeProviderStateCopyWithImpl(this._self, this._then);

  final HomeProviderState _self;
  final $Res Function(HomeProviderState) _then;

/// Create a copy of HomeProviderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sendPushNotificationTokenState = null,}) {
  return _then(_self.copyWith(
sendPushNotificationTokenState: null == sendPushNotificationTokenState ? _self.sendPushNotificationTokenState : sendPushNotificationTokenState // ignore: cast_nullable_to_non_nullable
as SendPushNotificationTokenState,
  ));
}
/// Create a copy of HomeProviderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SendPushNotificationTokenStateCopyWith<$Res> get sendPushNotificationTokenState {
  
  return $SendPushNotificationTokenStateCopyWith<$Res>(_self.sendPushNotificationTokenState, (value) {
    return _then(_self.copyWith(sendPushNotificationTokenState: value));
  });
}
}


/// Adds pattern-matching-related methods to [HomeProviderState].
extension HomeProviderStatePatterns on HomeProviderState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeProviderState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeProviderState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeProviderState value)  $default,){
final _that = this;
switch (_that) {
case _HomeProviderState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeProviderState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeProviderState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SendPushNotificationTokenState sendPushNotificationTokenState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeProviderState() when $default != null:
return $default(_that.sendPushNotificationTokenState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SendPushNotificationTokenState sendPushNotificationTokenState)  $default,) {final _that = this;
switch (_that) {
case _HomeProviderState():
return $default(_that.sendPushNotificationTokenState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SendPushNotificationTokenState sendPushNotificationTokenState)?  $default,) {final _that = this;
switch (_that) {
case _HomeProviderState() when $default != null:
return $default(_that.sendPushNotificationTokenState);case _:
  return null;

}
}

}

/// @nodoc


class _HomeProviderState implements HomeProviderState {
  const _HomeProviderState({this.sendPushNotificationTokenState = const SendPushNotificationTokenState.initial()});
  

/// The state of sending push notification token to the server
@override@JsonKey() final  SendPushNotificationTokenState sendPushNotificationTokenState;

/// Create a copy of HomeProviderState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeProviderStateCopyWith<_HomeProviderState> get copyWith => __$HomeProviderStateCopyWithImpl<_HomeProviderState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeProviderState&&(identical(other.sendPushNotificationTokenState, sendPushNotificationTokenState) || other.sendPushNotificationTokenState == sendPushNotificationTokenState));
}


@override
int get hashCode => Object.hash(runtimeType,sendPushNotificationTokenState);

@override
String toString() {
  return 'HomeProviderState(sendPushNotificationTokenState: $sendPushNotificationTokenState)';
}


}

/// @nodoc
abstract mixin class _$HomeProviderStateCopyWith<$Res> implements $HomeProviderStateCopyWith<$Res> {
  factory _$HomeProviderStateCopyWith(_HomeProviderState value, $Res Function(_HomeProviderState) _then) = __$HomeProviderStateCopyWithImpl;
@override @useResult
$Res call({
 SendPushNotificationTokenState sendPushNotificationTokenState
});


@override $SendPushNotificationTokenStateCopyWith<$Res> get sendPushNotificationTokenState;

}
/// @nodoc
class __$HomeProviderStateCopyWithImpl<$Res>
    implements _$HomeProviderStateCopyWith<$Res> {
  __$HomeProviderStateCopyWithImpl(this._self, this._then);

  final _HomeProviderState _self;
  final $Res Function(_HomeProviderState) _then;

/// Create a copy of HomeProviderState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sendPushNotificationTokenState = null,}) {
  return _then(_HomeProviderState(
sendPushNotificationTokenState: null == sendPushNotificationTokenState ? _self.sendPushNotificationTokenState : sendPushNotificationTokenState // ignore: cast_nullable_to_non_nullable
as SendPushNotificationTokenState,
  ));
}

/// Create a copy of HomeProviderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SendPushNotificationTokenStateCopyWith<$Res> get sendPushNotificationTokenState {
  
  return $SendPushNotificationTokenStateCopyWith<$Res>(_self.sendPushNotificationTokenState, (value) {
    return _then(_self.copyWith(sendPushNotificationTokenState: value));
  });
}
}

/// @nodoc
mixin _$SendPushNotificationTokenState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendPushNotificationTokenState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SendPushNotificationTokenState()';
}


}

/// @nodoc
class $SendPushNotificationTokenStateCopyWith<$Res>  {
$SendPushNotificationTokenStateCopyWith(SendPushNotificationTokenState _, $Res Function(SendPushNotificationTokenState) __);
}


/// Adds pattern-matching-related methods to [SendPushNotificationTokenState].
extension SendPushNotificationTokenStatePatterns on SendPushNotificationTokenState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _SendPushNotificationTokenStateInitial value)?  initial,TResult Function( _SendPushNotificationTokenStateLoading value)?  loading,TResult Function( _SendPushNotificationTokenStateSuccess value)?  success,TResult Function( _SendPushNotificationTokenStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SendPushNotificationTokenStateInitial() when initial != null:
return initial(_that);case _SendPushNotificationTokenStateLoading() when loading != null:
return loading(_that);case _SendPushNotificationTokenStateSuccess() when success != null:
return success(_that);case _SendPushNotificationTokenStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _SendPushNotificationTokenStateInitial value)  initial,required TResult Function( _SendPushNotificationTokenStateLoading value)  loading,required TResult Function( _SendPushNotificationTokenStateSuccess value)  success,required TResult Function( _SendPushNotificationTokenStateError value)  error,}){
final _that = this;
switch (_that) {
case _SendPushNotificationTokenStateInitial():
return initial(_that);case _SendPushNotificationTokenStateLoading():
return loading(_that);case _SendPushNotificationTokenStateSuccess():
return success(_that);case _SendPushNotificationTokenStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _SendPushNotificationTokenStateInitial value)?  initial,TResult? Function( _SendPushNotificationTokenStateLoading value)?  loading,TResult? Function( _SendPushNotificationTokenStateSuccess value)?  success,TResult? Function( _SendPushNotificationTokenStateError value)?  error,}){
final _that = this;
switch (_that) {
case _SendPushNotificationTokenStateInitial() when initial != null:
return initial(_that);case _SendPushNotificationTokenStateLoading() when loading != null:
return loading(_that);case _SendPushNotificationTokenStateSuccess() when success != null:
return success(_that);case _SendPushNotificationTokenStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String token)?  success,TResult Function( AppError error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SendPushNotificationTokenStateInitial() when initial != null:
return initial();case _SendPushNotificationTokenStateLoading() when loading != null:
return loading();case _SendPushNotificationTokenStateSuccess() when success != null:
return success(_that.token);case _SendPushNotificationTokenStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String token)  success,required TResult Function( AppError error)  error,}) {final _that = this;
switch (_that) {
case _SendPushNotificationTokenStateInitial():
return initial();case _SendPushNotificationTokenStateLoading():
return loading();case _SendPushNotificationTokenStateSuccess():
return success(_that.token);case _SendPushNotificationTokenStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String token)?  success,TResult? Function( AppError error)?  error,}) {final _that = this;
switch (_that) {
case _SendPushNotificationTokenStateInitial() when initial != null:
return initial();case _SendPushNotificationTokenStateLoading() when loading != null:
return loading();case _SendPushNotificationTokenStateSuccess() when success != null:
return success(_that.token);case _SendPushNotificationTokenStateError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _SendPushNotificationTokenStateInitial implements SendPushNotificationTokenState {
  const _SendPushNotificationTokenStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendPushNotificationTokenStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SendPushNotificationTokenState.initial()';
}


}




/// @nodoc


class _SendPushNotificationTokenStateLoading implements SendPushNotificationTokenState {
  const _SendPushNotificationTokenStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendPushNotificationTokenStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SendPushNotificationTokenState.loading()';
}


}




/// @nodoc


class _SendPushNotificationTokenStateSuccess implements SendPushNotificationTokenState {
  const _SendPushNotificationTokenStateSuccess(this.token);
  

 final  String token;

/// Create a copy of SendPushNotificationTokenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendPushNotificationTokenStateSuccessCopyWith<_SendPushNotificationTokenStateSuccess> get copyWith => __$SendPushNotificationTokenStateSuccessCopyWithImpl<_SendPushNotificationTokenStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendPushNotificationTokenStateSuccess&&(identical(other.token, token) || other.token == token));
}


@override
int get hashCode => Object.hash(runtimeType,token);

@override
String toString() {
  return 'SendPushNotificationTokenState.success(token: $token)';
}


}

/// @nodoc
abstract mixin class _$SendPushNotificationTokenStateSuccessCopyWith<$Res> implements $SendPushNotificationTokenStateCopyWith<$Res> {
  factory _$SendPushNotificationTokenStateSuccessCopyWith(_SendPushNotificationTokenStateSuccess value, $Res Function(_SendPushNotificationTokenStateSuccess) _then) = __$SendPushNotificationTokenStateSuccessCopyWithImpl;
@useResult
$Res call({
 String token
});




}
/// @nodoc
class __$SendPushNotificationTokenStateSuccessCopyWithImpl<$Res>
    implements _$SendPushNotificationTokenStateSuccessCopyWith<$Res> {
  __$SendPushNotificationTokenStateSuccessCopyWithImpl(this._self, this._then);

  final _SendPushNotificationTokenStateSuccess _self;
  final $Res Function(_SendPushNotificationTokenStateSuccess) _then;

/// Create a copy of SendPushNotificationTokenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? token = null,}) {
  return _then(_SendPushNotificationTokenStateSuccess(
null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SendPushNotificationTokenStateError implements SendPushNotificationTokenState {
  const _SendPushNotificationTokenStateError(this.error);
  

 final  AppError error;

/// Create a copy of SendPushNotificationTokenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendPushNotificationTokenStateErrorCopyWith<_SendPushNotificationTokenStateError> get copyWith => __$SendPushNotificationTokenStateErrorCopyWithImpl<_SendPushNotificationTokenStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendPushNotificationTokenStateError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'SendPushNotificationTokenState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class _$SendPushNotificationTokenStateErrorCopyWith<$Res> implements $SendPushNotificationTokenStateCopyWith<$Res> {
  factory _$SendPushNotificationTokenStateErrorCopyWith(_SendPushNotificationTokenStateError value, $Res Function(_SendPushNotificationTokenStateError) _then) = __$SendPushNotificationTokenStateErrorCopyWithImpl;
@useResult
$Res call({
 AppError error
});


$AppErrorCopyWith<$Res> get error;

}
/// @nodoc
class __$SendPushNotificationTokenStateErrorCopyWithImpl<$Res>
    implements _$SendPushNotificationTokenStateErrorCopyWith<$Res> {
  __$SendPushNotificationTokenStateErrorCopyWithImpl(this._self, this._then);

  final _SendPushNotificationTokenStateError _self;
  final $Res Function(_SendPushNotificationTokenStateError) _then;

/// Create a copy of SendPushNotificationTokenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_SendPushNotificationTokenStateError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppError,
  ));
}

/// Create a copy of SendPushNotificationTokenState
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
