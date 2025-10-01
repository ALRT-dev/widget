// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_permission_provider_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocationProviderState {
  /// Current user's location.
  AlrtLocation? get location;

  /// The state of getting the current user's location.
  GetLocationState get getLocationState;

  /// The state of getting the location permission of the device.
  GetLocationPremissionState get getLocationPremissionState;

  /// Create a copy of LocationProviderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LocationProviderStateCopyWith<LocationProviderState> get copyWith =>
      _$LocationProviderStateCopyWithImpl<LocationProviderState>(
          this as LocationProviderState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LocationProviderState &&
            const DeepCollectionEquality().equals(other.location, location) &&
            (identical(other.getLocationState, getLocationState) ||
                other.getLocationState == getLocationState) &&
            (identical(other.getLocationPremissionState,
                    getLocationPremissionState) ||
                other.getLocationPremissionState ==
                    getLocationPremissionState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(location),
      getLocationState,
      getLocationPremissionState);

  @override
  String toString() {
    return 'LocationProviderState(location: $location, getLocationState: $getLocationState, getLocationPremissionState: $getLocationPremissionState)';
  }
}

/// @nodoc
abstract mixin class $LocationProviderStateCopyWith<$Res> {
  factory $LocationProviderStateCopyWith(LocationProviderState value,
          $Res Function(LocationProviderState) _then) =
      _$LocationProviderStateCopyWithImpl;
  @useResult
  $Res call(
      {AlrtLocation? location,
      GetLocationState getLocationState,
      GetLocationPremissionState getLocationPremissionState});

  $GetLocationStateCopyWith<$Res> get getLocationState;
  $GetLocationPremissionStateCopyWith<$Res> get getLocationPremissionState;
}

/// @nodoc
class _$LocationProviderStateCopyWithImpl<$Res>
    implements $LocationProviderStateCopyWith<$Res> {
  _$LocationProviderStateCopyWithImpl(this._self, this._then);

  final LocationProviderState _self;
  final $Res Function(LocationProviderState) _then;

  /// Create a copy of LocationProviderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = freezed,
    Object? getLocationState = null,
    Object? getLocationPremissionState = null,
  }) {
    return _then(_self.copyWith(
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as AlrtLocation?,
      getLocationState: null == getLocationState
          ? _self.getLocationState
          : getLocationState // ignore: cast_nullable_to_non_nullable
              as GetLocationState,
      getLocationPremissionState: null == getLocationPremissionState
          ? _self.getLocationPremissionState
          : getLocationPremissionState // ignore: cast_nullable_to_non_nullable
              as GetLocationPremissionState,
    ));
  }

  /// Create a copy of LocationProviderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GetLocationStateCopyWith<$Res> get getLocationState {
    return $GetLocationStateCopyWith<$Res>(_self.getLocationState, (value) {
      return _then(_self.copyWith(getLocationState: value));
    });
  }

  /// Create a copy of LocationProviderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GetLocationPremissionStateCopyWith<$Res> get getLocationPremissionState {
    return $GetLocationPremissionStateCopyWith<$Res>(
        _self.getLocationPremissionState, (value) {
      return _then(_self.copyWith(getLocationPremissionState: value));
    });
  }
}

/// Adds pattern-matching-related methods to [LocationProviderState].
extension LocationProviderStatePatterns on LocationProviderState {
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
    TResult Function(_LocationProviderState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocationProviderState() when $default != null:
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
    TResult Function(_LocationProviderState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationProviderState():
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
    TResult? Function(_LocationProviderState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationProviderState() when $default != null:
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
    TResult Function(AlrtLocation? location, GetLocationState getLocationState,
            GetLocationPremissionState getLocationPremissionState)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocationProviderState() when $default != null:
        return $default(_that.location, _that.getLocationState,
            _that.getLocationPremissionState);
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
    TResult Function(AlrtLocation? location, GetLocationState getLocationState,
            GetLocationPremissionState getLocationPremissionState)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationProviderState():
        return $default(_that.location, _that.getLocationState,
            _that.getLocationPremissionState);
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
    TResult? Function(AlrtLocation? location, GetLocationState getLocationState,
            GetLocationPremissionState getLocationPremissionState)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationProviderState() when $default != null:
        return $default(_that.location, _that.getLocationState,
            _that.getLocationPremissionState);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LocationProviderState implements LocationProviderState {
  const _LocationProviderState(
      {this.location,
      this.getLocationState = const GetLocationState.initial(),
      this.getLocationPremissionState =
          const GetLocationPremissionState.initial()});

  /// Current user's location.
  @override
  final AlrtLocation? location;

  /// The state of getting the current user's location.
  @override
  @JsonKey()
  final GetLocationState getLocationState;

  /// The state of getting the location permission of the device.
  @override
  @JsonKey()
  final GetLocationPremissionState getLocationPremissionState;

  /// Create a copy of LocationProviderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LocationProviderStateCopyWith<_LocationProviderState> get copyWith =>
      __$LocationProviderStateCopyWithImpl<_LocationProviderState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocationProviderState &&
            const DeepCollectionEquality().equals(other.location, location) &&
            (identical(other.getLocationState, getLocationState) ||
                other.getLocationState == getLocationState) &&
            (identical(other.getLocationPremissionState,
                    getLocationPremissionState) ||
                other.getLocationPremissionState ==
                    getLocationPremissionState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(location),
      getLocationState,
      getLocationPremissionState);

  @override
  String toString() {
    return 'LocationProviderState(location: $location, getLocationState: $getLocationState, getLocationPremissionState: $getLocationPremissionState)';
  }
}

/// @nodoc
abstract mixin class _$LocationProviderStateCopyWith<$Res>
    implements $LocationProviderStateCopyWith<$Res> {
  factory _$LocationProviderStateCopyWith(_LocationProviderState value,
          $Res Function(_LocationProviderState) _then) =
      __$LocationProviderStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {AlrtLocation? location,
      GetLocationState getLocationState,
      GetLocationPremissionState getLocationPremissionState});

  @override
  $GetLocationStateCopyWith<$Res> get getLocationState;
  @override
  $GetLocationPremissionStateCopyWith<$Res> get getLocationPremissionState;
}

/// @nodoc
class __$LocationProviderStateCopyWithImpl<$Res>
    implements _$LocationProviderStateCopyWith<$Res> {
  __$LocationProviderStateCopyWithImpl(this._self, this._then);

  final _LocationProviderState _self;
  final $Res Function(_LocationProviderState) _then;

  /// Create a copy of LocationProviderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? location = freezed,
    Object? getLocationState = null,
    Object? getLocationPremissionState = null,
  }) {
    return _then(_LocationProviderState(
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as AlrtLocation?,
      getLocationState: null == getLocationState
          ? _self.getLocationState
          : getLocationState // ignore: cast_nullable_to_non_nullable
              as GetLocationState,
      getLocationPremissionState: null == getLocationPremissionState
          ? _self.getLocationPremissionState
          : getLocationPremissionState // ignore: cast_nullable_to_non_nullable
              as GetLocationPremissionState,
    ));
  }

  /// Create a copy of LocationProviderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GetLocationStateCopyWith<$Res> get getLocationState {
    return $GetLocationStateCopyWith<$Res>(_self.getLocationState, (value) {
      return _then(_self.copyWith(getLocationState: value));
    });
  }

  /// Create a copy of LocationProviderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GetLocationPremissionStateCopyWith<$Res> get getLocationPremissionState {
    return $GetLocationPremissionStateCopyWith<$Res>(
        _self.getLocationPremissionState, (value) {
      return _then(_self.copyWith(getLocationPremissionState: value));
    });
  }
}

/// @nodoc
mixin _$GetLocationState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GetLocationState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GetLocationState()';
  }
}

/// @nodoc
class $GetLocationStateCopyWith<$Res> {
  $GetLocationStateCopyWith(
      GetLocationState _, $Res Function(GetLocationState) __);
}

/// Adds pattern-matching-related methods to [GetLocationState].
extension GetLocationStatePatterns on GetLocationState {
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
    TResult Function(GetLocationStateInitial value)? initial,
    TResult Function(GetLocationStateLoading value)? loading,
    TResult Function(GetLocationStateSuccess value)? success,
    TResult Function(GetLocationStateError value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case GetLocationStateInitial() when initial != null:
        return initial(_that);
      case GetLocationStateLoading() when loading != null:
        return loading(_that);
      case GetLocationStateSuccess() when success != null:
        return success(_that);
      case GetLocationStateError() when error != null:
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
    required TResult Function(GetLocationStateInitial value) initial,
    required TResult Function(GetLocationStateLoading value) loading,
    required TResult Function(GetLocationStateSuccess value) success,
    required TResult Function(GetLocationStateError value) error,
  }) {
    final _that = this;
    switch (_that) {
      case GetLocationStateInitial():
        return initial(_that);
      case GetLocationStateLoading():
        return loading(_that);
      case GetLocationStateSuccess():
        return success(_that);
      case GetLocationStateError():
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
    TResult? Function(GetLocationStateInitial value)? initial,
    TResult? Function(GetLocationStateLoading value)? loading,
    TResult? Function(GetLocationStateSuccess value)? success,
    TResult? Function(GetLocationStateError value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case GetLocationStateInitial() when initial != null:
        return initial(_that);
      case GetLocationStateLoading() when loading != null:
        return loading(_that);
      case GetLocationStateSuccess() when success != null:
        return success(_that);
      case GetLocationStateError() when error != null:
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
    TResult Function(AlrtLocation location)? success,
    TResult Function(AppError error)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case GetLocationStateInitial() when initial != null:
        return initial();
      case GetLocationStateLoading() when loading != null:
        return loading();
      case GetLocationStateSuccess() when success != null:
        return success(_that.location);
      case GetLocationStateError() when error != null:
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
    required TResult Function(AlrtLocation location) success,
    required TResult Function(AppError error) error,
  }) {
    final _that = this;
    switch (_that) {
      case GetLocationStateInitial():
        return initial();
      case GetLocationStateLoading():
        return loading();
      case GetLocationStateSuccess():
        return success(_that.location);
      case GetLocationStateError():
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
    TResult? Function(AlrtLocation location)? success,
    TResult? Function(AppError error)? error,
  }) {
    final _that = this;
    switch (_that) {
      case GetLocationStateInitial() when initial != null:
        return initial();
      case GetLocationStateLoading() when loading != null:
        return loading();
      case GetLocationStateSuccess() when success != null:
        return success(_that.location);
      case GetLocationStateError() when error != null:
        return error(_that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class GetLocationStateInitial implements GetLocationState {
  const GetLocationStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GetLocationStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GetLocationState.initial()';
  }
}

/// @nodoc

class GetLocationStateLoading implements GetLocationState {
  const GetLocationStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GetLocationStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GetLocationState.loading()';
  }
}

/// @nodoc

class GetLocationStateSuccess implements GetLocationState {
  const GetLocationStateSuccess(this.location);

  final AlrtLocation location;

  /// Create a copy of GetLocationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetLocationStateSuccessCopyWith<GetLocationStateSuccess> get copyWith =>
      _$GetLocationStateSuccessCopyWithImpl<GetLocationStateSuccess>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetLocationStateSuccess &&
            const DeepCollectionEquality().equals(other.location, location));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(location));

  @override
  String toString() {
    return 'GetLocationState.success(location: $location)';
  }
}

/// @nodoc
abstract mixin class $GetLocationStateSuccessCopyWith<$Res>
    implements $GetLocationStateCopyWith<$Res> {
  factory $GetLocationStateSuccessCopyWith(GetLocationStateSuccess value,
          $Res Function(GetLocationStateSuccess) _then) =
      _$GetLocationStateSuccessCopyWithImpl;
  @useResult
  $Res call({AlrtLocation location});
}

/// @nodoc
class _$GetLocationStateSuccessCopyWithImpl<$Res>
    implements $GetLocationStateSuccessCopyWith<$Res> {
  _$GetLocationStateSuccessCopyWithImpl(this._self, this._then);

  final GetLocationStateSuccess _self;
  final $Res Function(GetLocationStateSuccess) _then;

  /// Create a copy of GetLocationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? location = freezed,
  }) {
    return _then(GetLocationStateSuccess(
      freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as AlrtLocation,
    ));
  }
}

/// @nodoc

class GetLocationStateError implements GetLocationState {
  const GetLocationStateError(this.error);

  final AppError error;

  /// Create a copy of GetLocationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetLocationStateErrorCopyWith<GetLocationStateError> get copyWith =>
      _$GetLocationStateErrorCopyWithImpl<GetLocationStateError>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetLocationStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'GetLocationState.error(error: $error)';
  }
}

/// @nodoc
abstract mixin class $GetLocationStateErrorCopyWith<$Res>
    implements $GetLocationStateCopyWith<$Res> {
  factory $GetLocationStateErrorCopyWith(GetLocationStateError value,
          $Res Function(GetLocationStateError) _then) =
      _$GetLocationStateErrorCopyWithImpl;
  @useResult
  $Res call({AppError error});

  $AppErrorCopyWith<$Res> get error;
}

/// @nodoc
class _$GetLocationStateErrorCopyWithImpl<$Res>
    implements $GetLocationStateErrorCopyWith<$Res> {
  _$GetLocationStateErrorCopyWithImpl(this._self, this._then);

  final GetLocationStateError _self;
  final $Res Function(GetLocationStateError) _then;

  /// Create a copy of GetLocationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(GetLocationStateError(
      null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppError,
    ));
  }

  /// Create a copy of GetLocationState
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
mixin _$GetLocationPremissionState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetLocationPremissionState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GetLocationPremissionState()';
  }
}

/// @nodoc
class $GetLocationPremissionStateCopyWith<$Res> {
  $GetLocationPremissionStateCopyWith(GetLocationPremissionState _,
      $Res Function(GetLocationPremissionState) __);
}

/// Adds pattern-matching-related methods to [GetLocationPremissionState].
extension GetLocationPremissionStatePatterns on GetLocationPremissionState {
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
    TResult Function(GetLocationPremissionStateInitial value)? initial,
    TResult Function(GetLocationPremissionStateLoading value)? loading,
    TResult Function(GetLocationPremissionStateSuccess value)? success,
    TResult Function(GetLocationPremissionStateError value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case GetLocationPremissionStateInitial() when initial != null:
        return initial(_that);
      case GetLocationPremissionStateLoading() when loading != null:
        return loading(_that);
      case GetLocationPremissionStateSuccess() when success != null:
        return success(_that);
      case GetLocationPremissionStateError() when error != null:
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
    required TResult Function(GetLocationPremissionStateInitial value) initial,
    required TResult Function(GetLocationPremissionStateLoading value) loading,
    required TResult Function(GetLocationPremissionStateSuccess value) success,
    required TResult Function(GetLocationPremissionStateError value) error,
  }) {
    final _that = this;
    switch (_that) {
      case GetLocationPremissionStateInitial():
        return initial(_that);
      case GetLocationPremissionStateLoading():
        return loading(_that);
      case GetLocationPremissionStateSuccess():
        return success(_that);
      case GetLocationPremissionStateError():
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
    TResult? Function(GetLocationPremissionStateInitial value)? initial,
    TResult? Function(GetLocationPremissionStateLoading value)? loading,
    TResult? Function(GetLocationPremissionStateSuccess value)? success,
    TResult? Function(GetLocationPremissionStateError value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case GetLocationPremissionStateInitial() when initial != null:
        return initial(_that);
      case GetLocationPremissionStateLoading() when loading != null:
        return loading(_that);
      case GetLocationPremissionStateSuccess() when success != null:
        return success(_that);
      case GetLocationPremissionStateError() when error != null:
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
      case GetLocationPremissionStateInitial() when initial != null:
        return initial();
      case GetLocationPremissionStateLoading() when loading != null:
        return loading();
      case GetLocationPremissionStateSuccess() when success != null:
        return success();
      case GetLocationPremissionStateError() when error != null:
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
      case GetLocationPremissionStateInitial():
        return initial();
      case GetLocationPremissionStateLoading():
        return loading();
      case GetLocationPremissionStateSuccess():
        return success();
      case GetLocationPremissionStateError():
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
      case GetLocationPremissionStateInitial() when initial != null:
        return initial();
      case GetLocationPremissionStateLoading() when loading != null:
        return loading();
      case GetLocationPremissionStateSuccess() when success != null:
        return success();
      case GetLocationPremissionStateError() when error != null:
        return error(_that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class GetLocationPremissionStateInitial implements GetLocationPremissionState {
  const GetLocationPremissionStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetLocationPremissionStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GetLocationPremissionState.initial()';
  }
}

/// @nodoc

class GetLocationPremissionStateLoading implements GetLocationPremissionState {
  const GetLocationPremissionStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetLocationPremissionStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GetLocationPremissionState.loading()';
  }
}

/// @nodoc

class GetLocationPremissionStateSuccess implements GetLocationPremissionState {
  const GetLocationPremissionStateSuccess();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetLocationPremissionStateSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GetLocationPremissionState.success()';
  }
}

/// @nodoc

class GetLocationPremissionStateError implements GetLocationPremissionState {
  const GetLocationPremissionStateError(this.error);

  final AppError error;

  /// Create a copy of GetLocationPremissionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetLocationPremissionStateErrorCopyWith<GetLocationPremissionStateError>
      get copyWith => _$GetLocationPremissionStateErrorCopyWithImpl<
          GetLocationPremissionStateError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetLocationPremissionStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'GetLocationPremissionState.error(error: $error)';
  }
}

/// @nodoc
abstract mixin class $GetLocationPremissionStateErrorCopyWith<$Res>
    implements $GetLocationPremissionStateCopyWith<$Res> {
  factory $GetLocationPremissionStateErrorCopyWith(
          GetLocationPremissionStateError value,
          $Res Function(GetLocationPremissionStateError) _then) =
      _$GetLocationPremissionStateErrorCopyWithImpl;
  @useResult
  $Res call({AppError error});

  $AppErrorCopyWith<$Res> get error;
}

/// @nodoc
class _$GetLocationPremissionStateErrorCopyWithImpl<$Res>
    implements $GetLocationPremissionStateErrorCopyWith<$Res> {
  _$GetLocationPremissionStateErrorCopyWithImpl(this._self, this._then);

  final GetLocationPremissionStateError _self;
  final $Res Function(GetLocationPremissionStateError) _then;

  /// Create a copy of GetLocationPremissionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(GetLocationPremissionStateError(
      null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppError,
    ));
  }

  /// Create a copy of GetLocationPremissionState
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
