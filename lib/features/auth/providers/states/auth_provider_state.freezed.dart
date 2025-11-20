// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_provider_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthProviderState {

/// The state of signing in with Google.
 SignInWithGoogleState get signInWithGoogleState;/// The state of signing in with Apple.
 SignInWithAppleState get signInWithAppleState;
/// Create a copy of AuthProviderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthProviderStateCopyWith<AuthProviderState> get copyWith => _$AuthProviderStateCopyWithImpl<AuthProviderState>(this as AuthProviderState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthProviderState&&(identical(other.signInWithGoogleState, signInWithGoogleState) || other.signInWithGoogleState == signInWithGoogleState)&&(identical(other.signInWithAppleState, signInWithAppleState) || other.signInWithAppleState == signInWithAppleState));
}


@override
int get hashCode => Object.hash(runtimeType,signInWithGoogleState,signInWithAppleState);

@override
String toString() {
  return 'AuthProviderState(signInWithGoogleState: $signInWithGoogleState, signInWithAppleState: $signInWithAppleState)';
}


}

/// @nodoc
abstract mixin class $AuthProviderStateCopyWith<$Res>  {
  factory $AuthProviderStateCopyWith(AuthProviderState value, $Res Function(AuthProviderState) _then) = _$AuthProviderStateCopyWithImpl;
@useResult
$Res call({
 SignInWithGoogleState signInWithGoogleState, SignInWithAppleState signInWithAppleState
});


$SignInWithGoogleStateCopyWith<$Res> get signInWithGoogleState;$SignInWithAppleStateCopyWith<$Res> get signInWithAppleState;

}
/// @nodoc
class _$AuthProviderStateCopyWithImpl<$Res>
    implements $AuthProviderStateCopyWith<$Res> {
  _$AuthProviderStateCopyWithImpl(this._self, this._then);

  final AuthProviderState _self;
  final $Res Function(AuthProviderState) _then;

/// Create a copy of AuthProviderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? signInWithGoogleState = null,Object? signInWithAppleState = null,}) {
  return _then(_self.copyWith(
signInWithGoogleState: null == signInWithGoogleState ? _self.signInWithGoogleState : signInWithGoogleState // ignore: cast_nullable_to_non_nullable
as SignInWithGoogleState,signInWithAppleState: null == signInWithAppleState ? _self.signInWithAppleState : signInWithAppleState // ignore: cast_nullable_to_non_nullable
as SignInWithAppleState,
  ));
}
/// Create a copy of AuthProviderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SignInWithGoogleStateCopyWith<$Res> get signInWithGoogleState {
  
  return $SignInWithGoogleStateCopyWith<$Res>(_self.signInWithGoogleState, (value) {
    return _then(_self.copyWith(signInWithGoogleState: value));
  });
}/// Create a copy of AuthProviderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SignInWithAppleStateCopyWith<$Res> get signInWithAppleState {
  
  return $SignInWithAppleStateCopyWith<$Res>(_self.signInWithAppleState, (value) {
    return _then(_self.copyWith(signInWithAppleState: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuthProviderState].
extension AuthProviderStatePatterns on AuthProviderState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthProviderState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthProviderState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthProviderState value)  $default,){
final _that = this;
switch (_that) {
case _AuthProviderState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthProviderState value)?  $default,){
final _that = this;
switch (_that) {
case _AuthProviderState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SignInWithGoogleState signInWithGoogleState,  SignInWithAppleState signInWithAppleState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthProviderState() when $default != null:
return $default(_that.signInWithGoogleState,_that.signInWithAppleState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SignInWithGoogleState signInWithGoogleState,  SignInWithAppleState signInWithAppleState)  $default,) {final _that = this;
switch (_that) {
case _AuthProviderState():
return $default(_that.signInWithGoogleState,_that.signInWithAppleState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SignInWithGoogleState signInWithGoogleState,  SignInWithAppleState signInWithAppleState)?  $default,) {final _that = this;
switch (_that) {
case _AuthProviderState() when $default != null:
return $default(_that.signInWithGoogleState,_that.signInWithAppleState);case _:
  return null;

}
}

}

/// @nodoc


class _AuthProviderState implements AuthProviderState {
  const _AuthProviderState({this.signInWithGoogleState = const SignInWithGoogleState.initial(), this.signInWithAppleState = const SignInWithAppleState.initial()});
  

/// The state of signing in with Google.
@override@JsonKey() final  SignInWithGoogleState signInWithGoogleState;
/// The state of signing in with Apple.
@override@JsonKey() final  SignInWithAppleState signInWithAppleState;

/// Create a copy of AuthProviderState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthProviderStateCopyWith<_AuthProviderState> get copyWith => __$AuthProviderStateCopyWithImpl<_AuthProviderState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthProviderState&&(identical(other.signInWithGoogleState, signInWithGoogleState) || other.signInWithGoogleState == signInWithGoogleState)&&(identical(other.signInWithAppleState, signInWithAppleState) || other.signInWithAppleState == signInWithAppleState));
}


@override
int get hashCode => Object.hash(runtimeType,signInWithGoogleState,signInWithAppleState);

@override
String toString() {
  return 'AuthProviderState(signInWithGoogleState: $signInWithGoogleState, signInWithAppleState: $signInWithAppleState)';
}


}

/// @nodoc
abstract mixin class _$AuthProviderStateCopyWith<$Res> implements $AuthProviderStateCopyWith<$Res> {
  factory _$AuthProviderStateCopyWith(_AuthProviderState value, $Res Function(_AuthProviderState) _then) = __$AuthProviderStateCopyWithImpl;
@override @useResult
$Res call({
 SignInWithGoogleState signInWithGoogleState, SignInWithAppleState signInWithAppleState
});


@override $SignInWithGoogleStateCopyWith<$Res> get signInWithGoogleState;@override $SignInWithAppleStateCopyWith<$Res> get signInWithAppleState;

}
/// @nodoc
class __$AuthProviderStateCopyWithImpl<$Res>
    implements _$AuthProviderStateCopyWith<$Res> {
  __$AuthProviderStateCopyWithImpl(this._self, this._then);

  final _AuthProviderState _self;
  final $Res Function(_AuthProviderState) _then;

/// Create a copy of AuthProviderState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? signInWithGoogleState = null,Object? signInWithAppleState = null,}) {
  return _then(_AuthProviderState(
signInWithGoogleState: null == signInWithGoogleState ? _self.signInWithGoogleState : signInWithGoogleState // ignore: cast_nullable_to_non_nullable
as SignInWithGoogleState,signInWithAppleState: null == signInWithAppleState ? _self.signInWithAppleState : signInWithAppleState // ignore: cast_nullable_to_non_nullable
as SignInWithAppleState,
  ));
}

/// Create a copy of AuthProviderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SignInWithGoogleStateCopyWith<$Res> get signInWithGoogleState {
  
  return $SignInWithGoogleStateCopyWith<$Res>(_self.signInWithGoogleState, (value) {
    return _then(_self.copyWith(signInWithGoogleState: value));
  });
}/// Create a copy of AuthProviderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SignInWithAppleStateCopyWith<$Res> get signInWithAppleState {
  
  return $SignInWithAppleStateCopyWith<$Res>(_self.signInWithAppleState, (value) {
    return _then(_self.copyWith(signInWithAppleState: value));
  });
}
}

/// @nodoc
mixin _$SignInWithGoogleState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInWithGoogleState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignInWithGoogleState()';
}


}

/// @nodoc
class $SignInWithGoogleStateCopyWith<$Res>  {
$SignInWithGoogleStateCopyWith(SignInWithGoogleState _, $Res Function(SignInWithGoogleState) __);
}


/// Adds pattern-matching-related methods to [SignInWithGoogleState].
extension SignInWithGoogleStatePatterns on SignInWithGoogleState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SignInWithGoogleStateInitial value)?  initial,TResult Function( SignInWithGoogleStateLoading value)?  loading,TResult Function( SignInWithGoogleStateSuccess value)?  success,TResult Function( SignInWithGoogleStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SignInWithGoogleStateInitial() when initial != null:
return initial(_that);case SignInWithGoogleStateLoading() when loading != null:
return loading(_that);case SignInWithGoogleStateSuccess() when success != null:
return success(_that);case SignInWithGoogleStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SignInWithGoogleStateInitial value)  initial,required TResult Function( SignInWithGoogleStateLoading value)  loading,required TResult Function( SignInWithGoogleStateSuccess value)  success,required TResult Function( SignInWithGoogleStateError value)  error,}){
final _that = this;
switch (_that) {
case SignInWithGoogleStateInitial():
return initial(_that);case SignInWithGoogleStateLoading():
return loading(_that);case SignInWithGoogleStateSuccess():
return success(_that);case SignInWithGoogleStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SignInWithGoogleStateInitial value)?  initial,TResult? Function( SignInWithGoogleStateLoading value)?  loading,TResult? Function( SignInWithGoogleStateSuccess value)?  success,TResult? Function( SignInWithGoogleStateError value)?  error,}){
final _that = this;
switch (_that) {
case SignInWithGoogleStateInitial() when initial != null:
return initial(_that);case SignInWithGoogleStateLoading() when loading != null:
return loading(_that);case SignInWithGoogleStateSuccess() when success != null:
return success(_that);case SignInWithGoogleStateError() when error != null:
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
case SignInWithGoogleStateInitial() when initial != null:
return initial();case SignInWithGoogleStateLoading() when loading != null:
return loading();case SignInWithGoogleStateSuccess() when success != null:
return success();case SignInWithGoogleStateError() when error != null:
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
case SignInWithGoogleStateInitial():
return initial();case SignInWithGoogleStateLoading():
return loading();case SignInWithGoogleStateSuccess():
return success();case SignInWithGoogleStateError():
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
case SignInWithGoogleStateInitial() when initial != null:
return initial();case SignInWithGoogleStateLoading() when loading != null:
return loading();case SignInWithGoogleStateSuccess() when success != null:
return success();case SignInWithGoogleStateError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class SignInWithGoogleStateInitial implements SignInWithGoogleState {
  const SignInWithGoogleStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInWithGoogleStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignInWithGoogleState.initial()';
}


}




/// @nodoc


class SignInWithGoogleStateLoading implements SignInWithGoogleState {
  const SignInWithGoogleStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInWithGoogleStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignInWithGoogleState.loading()';
}


}




/// @nodoc


class SignInWithGoogleStateSuccess implements SignInWithGoogleState {
  const SignInWithGoogleStateSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInWithGoogleStateSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignInWithGoogleState.success()';
}


}




/// @nodoc


class SignInWithGoogleStateError implements SignInWithGoogleState {
  const SignInWithGoogleStateError(this.error);
  

 final  AppError error;

/// Create a copy of SignInWithGoogleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignInWithGoogleStateErrorCopyWith<SignInWithGoogleStateError> get copyWith => _$SignInWithGoogleStateErrorCopyWithImpl<SignInWithGoogleStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInWithGoogleStateError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'SignInWithGoogleState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $SignInWithGoogleStateErrorCopyWith<$Res> implements $SignInWithGoogleStateCopyWith<$Res> {
  factory $SignInWithGoogleStateErrorCopyWith(SignInWithGoogleStateError value, $Res Function(SignInWithGoogleStateError) _then) = _$SignInWithGoogleStateErrorCopyWithImpl;
@useResult
$Res call({
 AppError error
});


$AppErrorCopyWith<$Res> get error;

}
/// @nodoc
class _$SignInWithGoogleStateErrorCopyWithImpl<$Res>
    implements $SignInWithGoogleStateErrorCopyWith<$Res> {
  _$SignInWithGoogleStateErrorCopyWithImpl(this._self, this._then);

  final SignInWithGoogleStateError _self;
  final $Res Function(SignInWithGoogleStateError) _then;

/// Create a copy of SignInWithGoogleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(SignInWithGoogleStateError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppError,
  ));
}

/// Create a copy of SignInWithGoogleState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppErrorCopyWith<$Res> get error {
  
  return $AppErrorCopyWith<$Res>(_self.error, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

/// @nodoc
mixin _$SignInWithAppleState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInWithAppleState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignInWithAppleState()';
}


}

/// @nodoc
class $SignInWithAppleStateCopyWith<$Res>  {
$SignInWithAppleStateCopyWith(SignInWithAppleState _, $Res Function(SignInWithAppleState) __);
}


/// Adds pattern-matching-related methods to [SignInWithAppleState].
extension SignInWithAppleStatePatterns on SignInWithAppleState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SignInWithAppleStateInitial value)?  initial,TResult Function( SignInWithAppleStateLoading value)?  loading,TResult Function( SignInWithAppleStateSuccess value)?  success,TResult Function( SignInWithAppleStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SignInWithAppleStateInitial() when initial != null:
return initial(_that);case SignInWithAppleStateLoading() when loading != null:
return loading(_that);case SignInWithAppleStateSuccess() when success != null:
return success(_that);case SignInWithAppleStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SignInWithAppleStateInitial value)  initial,required TResult Function( SignInWithAppleStateLoading value)  loading,required TResult Function( SignInWithAppleStateSuccess value)  success,required TResult Function( SignInWithAppleStateError value)  error,}){
final _that = this;
switch (_that) {
case SignInWithAppleStateInitial():
return initial(_that);case SignInWithAppleStateLoading():
return loading(_that);case SignInWithAppleStateSuccess():
return success(_that);case SignInWithAppleStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SignInWithAppleStateInitial value)?  initial,TResult? Function( SignInWithAppleStateLoading value)?  loading,TResult? Function( SignInWithAppleStateSuccess value)?  success,TResult? Function( SignInWithAppleStateError value)?  error,}){
final _that = this;
switch (_that) {
case SignInWithAppleStateInitial() when initial != null:
return initial(_that);case SignInWithAppleStateLoading() when loading != null:
return loading(_that);case SignInWithAppleStateSuccess() when success != null:
return success(_that);case SignInWithAppleStateError() when error != null:
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
case SignInWithAppleStateInitial() when initial != null:
return initial();case SignInWithAppleStateLoading() when loading != null:
return loading();case SignInWithAppleStateSuccess() when success != null:
return success();case SignInWithAppleStateError() when error != null:
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
case SignInWithAppleStateInitial():
return initial();case SignInWithAppleStateLoading():
return loading();case SignInWithAppleStateSuccess():
return success();case SignInWithAppleStateError():
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
case SignInWithAppleStateInitial() when initial != null:
return initial();case SignInWithAppleStateLoading() when loading != null:
return loading();case SignInWithAppleStateSuccess() when success != null:
return success();case SignInWithAppleStateError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class SignInWithAppleStateInitial implements SignInWithAppleState {
  const SignInWithAppleStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInWithAppleStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignInWithAppleState.initial()';
}


}




/// @nodoc


class SignInWithAppleStateLoading implements SignInWithAppleState {
  const SignInWithAppleStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInWithAppleStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignInWithAppleState.loading()';
}


}




/// @nodoc


class SignInWithAppleStateSuccess implements SignInWithAppleState {
  const SignInWithAppleStateSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInWithAppleStateSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignInWithAppleState.success()';
}


}




/// @nodoc


class SignInWithAppleStateError implements SignInWithAppleState {
  const SignInWithAppleStateError(this.error);
  

 final  AppError error;

/// Create a copy of SignInWithAppleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignInWithAppleStateErrorCopyWith<SignInWithAppleStateError> get copyWith => _$SignInWithAppleStateErrorCopyWithImpl<SignInWithAppleStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInWithAppleStateError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'SignInWithAppleState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $SignInWithAppleStateErrorCopyWith<$Res> implements $SignInWithAppleStateCopyWith<$Res> {
  factory $SignInWithAppleStateErrorCopyWith(SignInWithAppleStateError value, $Res Function(SignInWithAppleStateError) _then) = _$SignInWithAppleStateErrorCopyWithImpl;
@useResult
$Res call({
 AppError error
});


$AppErrorCopyWith<$Res> get error;

}
/// @nodoc
class _$SignInWithAppleStateErrorCopyWithImpl<$Res>
    implements $SignInWithAppleStateErrorCopyWith<$Res> {
  _$SignInWithAppleStateErrorCopyWithImpl(this._self, this._then);

  final SignInWithAppleStateError _self;
  final $Res Function(SignInWithAppleStateError) _then;

/// Create a copy of SignInWithAppleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(SignInWithAppleStateError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppError,
  ));
}

/// Create a copy of SignInWithAppleState
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
