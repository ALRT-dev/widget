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
 CameraPosition get cameraPosition;/// The set of markers displayed on the map.
 Set<Marker> get markers;/// The set of polylines displayed on the map.
 Set<Polyline> get polylines;/// The currently selected location on the map, if any.
 AlrtLocation? get selectedLocation;/// The current route plan, including travel mode and route responses.
 RoutePlan? get currentRoutePlan;/// The state of fetching route.
 GetRouteState get getRouteState;/// The state of fetching address from coordinates.
 GetAddressFromCoordinatesState get getAddressFromCoordinatesState;
/// Create a copy of MapProviderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapProviderStateCopyWith<MapProviderState> get copyWith => _$MapProviderStateCopyWithImpl<MapProviderState>(this as MapProviderState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapProviderState&&(identical(other.cameraPosition, cameraPosition) || other.cameraPosition == cameraPosition)&&const DeepCollectionEquality().equals(other.markers, markers)&&const DeepCollectionEquality().equals(other.polylines, polylines)&&(identical(other.selectedLocation, selectedLocation) || other.selectedLocation == selectedLocation)&&(identical(other.currentRoutePlan, currentRoutePlan) || other.currentRoutePlan == currentRoutePlan)&&(identical(other.getRouteState, getRouteState) || other.getRouteState == getRouteState)&&(identical(other.getAddressFromCoordinatesState, getAddressFromCoordinatesState) || other.getAddressFromCoordinatesState == getAddressFromCoordinatesState));
}


@override
int get hashCode => Object.hash(runtimeType,cameraPosition,const DeepCollectionEquality().hash(markers),const DeepCollectionEquality().hash(polylines),selectedLocation,currentRoutePlan,getRouteState,getAddressFromCoordinatesState);

@override
String toString() {
  return 'MapProviderState(cameraPosition: $cameraPosition, markers: $markers, polylines: $polylines, selectedLocation: $selectedLocation, currentRoutePlan: $currentRoutePlan, getRouteState: $getRouteState, getAddressFromCoordinatesState: $getAddressFromCoordinatesState)';
}


}

/// @nodoc
abstract mixin class $MapProviderStateCopyWith<$Res>  {
  factory $MapProviderStateCopyWith(MapProviderState value, $Res Function(MapProviderState) _then) = _$MapProviderStateCopyWithImpl;
@useResult
$Res call({
 CameraPosition cameraPosition, Set<Marker> markers, Set<Polyline> polylines, AlrtLocation? selectedLocation, RoutePlan? currentRoutePlan, GetRouteState getRouteState, GetAddressFromCoordinatesState getAddressFromCoordinatesState
});


$AlrtLocationCopyWith<$Res>? get selectedLocation;$RoutePlanCopyWith<$Res>? get currentRoutePlan;$GetRouteStateCopyWith<$Res> get getRouteState;$GetAddressFromCoordinatesStateCopyWith<$Res> get getAddressFromCoordinatesState;

}
/// @nodoc
class _$MapProviderStateCopyWithImpl<$Res>
    implements $MapProviderStateCopyWith<$Res> {
  _$MapProviderStateCopyWithImpl(this._self, this._then);

  final MapProviderState _self;
  final $Res Function(MapProviderState) _then;

/// Create a copy of MapProviderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cameraPosition = null,Object? markers = null,Object? polylines = null,Object? selectedLocation = freezed,Object? currentRoutePlan = freezed,Object? getRouteState = null,Object? getAddressFromCoordinatesState = null,}) {
  return _then(_self.copyWith(
cameraPosition: null == cameraPosition ? _self.cameraPosition : cameraPosition // ignore: cast_nullable_to_non_nullable
as CameraPosition,markers: null == markers ? _self.markers : markers // ignore: cast_nullable_to_non_nullable
as Set<Marker>,polylines: null == polylines ? _self.polylines : polylines // ignore: cast_nullable_to_non_nullable
as Set<Polyline>,selectedLocation: freezed == selectedLocation ? _self.selectedLocation : selectedLocation // ignore: cast_nullable_to_non_nullable
as AlrtLocation?,currentRoutePlan: freezed == currentRoutePlan ? _self.currentRoutePlan : currentRoutePlan // ignore: cast_nullable_to_non_nullable
as RoutePlan?,getRouteState: null == getRouteState ? _self.getRouteState : getRouteState // ignore: cast_nullable_to_non_nullable
as GetRouteState,getAddressFromCoordinatesState: null == getAddressFromCoordinatesState ? _self.getAddressFromCoordinatesState : getAddressFromCoordinatesState // ignore: cast_nullable_to_non_nullable
as GetAddressFromCoordinatesState,
  ));
}
/// Create a copy of MapProviderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AlrtLocationCopyWith<$Res>? get selectedLocation {
    if (_self.selectedLocation == null) {
    return null;
  }

  return $AlrtLocationCopyWith<$Res>(_self.selectedLocation!, (value) {
    return _then(_self.copyWith(selectedLocation: value));
  });
}/// Create a copy of MapProviderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoutePlanCopyWith<$Res>? get currentRoutePlan {
    if (_self.currentRoutePlan == null) {
    return null;
  }

  return $RoutePlanCopyWith<$Res>(_self.currentRoutePlan!, (value) {
    return _then(_self.copyWith(currentRoutePlan: value));
  });
}/// Create a copy of MapProviderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GetRouteStateCopyWith<$Res> get getRouteState {
  
  return $GetRouteStateCopyWith<$Res>(_self.getRouteState, (value) {
    return _then(_self.copyWith(getRouteState: value));
  });
}/// Create a copy of MapProviderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GetAddressFromCoordinatesStateCopyWith<$Res> get getAddressFromCoordinatesState {
  
  return $GetAddressFromCoordinatesStateCopyWith<$Res>(_self.getAddressFromCoordinatesState, (value) {
    return _then(_self.copyWith(getAddressFromCoordinatesState: value));
  });
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MapProviderState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MapProviderState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MapProviderState value)  $default,){
final _that = this;
switch (_that) {
case _MapProviderState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MapProviderState value)?  $default,){
final _that = this;
switch (_that) {
case _MapProviderState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CameraPosition cameraPosition,  Set<Marker> markers,  Set<Polyline> polylines,  AlrtLocation? selectedLocation,  RoutePlan? currentRoutePlan,  GetRouteState getRouteState,  GetAddressFromCoordinatesState getAddressFromCoordinatesState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapProviderState() when $default != null:
return $default(_that.cameraPosition,_that.markers,_that.polylines,_that.selectedLocation,_that.currentRoutePlan,_that.getRouteState,_that.getAddressFromCoordinatesState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CameraPosition cameraPosition,  Set<Marker> markers,  Set<Polyline> polylines,  AlrtLocation? selectedLocation,  RoutePlan? currentRoutePlan,  GetRouteState getRouteState,  GetAddressFromCoordinatesState getAddressFromCoordinatesState)  $default,) {final _that = this;
switch (_that) {
case _MapProviderState():
return $default(_that.cameraPosition,_that.markers,_that.polylines,_that.selectedLocation,_that.currentRoutePlan,_that.getRouteState,_that.getAddressFromCoordinatesState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CameraPosition cameraPosition,  Set<Marker> markers,  Set<Polyline> polylines,  AlrtLocation? selectedLocation,  RoutePlan? currentRoutePlan,  GetRouteState getRouteState,  GetAddressFromCoordinatesState getAddressFromCoordinatesState)?  $default,) {final _that = this;
switch (_that) {
case _MapProviderState() when $default != null:
return $default(_that.cameraPosition,_that.markers,_that.polylines,_that.selectedLocation,_that.currentRoutePlan,_that.getRouteState,_that.getAddressFromCoordinatesState);case _:
  return null;

}
}

}

/// @nodoc


class _MapProviderState implements MapProviderState {
  const _MapProviderState({this.cameraPosition = kDefaultCameraPosition, final  Set<Marker> markers = const <Marker>{}, final  Set<Polyline> polylines = const <Polyline>{}, this.selectedLocation, this.currentRoutePlan, this.getRouteState = const GetRouteState.initial(), this.getAddressFromCoordinatesState = const GetAddressFromCoordinatesState.initial()}): _markers = markers,_polylines = polylines;
  

/// The current camera position of the map.
@override@JsonKey() final  CameraPosition cameraPosition;
/// The set of markers displayed on the map.
 final  Set<Marker> _markers;
/// The set of markers displayed on the map.
@override@JsonKey() Set<Marker> get markers {
  if (_markers is EqualUnmodifiableSetView) return _markers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_markers);
}

/// The set of polylines displayed on the map.
 final  Set<Polyline> _polylines;
/// The set of polylines displayed on the map.
@override@JsonKey() Set<Polyline> get polylines {
  if (_polylines is EqualUnmodifiableSetView) return _polylines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_polylines);
}

/// The currently selected location on the map, if any.
@override final  AlrtLocation? selectedLocation;
/// The current route plan, including travel mode and route responses.
@override final  RoutePlan? currentRoutePlan;
/// The state of fetching route.
@override@JsonKey() final  GetRouteState getRouteState;
/// The state of fetching address from coordinates.
@override@JsonKey() final  GetAddressFromCoordinatesState getAddressFromCoordinatesState;

/// Create a copy of MapProviderState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapProviderStateCopyWith<_MapProviderState> get copyWith => __$MapProviderStateCopyWithImpl<_MapProviderState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapProviderState&&(identical(other.cameraPosition, cameraPosition) || other.cameraPosition == cameraPosition)&&const DeepCollectionEquality().equals(other._markers, _markers)&&const DeepCollectionEquality().equals(other._polylines, _polylines)&&(identical(other.selectedLocation, selectedLocation) || other.selectedLocation == selectedLocation)&&(identical(other.currentRoutePlan, currentRoutePlan) || other.currentRoutePlan == currentRoutePlan)&&(identical(other.getRouteState, getRouteState) || other.getRouteState == getRouteState)&&(identical(other.getAddressFromCoordinatesState, getAddressFromCoordinatesState) || other.getAddressFromCoordinatesState == getAddressFromCoordinatesState));
}


@override
int get hashCode => Object.hash(runtimeType,cameraPosition,const DeepCollectionEquality().hash(_markers),const DeepCollectionEquality().hash(_polylines),selectedLocation,currentRoutePlan,getRouteState,getAddressFromCoordinatesState);

@override
String toString() {
  return 'MapProviderState(cameraPosition: $cameraPosition, markers: $markers, polylines: $polylines, selectedLocation: $selectedLocation, currentRoutePlan: $currentRoutePlan, getRouteState: $getRouteState, getAddressFromCoordinatesState: $getAddressFromCoordinatesState)';
}


}

/// @nodoc
abstract mixin class _$MapProviderStateCopyWith<$Res> implements $MapProviderStateCopyWith<$Res> {
  factory _$MapProviderStateCopyWith(_MapProviderState value, $Res Function(_MapProviderState) _then) = __$MapProviderStateCopyWithImpl;
@override @useResult
$Res call({
 CameraPosition cameraPosition, Set<Marker> markers, Set<Polyline> polylines, AlrtLocation? selectedLocation, RoutePlan? currentRoutePlan, GetRouteState getRouteState, GetAddressFromCoordinatesState getAddressFromCoordinatesState
});


@override $AlrtLocationCopyWith<$Res>? get selectedLocation;@override $RoutePlanCopyWith<$Res>? get currentRoutePlan;@override $GetRouteStateCopyWith<$Res> get getRouteState;@override $GetAddressFromCoordinatesStateCopyWith<$Res> get getAddressFromCoordinatesState;

}
/// @nodoc
class __$MapProviderStateCopyWithImpl<$Res>
    implements _$MapProviderStateCopyWith<$Res> {
  __$MapProviderStateCopyWithImpl(this._self, this._then);

  final _MapProviderState _self;
  final $Res Function(_MapProviderState) _then;

/// Create a copy of MapProviderState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cameraPosition = null,Object? markers = null,Object? polylines = null,Object? selectedLocation = freezed,Object? currentRoutePlan = freezed,Object? getRouteState = null,Object? getAddressFromCoordinatesState = null,}) {
  return _then(_MapProviderState(
cameraPosition: null == cameraPosition ? _self.cameraPosition : cameraPosition // ignore: cast_nullable_to_non_nullable
as CameraPosition,markers: null == markers ? _self._markers : markers // ignore: cast_nullable_to_non_nullable
as Set<Marker>,polylines: null == polylines ? _self._polylines : polylines // ignore: cast_nullable_to_non_nullable
as Set<Polyline>,selectedLocation: freezed == selectedLocation ? _self.selectedLocation : selectedLocation // ignore: cast_nullable_to_non_nullable
as AlrtLocation?,currentRoutePlan: freezed == currentRoutePlan ? _self.currentRoutePlan : currentRoutePlan // ignore: cast_nullable_to_non_nullable
as RoutePlan?,getRouteState: null == getRouteState ? _self.getRouteState : getRouteState // ignore: cast_nullable_to_non_nullable
as GetRouteState,getAddressFromCoordinatesState: null == getAddressFromCoordinatesState ? _self.getAddressFromCoordinatesState : getAddressFromCoordinatesState // ignore: cast_nullable_to_non_nullable
as GetAddressFromCoordinatesState,
  ));
}

/// Create a copy of MapProviderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AlrtLocationCopyWith<$Res>? get selectedLocation {
    if (_self.selectedLocation == null) {
    return null;
  }

  return $AlrtLocationCopyWith<$Res>(_self.selectedLocation!, (value) {
    return _then(_self.copyWith(selectedLocation: value));
  });
}/// Create a copy of MapProviderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoutePlanCopyWith<$Res>? get currentRoutePlan {
    if (_self.currentRoutePlan == null) {
    return null;
  }

  return $RoutePlanCopyWith<$Res>(_self.currentRoutePlan!, (value) {
    return _then(_self.copyWith(currentRoutePlan: value));
  });
}/// Create a copy of MapProviderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GetRouteStateCopyWith<$Res> get getRouteState {
  
  return $GetRouteStateCopyWith<$Res>(_self.getRouteState, (value) {
    return _then(_self.copyWith(getRouteState: value));
  });
}/// Create a copy of MapProviderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GetAddressFromCoordinatesStateCopyWith<$Res> get getAddressFromCoordinatesState {
  
  return $GetAddressFromCoordinatesStateCopyWith<$Res>(_self.getAddressFromCoordinatesState, (value) {
    return _then(_self.copyWith(getAddressFromCoordinatesState: value));
  });
}
}

/// @nodoc
mixin _$GetRouteState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetRouteState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetRouteState()';
}


}

/// @nodoc
class $GetRouteStateCopyWith<$Res>  {
$GetRouteStateCopyWith(GetRouteState _, $Res Function(GetRouteState) __);
}


/// Adds pattern-matching-related methods to [GetRouteState].
extension GetRouteStatePatterns on GetRouteState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GetRouteStateInitial value)?  initial,TResult Function( _GetRouteStateLoading value)?  loading,TResult Function( _GetRouteStateSuccess value)?  success,TResult Function( _GetRouteStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetRouteStateInitial() when initial != null:
return initial(_that);case _GetRouteStateLoading() when loading != null:
return loading(_that);case _GetRouteStateSuccess() when success != null:
return success(_that);case _GetRouteStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GetRouteStateInitial value)  initial,required TResult Function( _GetRouteStateLoading value)  loading,required TResult Function( _GetRouteStateSuccess value)  success,required TResult Function( _GetRouteStateError value)  error,}){
final _that = this;
switch (_that) {
case _GetRouteStateInitial():
return initial(_that);case _GetRouteStateLoading():
return loading(_that);case _GetRouteStateSuccess():
return success(_that);case _GetRouteStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GetRouteStateInitial value)?  initial,TResult? Function( _GetRouteStateLoading value)?  loading,TResult? Function( _GetRouteStateSuccess value)?  success,TResult? Function( _GetRouteStateError value)?  error,}){
final _that = this;
switch (_that) {
case _GetRouteStateInitial() when initial != null:
return initial(_that);case _GetRouteStateLoading() when loading != null:
return loading(_that);case _GetRouteStateSuccess() when success != null:
return success(_that);case _GetRouteStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( RoutePlan routeSettings)?  success,TResult Function( AppError error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetRouteStateInitial() when initial != null:
return initial();case _GetRouteStateLoading() when loading != null:
return loading();case _GetRouteStateSuccess() when success != null:
return success(_that.routeSettings);case _GetRouteStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( RoutePlan routeSettings)  success,required TResult Function( AppError error)  error,}) {final _that = this;
switch (_that) {
case _GetRouteStateInitial():
return initial();case _GetRouteStateLoading():
return loading();case _GetRouteStateSuccess():
return success(_that.routeSettings);case _GetRouteStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( RoutePlan routeSettings)?  success,TResult? Function( AppError error)?  error,}) {final _that = this;
switch (_that) {
case _GetRouteStateInitial() when initial != null:
return initial();case _GetRouteStateLoading() when loading != null:
return loading();case _GetRouteStateSuccess() when success != null:
return success(_that.routeSettings);case _GetRouteStateError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _GetRouteStateInitial implements GetRouteState {
  const _GetRouteStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetRouteStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetRouteState.initial()';
}


}




/// @nodoc


class _GetRouteStateLoading implements GetRouteState {
  const _GetRouteStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetRouteStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetRouteState.loading()';
}


}




/// @nodoc


class _GetRouteStateSuccess implements GetRouteState {
  const _GetRouteStateSuccess(this.routeSettings);
  

 final  RoutePlan routeSettings;

/// Create a copy of GetRouteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetRouteStateSuccessCopyWith<_GetRouteStateSuccess> get copyWith => __$GetRouteStateSuccessCopyWithImpl<_GetRouteStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetRouteStateSuccess&&(identical(other.routeSettings, routeSettings) || other.routeSettings == routeSettings));
}


@override
int get hashCode => Object.hash(runtimeType,routeSettings);

@override
String toString() {
  return 'GetRouteState.success(routeSettings: $routeSettings)';
}


}

/// @nodoc
abstract mixin class _$GetRouteStateSuccessCopyWith<$Res> implements $GetRouteStateCopyWith<$Res> {
  factory _$GetRouteStateSuccessCopyWith(_GetRouteStateSuccess value, $Res Function(_GetRouteStateSuccess) _then) = __$GetRouteStateSuccessCopyWithImpl;
@useResult
$Res call({
 RoutePlan routeSettings
});


$RoutePlanCopyWith<$Res> get routeSettings;

}
/// @nodoc
class __$GetRouteStateSuccessCopyWithImpl<$Res>
    implements _$GetRouteStateSuccessCopyWith<$Res> {
  __$GetRouteStateSuccessCopyWithImpl(this._self, this._then);

  final _GetRouteStateSuccess _self;
  final $Res Function(_GetRouteStateSuccess) _then;

/// Create a copy of GetRouteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? routeSettings = null,}) {
  return _then(_GetRouteStateSuccess(
null == routeSettings ? _self.routeSettings : routeSettings // ignore: cast_nullable_to_non_nullable
as RoutePlan,
  ));
}

/// Create a copy of GetRouteState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoutePlanCopyWith<$Res> get routeSettings {
  
  return $RoutePlanCopyWith<$Res>(_self.routeSettings, (value) {
    return _then(_self.copyWith(routeSettings: value));
  });
}
}

/// @nodoc


class _GetRouteStateError implements GetRouteState {
  const _GetRouteStateError(this.error);
  

 final  AppError error;

/// Create a copy of GetRouteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetRouteStateErrorCopyWith<_GetRouteStateError> get copyWith => __$GetRouteStateErrorCopyWithImpl<_GetRouteStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetRouteStateError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'GetRouteState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class _$GetRouteStateErrorCopyWith<$Res> implements $GetRouteStateCopyWith<$Res> {
  factory _$GetRouteStateErrorCopyWith(_GetRouteStateError value, $Res Function(_GetRouteStateError) _then) = __$GetRouteStateErrorCopyWithImpl;
@useResult
$Res call({
 AppError error
});


$AppErrorCopyWith<$Res> get error;

}
/// @nodoc
class __$GetRouteStateErrorCopyWithImpl<$Res>
    implements _$GetRouteStateErrorCopyWith<$Res> {
  __$GetRouteStateErrorCopyWithImpl(this._self, this._then);

  final _GetRouteStateError _self;
  final $Res Function(_GetRouteStateError) _then;

/// Create a copy of GetRouteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_GetRouteStateError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppError,
  ));
}

/// Create a copy of GetRouteState
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
mixin _$GetAddressFromCoordinatesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAddressFromCoordinatesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetAddressFromCoordinatesState()';
}


}

/// @nodoc
class $GetAddressFromCoordinatesStateCopyWith<$Res>  {
$GetAddressFromCoordinatesStateCopyWith(GetAddressFromCoordinatesState _, $Res Function(GetAddressFromCoordinatesState) __);
}


/// Adds pattern-matching-related methods to [GetAddressFromCoordinatesState].
extension GetAddressFromCoordinatesStatePatterns on GetAddressFromCoordinatesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GetAddressFromCoordinatesStateInitial value)?  initial,TResult Function( _GetAddressFromCoordinatesStateLoading value)?  loading,TResult Function( _GetAddressFromCoordinatesStateSuccess value)?  success,TResult Function( _GetAddressFromCoordinatesStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetAddressFromCoordinatesStateInitial() when initial != null:
return initial(_that);case _GetAddressFromCoordinatesStateLoading() when loading != null:
return loading(_that);case _GetAddressFromCoordinatesStateSuccess() when success != null:
return success(_that);case _GetAddressFromCoordinatesStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GetAddressFromCoordinatesStateInitial value)  initial,required TResult Function( _GetAddressFromCoordinatesStateLoading value)  loading,required TResult Function( _GetAddressFromCoordinatesStateSuccess value)  success,required TResult Function( _GetAddressFromCoordinatesStateError value)  error,}){
final _that = this;
switch (_that) {
case _GetAddressFromCoordinatesStateInitial():
return initial(_that);case _GetAddressFromCoordinatesStateLoading():
return loading(_that);case _GetAddressFromCoordinatesStateSuccess():
return success(_that);case _GetAddressFromCoordinatesStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GetAddressFromCoordinatesStateInitial value)?  initial,TResult? Function( _GetAddressFromCoordinatesStateLoading value)?  loading,TResult? Function( _GetAddressFromCoordinatesStateSuccess value)?  success,TResult? Function( _GetAddressFromCoordinatesStateError value)?  error,}){
final _that = this;
switch (_that) {
case _GetAddressFromCoordinatesStateInitial() when initial != null:
return initial(_that);case _GetAddressFromCoordinatesStateLoading() when loading != null:
return loading(_that);case _GetAddressFromCoordinatesStateSuccess() when success != null:
return success(_that);case _GetAddressFromCoordinatesStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( AlrtLocation location)?  success,TResult Function( AppError error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetAddressFromCoordinatesStateInitial() when initial != null:
return initial();case _GetAddressFromCoordinatesStateLoading() when loading != null:
return loading();case _GetAddressFromCoordinatesStateSuccess() when success != null:
return success(_that.location);case _GetAddressFromCoordinatesStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( AlrtLocation location)  success,required TResult Function( AppError error)  error,}) {final _that = this;
switch (_that) {
case _GetAddressFromCoordinatesStateInitial():
return initial();case _GetAddressFromCoordinatesStateLoading():
return loading();case _GetAddressFromCoordinatesStateSuccess():
return success(_that.location);case _GetAddressFromCoordinatesStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( AlrtLocation location)?  success,TResult? Function( AppError error)?  error,}) {final _that = this;
switch (_that) {
case _GetAddressFromCoordinatesStateInitial() when initial != null:
return initial();case _GetAddressFromCoordinatesStateLoading() when loading != null:
return loading();case _GetAddressFromCoordinatesStateSuccess() when success != null:
return success(_that.location);case _GetAddressFromCoordinatesStateError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _GetAddressFromCoordinatesStateInitial implements GetAddressFromCoordinatesState {
  const _GetAddressFromCoordinatesStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetAddressFromCoordinatesStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetAddressFromCoordinatesState.initial()';
}


}




/// @nodoc


class _GetAddressFromCoordinatesStateLoading implements GetAddressFromCoordinatesState {
  const _GetAddressFromCoordinatesStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetAddressFromCoordinatesStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetAddressFromCoordinatesState.loading()';
}


}




/// @nodoc


class _GetAddressFromCoordinatesStateSuccess implements GetAddressFromCoordinatesState {
  const _GetAddressFromCoordinatesStateSuccess(this.location);
  

 final  AlrtLocation location;

/// Create a copy of GetAddressFromCoordinatesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetAddressFromCoordinatesStateSuccessCopyWith<_GetAddressFromCoordinatesStateSuccess> get copyWith => __$GetAddressFromCoordinatesStateSuccessCopyWithImpl<_GetAddressFromCoordinatesStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetAddressFromCoordinatesStateSuccess&&(identical(other.location, location) || other.location == location));
}


@override
int get hashCode => Object.hash(runtimeType,location);

@override
String toString() {
  return 'GetAddressFromCoordinatesState.success(location: $location)';
}


}

/// @nodoc
abstract mixin class _$GetAddressFromCoordinatesStateSuccessCopyWith<$Res> implements $GetAddressFromCoordinatesStateCopyWith<$Res> {
  factory _$GetAddressFromCoordinatesStateSuccessCopyWith(_GetAddressFromCoordinatesStateSuccess value, $Res Function(_GetAddressFromCoordinatesStateSuccess) _then) = __$GetAddressFromCoordinatesStateSuccessCopyWithImpl;
@useResult
$Res call({
 AlrtLocation location
});


$AlrtLocationCopyWith<$Res> get location;

}
/// @nodoc
class __$GetAddressFromCoordinatesStateSuccessCopyWithImpl<$Res>
    implements _$GetAddressFromCoordinatesStateSuccessCopyWith<$Res> {
  __$GetAddressFromCoordinatesStateSuccessCopyWithImpl(this._self, this._then);

  final _GetAddressFromCoordinatesStateSuccess _self;
  final $Res Function(_GetAddressFromCoordinatesStateSuccess) _then;

/// Create a copy of GetAddressFromCoordinatesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? location = null,}) {
  return _then(_GetAddressFromCoordinatesStateSuccess(
null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as AlrtLocation,
  ));
}

/// Create a copy of GetAddressFromCoordinatesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AlrtLocationCopyWith<$Res> get location {
  
  return $AlrtLocationCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}

/// @nodoc


class _GetAddressFromCoordinatesStateError implements GetAddressFromCoordinatesState {
  const _GetAddressFromCoordinatesStateError(this.error);
  

 final  AppError error;

/// Create a copy of GetAddressFromCoordinatesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetAddressFromCoordinatesStateErrorCopyWith<_GetAddressFromCoordinatesStateError> get copyWith => __$GetAddressFromCoordinatesStateErrorCopyWithImpl<_GetAddressFromCoordinatesStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetAddressFromCoordinatesStateError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'GetAddressFromCoordinatesState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class _$GetAddressFromCoordinatesStateErrorCopyWith<$Res> implements $GetAddressFromCoordinatesStateCopyWith<$Res> {
  factory _$GetAddressFromCoordinatesStateErrorCopyWith(_GetAddressFromCoordinatesStateError value, $Res Function(_GetAddressFromCoordinatesStateError) _then) = __$GetAddressFromCoordinatesStateErrorCopyWithImpl;
@useResult
$Res call({
 AppError error
});


$AppErrorCopyWith<$Res> get error;

}
/// @nodoc
class __$GetAddressFromCoordinatesStateErrorCopyWithImpl<$Res>
    implements _$GetAddressFromCoordinatesStateErrorCopyWith<$Res> {
  __$GetAddressFromCoordinatesStateErrorCopyWithImpl(this._self, this._then);

  final _GetAddressFromCoordinatesStateError _self;
  final $Res Function(_GetAddressFromCoordinatesStateError) _then;

/// Create a copy of GetAddressFromCoordinatesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_GetAddressFromCoordinatesStateError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppError,
  ));
}

/// Create a copy of GetAddressFromCoordinatesState
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
