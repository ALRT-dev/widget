// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_provider_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MapProviderState {
  /// The current camera position of the map.
  CameraPosition get cameraPosition;

  /// The set of markers displayed on the map.
  Set<Marker> get markers;

  /// Create a copy of MapProviderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MapProviderStateCopyWith<MapProviderState> get copyWith =>
      _$MapProviderStateCopyWithImpl<MapProviderState>(
          this as MapProviderState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MapProviderState &&
            (identical(other.cameraPosition, cameraPosition) ||
                other.cameraPosition == cameraPosition) &&
            const DeepCollectionEquality().equals(other.markers, markers));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cameraPosition,
      const DeepCollectionEquality().hash(markers));

  @override
  String toString() {
    return 'MapProviderState(cameraPosition: $cameraPosition, markers: $markers)';
  }
}

/// @nodoc
abstract mixin class $MapProviderStateCopyWith<$Res> {
  factory $MapProviderStateCopyWith(
          MapProviderState value, $Res Function(MapProviderState) _then) =
      _$MapProviderStateCopyWithImpl;
  @useResult
  $Res call({CameraPosition cameraPosition, Set<Marker> markers});
}

/// @nodoc
class _$MapProviderStateCopyWithImpl<$Res>
    implements $MapProviderStateCopyWith<$Res> {
  _$MapProviderStateCopyWithImpl(this._self, this._then);

  final MapProviderState _self;
  final $Res Function(MapProviderState) _then;

  /// Create a copy of MapProviderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cameraPosition = null,
    Object? markers = null,
  }) {
    return _then(_self.copyWith(
      cameraPosition: null == cameraPosition
          ? _self.cameraPosition
          : cameraPosition // ignore: cast_nullable_to_non_nullable
              as CameraPosition,
      markers: null == markers
          ? _self.markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Set<Marker>,
    ));
  }
}

/// Adds pattern-matching-related methods to [MapProviderState].
extension MapProviderStatePatterns on MapProviderState {
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
    TResult Function(_MapProviderState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MapProviderState() when $default != null:
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
    TResult Function(_MapProviderState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MapProviderState():
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
    TResult? Function(_MapProviderState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MapProviderState() when $default != null:
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
    TResult Function(CameraPosition cameraPosition, Set<Marker> markers)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MapProviderState() when $default != null:
        return $default(_that.cameraPosition, _that.markers);
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
    TResult Function(CameraPosition cameraPosition, Set<Marker> markers)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MapProviderState():
        return $default(_that.cameraPosition, _that.markers);
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
    TResult? Function(CameraPosition cameraPosition, Set<Marker> markers)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MapProviderState() when $default != null:
        return $default(_that.cameraPosition, _that.markers);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MapProviderState implements MapProviderState {
  const _MapProviderState(
      {this.cameraPosition = kDefaultCameraPosition,
      final Set<Marker> markers = const <Marker>{}})
      : _markers = markers;

  /// The current camera position of the map.
  @override
  @JsonKey()
  final CameraPosition cameraPosition;

  /// The set of markers displayed on the map.
  final Set<Marker> _markers;

  /// The set of markers displayed on the map.
  @override
  @JsonKey()
  Set<Marker> get markers {
    if (_markers is EqualUnmodifiableSetView) return _markers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_markers);
  }

  /// Create a copy of MapProviderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MapProviderStateCopyWith<_MapProviderState> get copyWith =>
      __$MapProviderStateCopyWithImpl<_MapProviderState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MapProviderState &&
            (identical(other.cameraPosition, cameraPosition) ||
                other.cameraPosition == cameraPosition) &&
            const DeepCollectionEquality().equals(other._markers, _markers));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cameraPosition,
      const DeepCollectionEquality().hash(_markers));

  @override
  String toString() {
    return 'MapProviderState(cameraPosition: $cameraPosition, markers: $markers)';
  }
}

/// @nodoc
abstract mixin class _$MapProviderStateCopyWith<$Res>
    implements $MapProviderStateCopyWith<$Res> {
  factory _$MapProviderStateCopyWith(
          _MapProviderState value, $Res Function(_MapProviderState) _then) =
      __$MapProviderStateCopyWithImpl;
  @override
  @useResult
  $Res call({CameraPosition cameraPosition, Set<Marker> markers});
}

/// @nodoc
class __$MapProviderStateCopyWithImpl<$Res>
    implements _$MapProviderStateCopyWith<$Res> {
  __$MapProviderStateCopyWithImpl(this._self, this._then);

  final _MapProviderState _self;
  final $Res Function(_MapProviderState) _then;

  /// Create a copy of MapProviderState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? cameraPosition = null,
    Object? markers = null,
  }) {
    return _then(_MapProviderState(
      cameraPosition: null == cameraPosition
          ? _self.cameraPosition
          : cameraPosition // ignore: cast_nullable_to_non_nullable
              as CameraPosition,
      markers: null == markers
          ? _self._markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Set<Marker>,
    ));
  }
}

// dart format on
