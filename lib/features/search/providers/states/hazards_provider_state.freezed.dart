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

  /// The list of hazards fetched based on [searchParams].
  List<Hazard> get hazards;

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
            const DeepCollectionEquality().equals(other.hazards, hazards));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tempSearchParams, searchParams,
      const DeepCollectionEquality().hash(hazards));

  @override
  String toString() {
    return 'HazardsProviderState(tempSearchParams: $tempSearchParams, searchParams: $searchParams, hazards: $hazards)';
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
      List<Hazard> hazards});

  $HazardSearchParamsCopyWith<$Res> get tempSearchParams;
  $HazardSearchParamsCopyWith<$Res> get searchParams;
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
    TResult Function(HazardSearchParams tempSearchParams,
            HazardSearchParams searchParams, List<Hazard> hazards)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HazardsProviderState() when $default != null:
        return $default(
            _that.tempSearchParams, _that.searchParams, _that.hazards);
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
    TResult Function(HazardSearchParams tempSearchParams,
            HazardSearchParams searchParams, List<Hazard> hazards)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HazardsProviderState():
        return $default(
            _that.tempSearchParams, _that.searchParams, _that.hazards);
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
    TResult? Function(HazardSearchParams tempSearchParams,
            HazardSearchParams searchParams, List<Hazard> hazards)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HazardsProviderState() when $default != null:
        return $default(
            _that.tempSearchParams, _that.searchParams, _that.hazards);
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
      final List<Hazard> hazards = const <Hazard>[]})
      : _hazards = hazards;

  /// The temporary search parameters that are being modified by the user.
  @override
  @JsonKey()
  final HazardSearchParams tempSearchParams;

  /// The actual search parameters used to fetch hazards.
  @override
  @JsonKey()
  final HazardSearchParams searchParams;

  /// The list of hazards fetched based on [searchParams].
  final List<Hazard> _hazards;

  /// The list of hazards fetched based on [searchParams].
  @override
  @JsonKey()
  List<Hazard> get hazards {
    if (_hazards is EqualUnmodifiableListView) return _hazards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hazards);
  }

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
            const DeepCollectionEquality().equals(other._hazards, _hazards));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tempSearchParams, searchParams,
      const DeepCollectionEquality().hash(_hazards));

  @override
  String toString() {
    return 'HazardsProviderState(tempSearchParams: $tempSearchParams, searchParams: $searchParams, hazards: $hazards)';
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
      List<Hazard> hazards});

  @override
  $HazardSearchParamsCopyWith<$Res> get tempSearchParams;
  @override
  $HazardSearchParamsCopyWith<$Res> get searchParams;
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
}

// dart format on
