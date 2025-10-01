// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hazards_provider_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HazardsProviderState {
  /// The temporary search parameters that are being modified by the user.
  HazardSearchParams get tempSearchParams;

  /// The actual search parameters used to fetch hazards.
  HazardSearchParams get searchParams;

  /// The list of hazards fetched based on [searchParams] after [getHazardsState] is successful.
  List<Hazard> get hazards;

  /// The state of the get hazards operation.
  GetHazardsState get getHazardsState;

  /// Create a copy of HazardsProviderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HazardsProviderStateCopyWith<HazardsProviderState> get copyWith =>
      _$HazardsProviderStateCopyWithImpl<HazardsProviderState>(
          this as HazardsProviderState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HazardsProviderState &&
            (identical(other.tempSearchParams, tempSearchParams) ||
                other.tempSearchParams == tempSearchParams) &&
            (identical(other.searchParams, searchParams) ||
                other.searchParams == searchParams) &&
            const DeepCollectionEquality().equals(other.hazards, hazards) &&
            (identical(other.getHazardsState, getHazardsState) ||
                other.getHazardsState == getHazardsState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tempSearchParams, searchParams,
      const DeepCollectionEquality().hash(hazards), getHazardsState);

  @override
  String toString() {
    return 'HazardsProviderState(tempSearchParams: $tempSearchParams, searchParams: $searchParams, hazards: $hazards, getHazardsState: $getHazardsState)';
  }
}

/// @nodoc
abstract mixin class $HazardsProviderStateCopyWith<$Res> {
  factory $HazardsProviderStateCopyWith(HazardsProviderState value,
          $Res Function(HazardsProviderState) _then) =
      _$HazardsProviderStateCopyWithImpl;
  @useResult
  $Res call(
      {HazardSearchParams tempSearchParams,
      HazardSearchParams searchParams,
      List<Hazard> hazards,
      GetHazardsState getHazardsState});

  $HazardSearchParamsCopyWith<$Res> get tempSearchParams;
  $HazardSearchParamsCopyWith<$Res> get searchParams;
  $GetHazardsStateCopyWith<$Res> get getHazardsState;
}

/// @nodoc
class _$HazardsProviderStateCopyWithImpl<$Res>
    implements $HazardsProviderStateCopyWith<$Res> {
  _$HazardsProviderStateCopyWithImpl(this._self, this._then);

  final HazardsProviderState _self;
  final $Res Function(HazardsProviderState) _then;

  /// Create a copy of HazardsProviderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tempSearchParams = null,
    Object? searchParams = null,
    Object? hazards = null,
    Object? getHazardsState = null,
  }) {
    return _then(_self.copyWith(
      tempSearchParams: null == tempSearchParams
          ? _self.tempSearchParams
          : tempSearchParams // ignore: cast_nullable_to_non_nullable
              as HazardSearchParams,
      searchParams: null == searchParams
          ? _self.searchParams
          : searchParams // ignore: cast_nullable_to_non_nullable
              as HazardSearchParams,
      hazards: null == hazards
          ? _self.hazards
          : hazards // ignore: cast_nullable_to_non_nullable
              as List<Hazard>,
      getHazardsState: null == getHazardsState
          ? _self.getHazardsState
          : getHazardsState // ignore: cast_nullable_to_non_nullable
              as GetHazardsState,
    ));
  }

  /// Create a copy of HazardsProviderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HazardSearchParamsCopyWith<$Res> get tempSearchParams {
    return $HazardSearchParamsCopyWith<$Res>(_self.tempSearchParams, (value) {
      return _then(_self.copyWith(tempSearchParams: value));
    });
  }

  /// Create a copy of HazardsProviderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HazardSearchParamsCopyWith<$Res> get searchParams {
    return $HazardSearchParamsCopyWith<$Res>(_self.searchParams, (value) {
      return _then(_self.copyWith(searchParams: value));
    });
  }

  /// Create a copy of HazardsProviderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GetHazardsStateCopyWith<$Res> get getHazardsState {
    return $GetHazardsStateCopyWith<$Res>(_self.getHazardsState, (value) {
      return _then(_self.copyWith(getHazardsState: value));
    });
  }
}

/// Adds pattern-matching-related methods to [HazardsProviderState].
extension HazardsProviderStatePatterns on HazardsProviderState {
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
    TResult Function(_HazardsProviderState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HazardsProviderState() when $default != null:
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
    TResult Function(_HazardsProviderState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HazardsProviderState():
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
    TResult? Function(_HazardsProviderState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HazardsProviderState() when $default != null:
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
    TResult Function(
            HazardSearchParams tempSearchParams,
            HazardSearchParams searchParams,
            List<Hazard> hazards,
            GetHazardsState getHazardsState)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HazardsProviderState() when $default != null:
        return $default(_that.tempSearchParams, _that.searchParams,
            _that.hazards, _that.getHazardsState);
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
    TResult Function(
            HazardSearchParams tempSearchParams,
            HazardSearchParams searchParams,
            List<Hazard> hazards,
            GetHazardsState getHazardsState)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HazardsProviderState():
        return $default(_that.tempSearchParams, _that.searchParams,
            _that.hazards, _that.getHazardsState);
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
    TResult? Function(
            HazardSearchParams tempSearchParams,
            HazardSearchParams searchParams,
            List<Hazard> hazards,
            GetHazardsState getHazardsState)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HazardsProviderState() when $default != null:
        return $default(_that.tempSearchParams, _that.searchParams,
            _that.hazards, _that.getHazardsState);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _HazardsProviderState implements HazardsProviderState {
  const _HazardsProviderState(
      {this.tempSearchParams = const HazardSearchParams(),
      this.searchParams = const HazardSearchParams(),
      final List<Hazard> hazards = const <Hazard>[],
      this.getHazardsState = const GetHazardsState.initial()})
      : _hazards = hazards;

  /// The temporary search parameters that are being modified by the user.
  @override
  @JsonKey()
  final HazardSearchParams tempSearchParams;

  /// The actual search parameters used to fetch hazards.
  @override
  @JsonKey()
  final HazardSearchParams searchParams;

  /// The list of hazards fetched based on [searchParams] after [getHazardsState] is successful.
  final List<Hazard> _hazards;

  /// The list of hazards fetched based on [searchParams] after [getHazardsState] is successful.
  @override
  @JsonKey()
  List<Hazard> get hazards {
    if (_hazards is EqualUnmodifiableListView) return _hazards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hazards);
  }

  /// The state of the get hazards operation.
  @override
  @JsonKey()
  final GetHazardsState getHazardsState;

  /// Create a copy of HazardsProviderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HazardsProviderStateCopyWith<_HazardsProviderState> get copyWith =>
      __$HazardsProviderStateCopyWithImpl<_HazardsProviderState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HazardsProviderState &&
            (identical(other.tempSearchParams, tempSearchParams) ||
                other.tempSearchParams == tempSearchParams) &&
            (identical(other.searchParams, searchParams) ||
                other.searchParams == searchParams) &&
            const DeepCollectionEquality().equals(other._hazards, _hazards) &&
            (identical(other.getHazardsState, getHazardsState) ||
                other.getHazardsState == getHazardsState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tempSearchParams, searchParams,
      const DeepCollectionEquality().hash(_hazards), getHazardsState);

  @override
  String toString() {
    return 'HazardsProviderState(tempSearchParams: $tempSearchParams, searchParams: $searchParams, hazards: $hazards, getHazardsState: $getHazardsState)';
  }
}

/// @nodoc
abstract mixin class _$HazardsProviderStateCopyWith<$Res>
    implements $HazardsProviderStateCopyWith<$Res> {
  factory _$HazardsProviderStateCopyWith(_HazardsProviderState value,
          $Res Function(_HazardsProviderState) _then) =
      __$HazardsProviderStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {HazardSearchParams tempSearchParams,
      HazardSearchParams searchParams,
      List<Hazard> hazards,
      GetHazardsState getHazardsState});

  @override
  $HazardSearchParamsCopyWith<$Res> get tempSearchParams;
  @override
  $HazardSearchParamsCopyWith<$Res> get searchParams;
  @override
  $GetHazardsStateCopyWith<$Res> get getHazardsState;
}

/// @nodoc
class __$HazardsProviderStateCopyWithImpl<$Res>
    implements _$HazardsProviderStateCopyWith<$Res> {
  __$HazardsProviderStateCopyWithImpl(this._self, this._then);

  final _HazardsProviderState _self;
  final $Res Function(_HazardsProviderState) _then;

  /// Create a copy of HazardsProviderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tempSearchParams = null,
    Object? searchParams = null,
    Object? hazards = null,
    Object? getHazardsState = null,
  }) {
    return _then(_HazardsProviderState(
      tempSearchParams: null == tempSearchParams
          ? _self.tempSearchParams
          : tempSearchParams // ignore: cast_nullable_to_non_nullable
              as HazardSearchParams,
      searchParams: null == searchParams
          ? _self.searchParams
          : searchParams // ignore: cast_nullable_to_non_nullable
              as HazardSearchParams,
      hazards: null == hazards
          ? _self._hazards
          : hazards // ignore: cast_nullable_to_non_nullable
              as List<Hazard>,
      getHazardsState: null == getHazardsState
          ? _self.getHazardsState
          : getHazardsState // ignore: cast_nullable_to_non_nullable
              as GetHazardsState,
    ));
  }

  /// Create a copy of HazardsProviderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HazardSearchParamsCopyWith<$Res> get tempSearchParams {
    return $HazardSearchParamsCopyWith<$Res>(_self.tempSearchParams, (value) {
      return _then(_self.copyWith(tempSearchParams: value));
    });
  }

  /// Create a copy of HazardsProviderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HazardSearchParamsCopyWith<$Res> get searchParams {
    return $HazardSearchParamsCopyWith<$Res>(_self.searchParams, (value) {
      return _then(_self.copyWith(searchParams: value));
    });
  }

  /// Create a copy of HazardsProviderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GetHazardsStateCopyWith<$Res> get getHazardsState {
    return $GetHazardsStateCopyWith<$Res>(_self.getHazardsState, (value) {
      return _then(_self.copyWith(getHazardsState: value));
    });
  }
}

/// @nodoc
mixin _$GetHazardsState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GetHazardsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GetHazardsState()';
  }
}

/// @nodoc
class $GetHazardsStateCopyWith<$Res> {
  $GetHazardsStateCopyWith(
      GetHazardsState _, $Res Function(GetHazardsState) __);
}

/// Adds pattern-matching-related methods to [GetHazardsState].
extension GetHazardsStatePatterns on GetHazardsState {
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
    TResult Function(GetHazardsStateInitial value)? initial,
    TResult Function(GetHazardsStateLoading value)? loading,
    TResult Function(GetHazardsStateSuccess value)? success,
    TResult Function(GetHazardsStateError value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case GetHazardsStateInitial() when initial != null:
        return initial(_that);
      case GetHazardsStateLoading() when loading != null:
        return loading(_that);
      case GetHazardsStateSuccess() when success != null:
        return success(_that);
      case GetHazardsStateError() when error != null:
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
    required TResult Function(GetHazardsStateInitial value) initial,
    required TResult Function(GetHazardsStateLoading value) loading,
    required TResult Function(GetHazardsStateSuccess value) success,
    required TResult Function(GetHazardsStateError value) error,
  }) {
    final _that = this;
    switch (_that) {
      case GetHazardsStateInitial():
        return initial(_that);
      case GetHazardsStateLoading():
        return loading(_that);
      case GetHazardsStateSuccess():
        return success(_that);
      case GetHazardsStateError():
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
    TResult? Function(GetHazardsStateInitial value)? initial,
    TResult? Function(GetHazardsStateLoading value)? loading,
    TResult? Function(GetHazardsStateSuccess value)? success,
    TResult? Function(GetHazardsStateError value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case GetHazardsStateInitial() when initial != null:
        return initial(_that);
      case GetHazardsStateLoading() when loading != null:
        return loading(_that);
      case GetHazardsStateSuccess() when success != null:
        return success(_that);
      case GetHazardsStateError() when error != null:
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
    TResult Function(List<Hazard> hazards)? success,
    TResult Function(AppError error)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case GetHazardsStateInitial() when initial != null:
        return initial();
      case GetHazardsStateLoading() when loading != null:
        return loading();
      case GetHazardsStateSuccess() when success != null:
        return success(_that.hazards);
      case GetHazardsStateError() when error != null:
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
    required TResult Function(List<Hazard> hazards) success,
    required TResult Function(AppError error) error,
  }) {
    final _that = this;
    switch (_that) {
      case GetHazardsStateInitial():
        return initial();
      case GetHazardsStateLoading():
        return loading();
      case GetHazardsStateSuccess():
        return success(_that.hazards);
      case GetHazardsStateError():
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
    TResult? Function(List<Hazard> hazards)? success,
    TResult? Function(AppError error)? error,
  }) {
    final _that = this;
    switch (_that) {
      case GetHazardsStateInitial() when initial != null:
        return initial();
      case GetHazardsStateLoading() when loading != null:
        return loading();
      case GetHazardsStateSuccess() when success != null:
        return success(_that.hazards);
      case GetHazardsStateError() when error != null:
        return error(_that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class GetHazardsStateInitial implements GetHazardsState {
  const GetHazardsStateInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GetHazardsStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GetHazardsState.initial()';
  }
}

/// @nodoc

class GetHazardsStateLoading implements GetHazardsState {
  const GetHazardsStateLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GetHazardsStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GetHazardsState.loading()';
  }
}

/// @nodoc

class GetHazardsStateSuccess implements GetHazardsState {
  const GetHazardsStateSuccess(final List<Hazard> hazards) : _hazards = hazards;

  final List<Hazard> _hazards;
  List<Hazard> get hazards {
    if (_hazards is EqualUnmodifiableListView) return _hazards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hazards);
  }

  /// Create a copy of GetHazardsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetHazardsStateSuccessCopyWith<GetHazardsStateSuccess> get copyWith =>
      _$GetHazardsStateSuccessCopyWithImpl<GetHazardsStateSuccess>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetHazardsStateSuccess &&
            const DeepCollectionEquality().equals(other._hazards, _hazards));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_hazards));

  @override
  String toString() {
    return 'GetHazardsState.success(hazards: $hazards)';
  }
}

/// @nodoc
abstract mixin class $GetHazardsStateSuccessCopyWith<$Res>
    implements $GetHazardsStateCopyWith<$Res> {
  factory $GetHazardsStateSuccessCopyWith(GetHazardsStateSuccess value,
          $Res Function(GetHazardsStateSuccess) _then) =
      _$GetHazardsStateSuccessCopyWithImpl;
  @useResult
  $Res call({List<Hazard> hazards});
}

/// @nodoc
class _$GetHazardsStateSuccessCopyWithImpl<$Res>
    implements $GetHazardsStateSuccessCopyWith<$Res> {
  _$GetHazardsStateSuccessCopyWithImpl(this._self, this._then);

  final GetHazardsStateSuccess _self;
  final $Res Function(GetHazardsStateSuccess) _then;

  /// Create a copy of GetHazardsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? hazards = null,
  }) {
    return _then(GetHazardsStateSuccess(
      null == hazards
          ? _self._hazards
          : hazards // ignore: cast_nullable_to_non_nullable
              as List<Hazard>,
    ));
  }
}

/// @nodoc

class GetHazardsStateError implements GetHazardsState {
  const GetHazardsStateError(this.error);

  final AppError error;

  /// Create a copy of GetHazardsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetHazardsStateErrorCopyWith<GetHazardsStateError> get copyWith =>
      _$GetHazardsStateErrorCopyWithImpl<GetHazardsStateError>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetHazardsStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'GetHazardsState.error(error: $error)';
  }
}

/// @nodoc
abstract mixin class $GetHazardsStateErrorCopyWith<$Res>
    implements $GetHazardsStateCopyWith<$Res> {
  factory $GetHazardsStateErrorCopyWith(GetHazardsStateError value,
          $Res Function(GetHazardsStateError) _then) =
      _$GetHazardsStateErrorCopyWithImpl;
  @useResult
  $Res call({AppError error});

  $AppErrorCopyWith<$Res> get error;
}

/// @nodoc
class _$GetHazardsStateErrorCopyWithImpl<$Res>
    implements $GetHazardsStateErrorCopyWith<$Res> {
  _$GetHazardsStateErrorCopyWithImpl(this._self, this._then);

  final GetHazardsStateError _self;
  final $Res Function(GetHazardsStateError) _then;

  /// Create a copy of GetHazardsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(GetHazardsStateError(
      null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppError,
    ));
  }

  /// Create a copy of GetHazardsState
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
