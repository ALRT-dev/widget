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
 HazardSearchParams get tempSearchParams;/// The actual search parameters used to fetch hazards.
 HazardSearchParams get searchParams;/// The list of hazards fetched based on [searchParams] after [getMapHazardsState] is successful.
 List<Hazard> get mapHazards;/// The list of hazards fetched based on [searchParams] after [getListHazardsState] is successful.
 List<Hazard> get listHazards;/// The list of hazard categories fetched after [getHazardCategoriesState] is successful.
 List<HazardCategory> get hazardCategories;/// The state of the get hazards for the map.
 GetHazardsState get getMapHazardsState;/// The state of the get hazards for the list.
 GetHazardsState get getListHazardsState;/// The state of the get hazard categories operation.
 GetHazardCategoriesState get getHazardCategoriesState;
/// Create a copy of HazardsProviderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HazardsProviderStateCopyWith<HazardsProviderState> get copyWith => _$HazardsProviderStateCopyWithImpl<HazardsProviderState>(this as HazardsProviderState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HazardsProviderState&&(identical(other.tempSearchParams, tempSearchParams) || other.tempSearchParams == tempSearchParams)&&(identical(other.searchParams, searchParams) || other.searchParams == searchParams)&&const DeepCollectionEquality().equals(other.mapHazards, mapHazards)&&const DeepCollectionEquality().equals(other.listHazards, listHazards)&&const DeepCollectionEquality().equals(other.hazardCategories, hazardCategories)&&(identical(other.getMapHazardsState, getMapHazardsState) || other.getMapHazardsState == getMapHazardsState)&&(identical(other.getListHazardsState, getListHazardsState) || other.getListHazardsState == getListHazardsState)&&(identical(other.getHazardCategoriesState, getHazardCategoriesState) || other.getHazardCategoriesState == getHazardCategoriesState));
}


@override
int get hashCode => Object.hash(runtimeType,tempSearchParams,searchParams,const DeepCollectionEquality().hash(mapHazards),const DeepCollectionEquality().hash(listHazards),const DeepCollectionEquality().hash(hazardCategories),getMapHazardsState,getListHazardsState,getHazardCategoriesState);

@override
String toString() {
  return 'HazardsProviderState(tempSearchParams: $tempSearchParams, searchParams: $searchParams, mapHazards: $mapHazards, listHazards: $listHazards, hazardCategories: $hazardCategories, getMapHazardsState: $getMapHazardsState, getListHazardsState: $getListHazardsState, getHazardCategoriesState: $getHazardCategoriesState)';
}


}

/// @nodoc
abstract mixin class $HazardsProviderStateCopyWith<$Res>  {
  factory $HazardsProviderStateCopyWith(HazardsProviderState value, $Res Function(HazardsProviderState) _then) = _$HazardsProviderStateCopyWithImpl;
@useResult
$Res call({
 HazardSearchParams tempSearchParams, HazardSearchParams searchParams, List<Hazard> mapHazards, List<Hazard> listHazards, List<HazardCategory> hazardCategories, GetHazardsState getMapHazardsState, GetHazardsState getListHazardsState, GetHazardCategoriesState getHazardCategoriesState
});


$HazardSearchParamsCopyWith<$Res> get tempSearchParams;$HazardSearchParamsCopyWith<$Res> get searchParams;$GetHazardsStateCopyWith<$Res> get getMapHazardsState;$GetHazardsStateCopyWith<$Res> get getListHazardsState;$GetHazardCategoriesStateCopyWith<$Res> get getHazardCategoriesState;

}
/// @nodoc
class _$HazardsProviderStateCopyWithImpl<$Res>
    implements $HazardsProviderStateCopyWith<$Res> {
  _$HazardsProviderStateCopyWithImpl(this._self, this._then);

  final HazardsProviderState _self;
  final $Res Function(HazardsProviderState) _then;

/// Create a copy of HazardsProviderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tempSearchParams = null,Object? searchParams = null,Object? mapHazards = null,Object? listHazards = null,Object? hazardCategories = null,Object? getMapHazardsState = null,Object? getListHazardsState = null,Object? getHazardCategoriesState = null,}) {
  return _then(_self.copyWith(
tempSearchParams: null == tempSearchParams ? _self.tempSearchParams : tempSearchParams // ignore: cast_nullable_to_non_nullable
as HazardSearchParams,searchParams: null == searchParams ? _self.searchParams : searchParams // ignore: cast_nullable_to_non_nullable
as HazardSearchParams,mapHazards: null == mapHazards ? _self.mapHazards : mapHazards // ignore: cast_nullable_to_non_nullable
as List<Hazard>,listHazards: null == listHazards ? _self.listHazards : listHazards // ignore: cast_nullable_to_non_nullable
as List<Hazard>,hazardCategories: null == hazardCategories ? _self.hazardCategories : hazardCategories // ignore: cast_nullable_to_non_nullable
as List<HazardCategory>,getMapHazardsState: null == getMapHazardsState ? _self.getMapHazardsState : getMapHazardsState // ignore: cast_nullable_to_non_nullable
as GetHazardsState,getListHazardsState: null == getListHazardsState ? _self.getListHazardsState : getListHazardsState // ignore: cast_nullable_to_non_nullable
as GetHazardsState,getHazardCategoriesState: null == getHazardCategoriesState ? _self.getHazardCategoriesState : getHazardCategoriesState // ignore: cast_nullable_to_non_nullable
as GetHazardCategoriesState,
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
}/// Create a copy of HazardsProviderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HazardSearchParamsCopyWith<$Res> get searchParams {
  
  return $HazardSearchParamsCopyWith<$Res>(_self.searchParams, (value) {
    return _then(_self.copyWith(searchParams: value));
  });
}/// Create a copy of HazardsProviderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GetHazardsStateCopyWith<$Res> get getMapHazardsState {
  
  return $GetHazardsStateCopyWith<$Res>(_self.getMapHazardsState, (value) {
    return _then(_self.copyWith(getMapHazardsState: value));
  });
}/// Create a copy of HazardsProviderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GetHazardsStateCopyWith<$Res> get getListHazardsState {
  
  return $GetHazardsStateCopyWith<$Res>(_self.getListHazardsState, (value) {
    return _then(_self.copyWith(getListHazardsState: value));
  });
}/// Create a copy of HazardsProviderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GetHazardCategoriesStateCopyWith<$Res> get getHazardCategoriesState {
  
  return $GetHazardCategoriesStateCopyWith<$Res>(_self.getHazardCategoriesState, (value) {
    return _then(_self.copyWith(getHazardCategoriesState: value));
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HazardsProviderState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HazardsProviderState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HazardsProviderState value)  $default,){
final _that = this;
switch (_that) {
case _HazardsProviderState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HazardsProviderState value)?  $default,){
final _that = this;
switch (_that) {
case _HazardsProviderState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HazardSearchParams tempSearchParams,  HazardSearchParams searchParams,  List<Hazard> mapHazards,  List<Hazard> listHazards,  List<HazardCategory> hazardCategories,  GetHazardsState getMapHazardsState,  GetHazardsState getListHazardsState,  GetHazardCategoriesState getHazardCategoriesState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HazardsProviderState() when $default != null:
return $default(_that.tempSearchParams,_that.searchParams,_that.mapHazards,_that.listHazards,_that.hazardCategories,_that.getMapHazardsState,_that.getListHazardsState,_that.getHazardCategoriesState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HazardSearchParams tempSearchParams,  HazardSearchParams searchParams,  List<Hazard> mapHazards,  List<Hazard> listHazards,  List<HazardCategory> hazardCategories,  GetHazardsState getMapHazardsState,  GetHazardsState getListHazardsState,  GetHazardCategoriesState getHazardCategoriesState)  $default,) {final _that = this;
switch (_that) {
case _HazardsProviderState():
return $default(_that.tempSearchParams,_that.searchParams,_that.mapHazards,_that.listHazards,_that.hazardCategories,_that.getMapHazardsState,_that.getListHazardsState,_that.getHazardCategoriesState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HazardSearchParams tempSearchParams,  HazardSearchParams searchParams,  List<Hazard> mapHazards,  List<Hazard> listHazards,  List<HazardCategory> hazardCategories,  GetHazardsState getMapHazardsState,  GetHazardsState getListHazardsState,  GetHazardCategoriesState getHazardCategoriesState)?  $default,) {final _that = this;
switch (_that) {
case _HazardsProviderState() when $default != null:
return $default(_that.tempSearchParams,_that.searchParams,_that.mapHazards,_that.listHazards,_that.hazardCategories,_that.getMapHazardsState,_that.getListHazardsState,_that.getHazardCategoriesState);case _:
  return null;

}
}

}

/// @nodoc


class _HazardsProviderState implements HazardsProviderState {
  const _HazardsProviderState({this.tempSearchParams = const HazardSearchParams(), this.searchParams = const HazardSearchParams(), final  List<Hazard> mapHazards = const <Hazard>[], final  List<Hazard> listHazards = const <Hazard>[], final  List<HazardCategory> hazardCategories = const <HazardCategory>[], this.getMapHazardsState = const GetHazardsState.initial(), this.getListHazardsState = const GetHazardsState.initial(), this.getHazardCategoriesState = const GetHazardCategoriesState.initial()}): _mapHazards = mapHazards,_listHazards = listHazards,_hazardCategories = hazardCategories;
  

/// The temporary search parameters that are being modified by the user.
@override@JsonKey() final  HazardSearchParams tempSearchParams;
/// The actual search parameters used to fetch hazards.
@override@JsonKey() final  HazardSearchParams searchParams;
/// The list of hazards fetched based on [searchParams] after [getMapHazardsState] is successful.
 final  List<Hazard> _mapHazards;
/// The list of hazards fetched based on [searchParams] after [getMapHazardsState] is successful.
@override@JsonKey() List<Hazard> get mapHazards {
  if (_mapHazards is EqualUnmodifiableListView) return _mapHazards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mapHazards);
}

/// The list of hazards fetched based on [searchParams] after [getListHazardsState] is successful.
 final  List<Hazard> _listHazards;
/// The list of hazards fetched based on [searchParams] after [getListHazardsState] is successful.
@override@JsonKey() List<Hazard> get listHazards {
  if (_listHazards is EqualUnmodifiableListView) return _listHazards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_listHazards);
}

/// The list of hazard categories fetched after [getHazardCategoriesState] is successful.
 final  List<HazardCategory> _hazardCategories;
/// The list of hazard categories fetched after [getHazardCategoriesState] is successful.
@override@JsonKey() List<HazardCategory> get hazardCategories {
  if (_hazardCategories is EqualUnmodifiableListView) return _hazardCategories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hazardCategories);
}

/// The state of the get hazards for the map.
@override@JsonKey() final  GetHazardsState getMapHazardsState;
/// The state of the get hazards for the list.
@override@JsonKey() final  GetHazardsState getListHazardsState;
/// The state of the get hazard categories operation.
@override@JsonKey() final  GetHazardCategoriesState getHazardCategoriesState;

/// Create a copy of HazardsProviderState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HazardsProviderStateCopyWith<_HazardsProviderState> get copyWith => __$HazardsProviderStateCopyWithImpl<_HazardsProviderState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HazardsProviderState&&(identical(other.tempSearchParams, tempSearchParams) || other.tempSearchParams == tempSearchParams)&&(identical(other.searchParams, searchParams) || other.searchParams == searchParams)&&const DeepCollectionEquality().equals(other._mapHazards, _mapHazards)&&const DeepCollectionEquality().equals(other._listHazards, _listHazards)&&const DeepCollectionEquality().equals(other._hazardCategories, _hazardCategories)&&(identical(other.getMapHazardsState, getMapHazardsState) || other.getMapHazardsState == getMapHazardsState)&&(identical(other.getListHazardsState, getListHazardsState) || other.getListHazardsState == getListHazardsState)&&(identical(other.getHazardCategoriesState, getHazardCategoriesState) || other.getHazardCategoriesState == getHazardCategoriesState));
}


@override
int get hashCode => Object.hash(runtimeType,tempSearchParams,searchParams,const DeepCollectionEquality().hash(_mapHazards),const DeepCollectionEquality().hash(_listHazards),const DeepCollectionEquality().hash(_hazardCategories),getMapHazardsState,getListHazardsState,getHazardCategoriesState);

@override
String toString() {
  return 'HazardsProviderState(tempSearchParams: $tempSearchParams, searchParams: $searchParams, mapHazards: $mapHazards, listHazards: $listHazards, hazardCategories: $hazardCategories, getMapHazardsState: $getMapHazardsState, getListHazardsState: $getListHazardsState, getHazardCategoriesState: $getHazardCategoriesState)';
}


}

/// @nodoc
abstract mixin class _$HazardsProviderStateCopyWith<$Res> implements $HazardsProviderStateCopyWith<$Res> {
  factory _$HazardsProviderStateCopyWith(_HazardsProviderState value, $Res Function(_HazardsProviderState) _then) = __$HazardsProviderStateCopyWithImpl;
@override @useResult
$Res call({
 HazardSearchParams tempSearchParams, HazardSearchParams searchParams, List<Hazard> mapHazards, List<Hazard> listHazards, List<HazardCategory> hazardCategories, GetHazardsState getMapHazardsState, GetHazardsState getListHazardsState, GetHazardCategoriesState getHazardCategoriesState
});


@override $HazardSearchParamsCopyWith<$Res> get tempSearchParams;@override $HazardSearchParamsCopyWith<$Res> get searchParams;@override $GetHazardsStateCopyWith<$Res> get getMapHazardsState;@override $GetHazardsStateCopyWith<$Res> get getListHazardsState;@override $GetHazardCategoriesStateCopyWith<$Res> get getHazardCategoriesState;

}
/// @nodoc
class __$HazardsProviderStateCopyWithImpl<$Res>
    implements _$HazardsProviderStateCopyWith<$Res> {
  __$HazardsProviderStateCopyWithImpl(this._self, this._then);

  final _HazardsProviderState _self;
  final $Res Function(_HazardsProviderState) _then;

/// Create a copy of HazardsProviderState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tempSearchParams = null,Object? searchParams = null,Object? mapHazards = null,Object? listHazards = null,Object? hazardCategories = null,Object? getMapHazardsState = null,Object? getListHazardsState = null,Object? getHazardCategoriesState = null,}) {
  return _then(_HazardsProviderState(
tempSearchParams: null == tempSearchParams ? _self.tempSearchParams : tempSearchParams // ignore: cast_nullable_to_non_nullable
as HazardSearchParams,searchParams: null == searchParams ? _self.searchParams : searchParams // ignore: cast_nullable_to_non_nullable
as HazardSearchParams,mapHazards: null == mapHazards ? _self._mapHazards : mapHazards // ignore: cast_nullable_to_non_nullable
as List<Hazard>,listHazards: null == listHazards ? _self._listHazards : listHazards // ignore: cast_nullable_to_non_nullable
as List<Hazard>,hazardCategories: null == hazardCategories ? _self._hazardCategories : hazardCategories // ignore: cast_nullable_to_non_nullable
as List<HazardCategory>,getMapHazardsState: null == getMapHazardsState ? _self.getMapHazardsState : getMapHazardsState // ignore: cast_nullable_to_non_nullable
as GetHazardsState,getListHazardsState: null == getListHazardsState ? _self.getListHazardsState : getListHazardsState // ignore: cast_nullable_to_non_nullable
as GetHazardsState,getHazardCategoriesState: null == getHazardCategoriesState ? _self.getHazardCategoriesState : getHazardCategoriesState // ignore: cast_nullable_to_non_nullable
as GetHazardCategoriesState,
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
}/// Create a copy of HazardsProviderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HazardSearchParamsCopyWith<$Res> get searchParams {
  
  return $HazardSearchParamsCopyWith<$Res>(_self.searchParams, (value) {
    return _then(_self.copyWith(searchParams: value));
  });
}/// Create a copy of HazardsProviderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GetHazardsStateCopyWith<$Res> get getMapHazardsState {
  
  return $GetHazardsStateCopyWith<$Res>(_self.getMapHazardsState, (value) {
    return _then(_self.copyWith(getMapHazardsState: value));
  });
}/// Create a copy of HazardsProviderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GetHazardsStateCopyWith<$Res> get getListHazardsState {
  
  return $GetHazardsStateCopyWith<$Res>(_self.getListHazardsState, (value) {
    return _then(_self.copyWith(getListHazardsState: value));
  });
}/// Create a copy of HazardsProviderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GetHazardCategoriesStateCopyWith<$Res> get getHazardCategoriesState {
  
  return $GetHazardCategoriesStateCopyWith<$Res>(_self.getHazardCategoriesState, (value) {
    return _then(_self.copyWith(getHazardCategoriesState: value));
  });
}
}

/// @nodoc
mixin _$GetHazardsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetHazardsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetHazardsState()';
}


}

/// @nodoc
class $GetHazardsStateCopyWith<$Res>  {
$GetHazardsStateCopyWith(GetHazardsState _, $Res Function(GetHazardsState) __);
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetHazardsStateInitial value)?  initial,TResult Function( GetHazardsStateLoading value)?  loading,TResult Function( GetHazardsStateSuccess value)?  success,TResult Function( GetHazardsStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetHazardsStateInitial() when initial != null:
return initial(_that);case GetHazardsStateLoading() when loading != null:
return loading(_that);case GetHazardsStateSuccess() when success != null:
return success(_that);case GetHazardsStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetHazardsStateInitial value)  initial,required TResult Function( GetHazardsStateLoading value)  loading,required TResult Function( GetHazardsStateSuccess value)  success,required TResult Function( GetHazardsStateError value)  error,}){
final _that = this;
switch (_that) {
case GetHazardsStateInitial():
return initial(_that);case GetHazardsStateLoading():
return loading(_that);case GetHazardsStateSuccess():
return success(_that);case GetHazardsStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetHazardsStateInitial value)?  initial,TResult? Function( GetHazardsStateLoading value)?  loading,TResult? Function( GetHazardsStateSuccess value)?  success,TResult? Function( GetHazardsStateError value)?  error,}){
final _that = this;
switch (_that) {
case GetHazardsStateInitial() when initial != null:
return initial(_that);case GetHazardsStateLoading() when loading != null:
return loading(_that);case GetHazardsStateSuccess() when success != null:
return success(_that);case GetHazardsStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Hazard> hazards)?  success,TResult Function( AppError error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetHazardsStateInitial() when initial != null:
return initial();case GetHazardsStateLoading() when loading != null:
return loading();case GetHazardsStateSuccess() when success != null:
return success(_that.hazards);case GetHazardsStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Hazard> hazards)  success,required TResult Function( AppError error)  error,}) {final _that = this;
switch (_that) {
case GetHazardsStateInitial():
return initial();case GetHazardsStateLoading():
return loading();case GetHazardsStateSuccess():
return success(_that.hazards);case GetHazardsStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Hazard> hazards)?  success,TResult? Function( AppError error)?  error,}) {final _that = this;
switch (_that) {
case GetHazardsStateInitial() when initial != null:
return initial();case GetHazardsStateLoading() when loading != null:
return loading();case GetHazardsStateSuccess() when success != null:
return success(_that.hazards);case GetHazardsStateError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class GetHazardsStateInitial implements GetHazardsState {
  const GetHazardsStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetHazardsStateInitial);
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetHazardsStateLoading);
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
  const GetHazardsStateSuccess(final  List<Hazard> hazards): _hazards = hazards;
  

 final  List<Hazard> _hazards;
 List<Hazard> get hazards {
  if (_hazards is EqualUnmodifiableListView) return _hazards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hazards);
}


/// Create a copy of GetHazardsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetHazardsStateSuccessCopyWith<GetHazardsStateSuccess> get copyWith => _$GetHazardsStateSuccessCopyWithImpl<GetHazardsStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetHazardsStateSuccess&&const DeepCollectionEquality().equals(other._hazards, _hazards));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_hazards));

@override
String toString() {
  return 'GetHazardsState.success(hazards: $hazards)';
}


}

/// @nodoc
abstract mixin class $GetHazardsStateSuccessCopyWith<$Res> implements $GetHazardsStateCopyWith<$Res> {
  factory $GetHazardsStateSuccessCopyWith(GetHazardsStateSuccess value, $Res Function(GetHazardsStateSuccess) _then) = _$GetHazardsStateSuccessCopyWithImpl;
@useResult
$Res call({
 List<Hazard> hazards
});




}
/// @nodoc
class _$GetHazardsStateSuccessCopyWithImpl<$Res>
    implements $GetHazardsStateSuccessCopyWith<$Res> {
  _$GetHazardsStateSuccessCopyWithImpl(this._self, this._then);

  final GetHazardsStateSuccess _self;
  final $Res Function(GetHazardsStateSuccess) _then;

/// Create a copy of GetHazardsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? hazards = null,}) {
  return _then(GetHazardsStateSuccess(
null == hazards ? _self._hazards : hazards // ignore: cast_nullable_to_non_nullable
as List<Hazard>,
  ));
}


}

/// @nodoc


class GetHazardsStateError implements GetHazardsState {
  const GetHazardsStateError(this.error);
  

 final  AppError error;

/// Create a copy of GetHazardsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetHazardsStateErrorCopyWith<GetHazardsStateError> get copyWith => _$GetHazardsStateErrorCopyWithImpl<GetHazardsStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetHazardsStateError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'GetHazardsState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $GetHazardsStateErrorCopyWith<$Res> implements $GetHazardsStateCopyWith<$Res> {
  factory $GetHazardsStateErrorCopyWith(GetHazardsStateError value, $Res Function(GetHazardsStateError) _then) = _$GetHazardsStateErrorCopyWithImpl;
@useResult
$Res call({
 AppError error
});


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
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(GetHazardsStateError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
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

/// @nodoc
mixin _$GetHazardCategoriesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetHazardCategoriesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetHazardCategoriesState()';
}


}

/// @nodoc
class $GetHazardCategoriesStateCopyWith<$Res>  {
$GetHazardCategoriesStateCopyWith(GetHazardCategoriesState _, $Res Function(GetHazardCategoriesState) __);
}


/// Adds pattern-matching-related methods to [GetHazardCategoriesState].
extension GetHazardCategoriesStatePatterns on GetHazardCategoriesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetHazardCategoriesStateInitial value)?  initial,TResult Function( GetHazardCategoriesStateLoading value)?  loading,TResult Function( GetHazardCategoriesStateSuccess value)?  success,TResult Function( GetHazardCategoriesStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetHazardCategoriesStateInitial() when initial != null:
return initial(_that);case GetHazardCategoriesStateLoading() when loading != null:
return loading(_that);case GetHazardCategoriesStateSuccess() when success != null:
return success(_that);case GetHazardCategoriesStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetHazardCategoriesStateInitial value)  initial,required TResult Function( GetHazardCategoriesStateLoading value)  loading,required TResult Function( GetHazardCategoriesStateSuccess value)  success,required TResult Function( GetHazardCategoriesStateError value)  error,}){
final _that = this;
switch (_that) {
case GetHazardCategoriesStateInitial():
return initial(_that);case GetHazardCategoriesStateLoading():
return loading(_that);case GetHazardCategoriesStateSuccess():
return success(_that);case GetHazardCategoriesStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetHazardCategoriesStateInitial value)?  initial,TResult? Function( GetHazardCategoriesStateLoading value)?  loading,TResult? Function( GetHazardCategoriesStateSuccess value)?  success,TResult? Function( GetHazardCategoriesStateError value)?  error,}){
final _that = this;
switch (_that) {
case GetHazardCategoriesStateInitial() when initial != null:
return initial(_that);case GetHazardCategoriesStateLoading() when loading != null:
return loading(_that);case GetHazardCategoriesStateSuccess() when success != null:
return success(_that);case GetHazardCategoriesStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<HazardCategory> hazardCategories)?  success,TResult Function( AppError error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetHazardCategoriesStateInitial() when initial != null:
return initial();case GetHazardCategoriesStateLoading() when loading != null:
return loading();case GetHazardCategoriesStateSuccess() when success != null:
return success(_that.hazardCategories);case GetHazardCategoriesStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<HazardCategory> hazardCategories)  success,required TResult Function( AppError error)  error,}) {final _that = this;
switch (_that) {
case GetHazardCategoriesStateInitial():
return initial();case GetHazardCategoriesStateLoading():
return loading();case GetHazardCategoriesStateSuccess():
return success(_that.hazardCategories);case GetHazardCategoriesStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<HazardCategory> hazardCategories)?  success,TResult? Function( AppError error)?  error,}) {final _that = this;
switch (_that) {
case GetHazardCategoriesStateInitial() when initial != null:
return initial();case GetHazardCategoriesStateLoading() when loading != null:
return loading();case GetHazardCategoriesStateSuccess() when success != null:
return success(_that.hazardCategories);case GetHazardCategoriesStateError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class GetHazardCategoriesStateInitial implements GetHazardCategoriesState {
  const GetHazardCategoriesStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetHazardCategoriesStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetHazardCategoriesState.initial()';
}


}




/// @nodoc


class GetHazardCategoriesStateLoading implements GetHazardCategoriesState {
  const GetHazardCategoriesStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetHazardCategoriesStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetHazardCategoriesState.loading()';
}


}




/// @nodoc


class GetHazardCategoriesStateSuccess implements GetHazardCategoriesState {
  const GetHazardCategoriesStateSuccess(final  List<HazardCategory> hazardCategories): _hazardCategories = hazardCategories;
  

 final  List<HazardCategory> _hazardCategories;
 List<HazardCategory> get hazardCategories {
  if (_hazardCategories is EqualUnmodifiableListView) return _hazardCategories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hazardCategories);
}


/// Create a copy of GetHazardCategoriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetHazardCategoriesStateSuccessCopyWith<GetHazardCategoriesStateSuccess> get copyWith => _$GetHazardCategoriesStateSuccessCopyWithImpl<GetHazardCategoriesStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetHazardCategoriesStateSuccess&&const DeepCollectionEquality().equals(other._hazardCategories, _hazardCategories));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_hazardCategories));

@override
String toString() {
  return 'GetHazardCategoriesState.success(hazardCategories: $hazardCategories)';
}


}

/// @nodoc
abstract mixin class $GetHazardCategoriesStateSuccessCopyWith<$Res> implements $GetHazardCategoriesStateCopyWith<$Res> {
  factory $GetHazardCategoriesStateSuccessCopyWith(GetHazardCategoriesStateSuccess value, $Res Function(GetHazardCategoriesStateSuccess) _then) = _$GetHazardCategoriesStateSuccessCopyWithImpl;
@useResult
$Res call({
 List<HazardCategory> hazardCategories
});




}
/// @nodoc
class _$GetHazardCategoriesStateSuccessCopyWithImpl<$Res>
    implements $GetHazardCategoriesStateSuccessCopyWith<$Res> {
  _$GetHazardCategoriesStateSuccessCopyWithImpl(this._self, this._then);

  final GetHazardCategoriesStateSuccess _self;
  final $Res Function(GetHazardCategoriesStateSuccess) _then;

/// Create a copy of GetHazardCategoriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? hazardCategories = null,}) {
  return _then(GetHazardCategoriesStateSuccess(
null == hazardCategories ? _self._hazardCategories : hazardCategories // ignore: cast_nullable_to_non_nullable
as List<HazardCategory>,
  ));
}


}

/// @nodoc


class GetHazardCategoriesStateError implements GetHazardCategoriesState {
  const GetHazardCategoriesStateError(this.error);
  

 final  AppError error;

/// Create a copy of GetHazardCategoriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetHazardCategoriesStateErrorCopyWith<GetHazardCategoriesStateError> get copyWith => _$GetHazardCategoriesStateErrorCopyWithImpl<GetHazardCategoriesStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetHazardCategoriesStateError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'GetHazardCategoriesState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $GetHazardCategoriesStateErrorCopyWith<$Res> implements $GetHazardCategoriesStateCopyWith<$Res> {
  factory $GetHazardCategoriesStateErrorCopyWith(GetHazardCategoriesStateError value, $Res Function(GetHazardCategoriesStateError) _then) = _$GetHazardCategoriesStateErrorCopyWithImpl;
@useResult
$Res call({
 AppError error
});


$AppErrorCopyWith<$Res> get error;

}
/// @nodoc
class _$GetHazardCategoriesStateErrorCopyWithImpl<$Res>
    implements $GetHazardCategoriesStateErrorCopyWith<$Res> {
  _$GetHazardCategoriesStateErrorCopyWithImpl(this._self, this._then);

  final GetHazardCategoriesStateError _self;
  final $Res Function(GetHazardCategoriesStateError) _then;

/// Create a copy of GetHazardCategoriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(GetHazardCategoriesStateError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppError,
  ));
}

/// Create a copy of GetHazardCategoriesState
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
