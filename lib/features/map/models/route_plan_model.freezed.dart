// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_plan_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RoutePlan {
  /// Currently selected travel mode.
  TravelMode get selectedTravelMode;

  /// Map of travel modes to their corresponding route responses.
  Map<TravelMode, RoutesApiResponse> get travelModeRoutes;

  /// Whether navigation is currently active.
  bool get isNavigating;

  /// Create a copy of RoutePlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RoutePlanCopyWith<RoutePlan> get copyWith =>
      _$RoutePlanCopyWithImpl<RoutePlan>(this as RoutePlan, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RoutePlan &&
            (identical(other.selectedTravelMode, selectedTravelMode) ||
                other.selectedTravelMode == selectedTravelMode) &&
            const DeepCollectionEquality()
                .equals(other.travelModeRoutes, travelModeRoutes) &&
            (identical(other.isNavigating, isNavigating) ||
                other.isNavigating == isNavigating));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedTravelMode,
      const DeepCollectionEquality().hash(travelModeRoutes), isNavigating);

  @override
  String toString() {
    return 'RoutePlan(selectedTravelMode: $selectedTravelMode, travelModeRoutes: $travelModeRoutes, isNavigating: $isNavigating)';
  }
}

/// @nodoc
abstract mixin class $RoutePlanCopyWith<$Res> {
  factory $RoutePlanCopyWith(RoutePlan value, $Res Function(RoutePlan) _then) =
      _$RoutePlanCopyWithImpl;
  @useResult
  $Res call(
      {TravelMode selectedTravelMode,
      Map<TravelMode, RoutesApiResponse> travelModeRoutes,
      bool isNavigating});
}

/// @nodoc
class _$RoutePlanCopyWithImpl<$Res> implements $RoutePlanCopyWith<$Res> {
  _$RoutePlanCopyWithImpl(this._self, this._then);

  final RoutePlan _self;
  final $Res Function(RoutePlan) _then;

  /// Create a copy of RoutePlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedTravelMode = null,
    Object? travelModeRoutes = null,
    Object? isNavigating = null,
  }) {
    return _then(_self.copyWith(
      selectedTravelMode: null == selectedTravelMode
          ? _self.selectedTravelMode
          : selectedTravelMode // ignore: cast_nullable_to_non_nullable
              as TravelMode,
      travelModeRoutes: null == travelModeRoutes
          ? _self.travelModeRoutes
          : travelModeRoutes // ignore: cast_nullable_to_non_nullable
              as Map<TravelMode, RoutesApiResponse>,
      isNavigating: null == isNavigating
          ? _self.isNavigating
          : isNavigating // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [RoutePlan].
extension RoutePlanPatterns on RoutePlan {
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
    TResult Function(_RoutePlan value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RoutePlan() when $default != null:
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
    TResult Function(_RoutePlan value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RoutePlan():
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
    TResult? Function(_RoutePlan value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RoutePlan() when $default != null:
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
            TravelMode selectedTravelMode,
            Map<TravelMode, RoutesApiResponse> travelModeRoutes,
            bool isNavigating)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RoutePlan() when $default != null:
        return $default(_that.selectedTravelMode, _that.travelModeRoutes,
            _that.isNavigating);
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
            TravelMode selectedTravelMode,
            Map<TravelMode, RoutesApiResponse> travelModeRoutes,
            bool isNavigating)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RoutePlan():
        return $default(_that.selectedTravelMode, _that.travelModeRoutes,
            _that.isNavigating);
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
            TravelMode selectedTravelMode,
            Map<TravelMode, RoutesApiResponse> travelModeRoutes,
            bool isNavigating)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RoutePlan() when $default != null:
        return $default(_that.selectedTravelMode, _that.travelModeRoutes,
            _that.isNavigating);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RoutePlan extends RoutePlan {
  const _RoutePlan(
      {this.selectedTravelMode = TravelMode.driving,
      final Map<TravelMode, RoutesApiResponse> travelModeRoutes =
          const <TravelMode, RoutesApiResponse>{},
      this.isNavigating = false})
      : _travelModeRoutes = travelModeRoutes,
        super._();

  /// Currently selected travel mode.
  @override
  @JsonKey()
  final TravelMode selectedTravelMode;

  /// Map of travel modes to their corresponding route responses.
  final Map<TravelMode, RoutesApiResponse> _travelModeRoutes;

  /// Map of travel modes to their corresponding route responses.
  @override
  @JsonKey()
  Map<TravelMode, RoutesApiResponse> get travelModeRoutes {
    if (_travelModeRoutes is EqualUnmodifiableMapView) return _travelModeRoutes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_travelModeRoutes);
  }

  /// Whether navigation is currently active.
  @override
  @JsonKey()
  final bool isNavigating;

  /// Create a copy of RoutePlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RoutePlanCopyWith<_RoutePlan> get copyWith =>
      __$RoutePlanCopyWithImpl<_RoutePlan>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RoutePlan &&
            (identical(other.selectedTravelMode, selectedTravelMode) ||
                other.selectedTravelMode == selectedTravelMode) &&
            const DeepCollectionEquality()
                .equals(other._travelModeRoutes, _travelModeRoutes) &&
            (identical(other.isNavigating, isNavigating) ||
                other.isNavigating == isNavigating));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedTravelMode,
      const DeepCollectionEquality().hash(_travelModeRoutes), isNavigating);

  @override
  String toString() {
    return 'RoutePlan(selectedTravelMode: $selectedTravelMode, travelModeRoutes: $travelModeRoutes, isNavigating: $isNavigating)';
  }
}

/// @nodoc
abstract mixin class _$RoutePlanCopyWith<$Res>
    implements $RoutePlanCopyWith<$Res> {
  factory _$RoutePlanCopyWith(
          _RoutePlan value, $Res Function(_RoutePlan) _then) =
      __$RoutePlanCopyWithImpl;
  @override
  @useResult
  $Res call(
      {TravelMode selectedTravelMode,
      Map<TravelMode, RoutesApiResponse> travelModeRoutes,
      bool isNavigating});
}

/// @nodoc
class __$RoutePlanCopyWithImpl<$Res> implements _$RoutePlanCopyWith<$Res> {
  __$RoutePlanCopyWithImpl(this._self, this._then);

  final _RoutePlan _self;
  final $Res Function(_RoutePlan) _then;

  /// Create a copy of RoutePlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? selectedTravelMode = null,
    Object? travelModeRoutes = null,
    Object? isNavigating = null,
  }) {
    return _then(_RoutePlan(
      selectedTravelMode: null == selectedTravelMode
          ? _self.selectedTravelMode
          : selectedTravelMode // ignore: cast_nullable_to_non_nullable
              as TravelMode,
      travelModeRoutes: null == travelModeRoutes
          ? _self._travelModeRoutes
          : travelModeRoutes // ignore: cast_nullable_to_non_nullable
              as Map<TravelMode, RoutesApiResponse>,
      isNavigating: null == isNavigating
          ? _self.isNavigating
          : isNavigating // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
