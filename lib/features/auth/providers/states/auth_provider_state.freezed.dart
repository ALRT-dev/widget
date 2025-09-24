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
  SignInWithGoogleState get signInWithGoogleState;

  /// Create a copy of AuthProviderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthProviderStateCopyWith<AuthProviderState> get copyWith =>
      _$AuthProviderStateCopyWithImpl<AuthProviderState>(
          this as AuthProviderState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthProviderState &&
            (identical(other.signInWithGoogleState, signInWithGoogleState) ||
                other.signInWithGoogleState == signInWithGoogleState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, signInWithGoogleState);

  @override
  String toString() {
    return 'AuthProviderState(signInWithGoogleState: $signInWithGoogleState)';
  }
}

/// @nodoc
abstract mixin class $AuthProviderStateCopyWith<$Res> {
  factory $AuthProviderStateCopyWith(
          AuthProviderState value, $Res Function(AuthProviderState) _then) =
      _$AuthProviderStateCopyWithImpl;
  @useResult
  $Res call({SignInWithGoogleState signInWithGoogleState});

  $SignInWithGoogleStateCopyWith<$Res> get signInWithGoogleState;
}

/// @nodoc
class _$AuthProviderStateCopyWithImpl<$Res>
    implements $AuthProviderStateCopyWith<$Res> {
  _$AuthProviderStateCopyWithImpl(this._self, this._then);

  final AuthProviderState _self;
  final $Res Function(AuthProviderState) _then;

  /// Create a copy of AuthProviderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signInWithGoogleState = null,
  }) {
    return _then(_self.copyWith(
      signInWithGoogleState: null == signInWithGoogleState
          ? _self.signInWithGoogleState
          : signInWithGoogleState // ignore: cast_nullable_to_non_nullable
              as SignInWithGoogleState,
    ));
  }

  /// Create a copy of AuthProviderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SignInWithGoogleStateCopyWith<$Res> get signInWithGoogleState {
    return $SignInWithGoogleStateCopyWith<$Res>(_self.signInWithGoogleState,
        (value) {
      return _then(_self.copyWith(signInWithGoogleState: value));
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthProviderState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuthProviderState() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthProviderState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthProviderState():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthProviderState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthProviderState() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(SignInWithGoogleState signInWithGoogleState)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuthProviderState() when $default != null:
        return $default(_that.signInWithGoogleState);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(SignInWithGoogleState signInWithGoogleState) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthProviderState():
        return $default(_that.signInWithGoogleState);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(SignInWithGoogleState signInWithGoogleState)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthProviderState() when $default != null:
        return $default(_that.signInWithGoogleState);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AuthProviderState implements AuthProviderState {
  const _AuthProviderState(
      {this.signInWithGoogleState = const SignInWithGoogleState.initial()});

  /// The state of signing in with Google.
  @override
  @JsonKey()
  final SignInWithGoogleState signInWithGoogleState;

  /// Create a copy of AuthProviderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthProviderStateCopyWith<_AuthProviderState> get copyWith =>
      __$AuthProviderStateCopyWithImpl<_AuthProviderState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthProviderState &&
            (identical(other.signInWithGoogleState, signInWithGoogleState) ||
                other.signInWithGoogleState == signInWithGoogleState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, signInWithGoogleState);

  @override
  String toString() {
    return 'AuthProviderState(signInWithGoogleState: $signInWithGoogleState)';
  }
}

/// @nodoc
abstract mixin class _$AuthProviderStateCopyWith<$Res>
    implements $AuthProviderStateCopyWith<$Res> {
  factory _$AuthProviderStateCopyWith(
          _AuthProviderState value, $Res Function(_AuthProviderState) _then) =
      __$AuthProviderStateCopyWithImpl;
  @override
  @useResult
  $Res call({SignInWithGoogleState signInWithGoogleState});

  @override
  $SignInWithGoogleStateCopyWith<$Res> get signInWithGoogleState;
}

/// @nodoc
class __$AuthProviderStateCopyWithImpl<$Res>
    implements _$AuthProviderStateCopyWith<$Res> {
  __$AuthProviderStateCopyWithImpl(this._self, this._then);

  final _AuthProviderState _self;
  final $Res Function(_AuthProviderState) _then;

  /// Create a copy of AuthProviderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? signInWithGoogleState = null,
  }) {
    return _then(_AuthProviderState(
      signInWithGoogleState: null == signInWithGoogleState
          ? _self.signInWithGoogleState
          : signInWithGoogleState // ignore: cast_nullable_to_non_nullable
              as SignInWithGoogleState,
    ));
  }

  /// Create a copy of AuthProviderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SignInWithGoogleStateCopyWith<$Res> get signInWithGoogleState {
    return $SignInWithGoogleStateCopyWith<$Res>(_self.signInWithGoogleState,
        (value) {
      return _then(_self.copyWith(signInWithGoogleState: value));
    });
  }
}

/// @nodoc
mixin _$SignInWithGoogleState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SignInWithGoogleState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SignInWithGoogleState()';
  }
}

/// @nodoc
class $SignInWithGoogleStateCopyWith<$Res> {
  $SignInWithGoogleStateCopyWith(
      SignInWithGoogleState _, $Res Function(SignInWithGoogleState) __);
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInWithGoogleStateInitial value)? initial,
    TResult Function(SignInWithGoogleStateLoading value)? loading,
    TResult Function(SignInWithGoogleStateSuccess value)? success,
    TResult Function(SignInWithGoogleStateError value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case SignInWithGoogleStateInitial() when initial != null:
        return initial(_that);
      case SignInWithGoogleStateLoading() when loading != null:
        return loading(_that);
      case SignInWithGoogleStateSuccess() when success != null:
        return success(_that);
      case SignInWithGoogleStateError() when error != null:
        return error(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInWithGoogleStateInitial value) initial,
    required TResult Function(SignInWithGoogleStateLoading value) loading,
    required TResult Function(SignInWithGoogleStateSuccess value) success,
    required TResult Function(SignInWithGoogleStateError value) error,
  }) {
    final _that = this;
    switch (_that) {
      case SignInWithGoogleStateInitial():
        return initial(_that);
      case SignInWithGoogleStateLoading():
        return loading(_that);
      case SignInWithGoogleStateSuccess():
        return success(_that);
      case SignInWithGoogleStateError():
        return error(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInWithGoogleStateInitial value)? initial,
    TResult? Function(SignInWithGoogleStateLoading value)? loading,
    TResult? Function(SignInWithGoogleStateSuccess value)? success,
    TResult? Function(SignInWithGoogleStateError value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case SignInWithGoogleStateInitial() when initial != null:
        return initial(_that);
      case SignInWithGoogleStateLoading() when loading != null:
        return loading(_that);
      case SignInWithGoogleStateSuccess() when success != null:
        return success(_that);
      case SignInWithGoogleStateError() when error != null:
        return error(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(AppError error)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case SignInWithGoogleStateInitial() when initial != null:
        return initial();
      case SignInWithGoogleStateLoading() when loading != null:
        return loading();
      case SignInWithGoogleStateSuccess() when success != null:
        return success();
      case SignInWithGoogleStateError() when error != null:
        return error(_that.error);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(AppError error) error,
  }) {
    final _that = this;
    switch (_that) {
      case SignInWithGoogleStateInitial():
        return initial();
      case SignInWithGoogleStateLoading():
        return loading();
      case SignInWithGoogleStateSuccess():
        return success();
      case SignInWithGoogleStateError():
        return error(_that.error);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(AppError error)? error,
  }) {
    final _that = this;
    switch (_that) {
      case SignInWithGoogleStateInitial() when initial != null:
        return initial();
      case SignInWithGoogleStateLoading() when loading != null:
        return loading();
      case SignInWithGoogleStateSuccess() when success != null:
        return success();
      case SignInWithGoogleStateError() when error != null:
        return error(_that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class SignInWithGoogleStateInitial implements SignInWithGoogleState {
  const SignInWithGoogleStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignInWithGoogleStateInitial);
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
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignInWithGoogleStateLoading);
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
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignInWithGoogleStateSuccess);
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

  final AppError error;

  /// Create a copy of SignInWithGoogleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignInWithGoogleStateErrorCopyWith<SignInWithGoogleStateError>
      get copyWith =>
          _$SignInWithGoogleStateErrorCopyWithImpl<SignInWithGoogleStateError>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignInWithGoogleStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'SignInWithGoogleState.error(error: $error)';
  }
}

/// @nodoc
abstract mixin class $SignInWithGoogleStateErrorCopyWith<$Res>
    implements $SignInWithGoogleStateCopyWith<$Res> {
  factory $SignInWithGoogleStateErrorCopyWith(SignInWithGoogleStateError value,
          $Res Function(SignInWithGoogleStateError) _then) =
      _$SignInWithGoogleStateErrorCopyWithImpl;
  @useResult
  $Res call({AppError error});

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
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(SignInWithGoogleStateError(
      null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
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

// dart format on
