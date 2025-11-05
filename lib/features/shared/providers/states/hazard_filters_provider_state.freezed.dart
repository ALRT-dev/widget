// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hazard_filters_provider_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HazardFiltersProviderState {

/// The complete set of hazard filters fetched from the service.
 HazardFilters get filters;/// The currently selected hazard filters.
 HazardFilters get selectedFilters;/// The list of all parent hazard categories.
 List<HazardCategory> get parentHazardCategories;/// The state of fetching hazard filters.
 GetHazardFiltersState get getHazardFiltersState;/// The state of fetching hazard categories.
 GetAllHazardCategoriesState get getAllHazardCategoriesState;
/// Create a copy of HazardFiltersProviderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HazardFiltersProviderStateCopyWith<HazardFiltersProviderState> get copyWith => _$HazardFiltersProviderStateCopyWithImpl<HazardFiltersProviderState>(this as HazardFiltersProviderState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HazardFiltersProviderState&&(identical(other.filters, filters) || other.filters == filters)&&(identical(other.selectedFilters, selectedFilters) || other.selectedFilters == selectedFilters)&&const DeepCollectionEquality().equals(other.parentHazardCategories, parentHazardCategories)&&(identical(other.getHazardFiltersState, getHazardFiltersState) || other.getHazardFiltersState == getHazardFiltersState)&&(identical(other.getAllHazardCategoriesState, getAllHazardCategoriesState) || other.getAllHazardCategoriesState == getAllHazardCategoriesState));
}


@override
int get hashCode => Object.hash(runtimeType,filters,selectedFilters,const DeepCollectionEquality().hash(parentHazardCategories),getHazardFiltersState,getAllHazardCategoriesState);

@override
String toString() {
  return 'HazardFiltersProviderState(filters: $filters, selectedFilters: $selectedFilters, parentHazardCategories: $parentHazardCategories, getHazardFiltersState: $getHazardFiltersState, getAllHazardCategoriesState: $getAllHazardCategoriesState)';
}


}

/// @nodoc
abstract mixin class $HazardFiltersProviderStateCopyWith<$Res>  {
  factory $HazardFiltersProviderStateCopyWith(HazardFiltersProviderState value, $Res Function(HazardFiltersProviderState) _then) = _$HazardFiltersProviderStateCopyWithImpl;
@useResult
$Res call({
 HazardFilters filters, HazardFilters selectedFilters, List<HazardCategory> parentHazardCategories, GetHazardFiltersState getHazardFiltersState, GetAllHazardCategoriesState getAllHazardCategoriesState
});


$HazardFiltersCopyWith<$Res> get filters;$HazardFiltersCopyWith<$Res> get selectedFilters;$GetHazardFiltersStateCopyWith<$Res> get getHazardFiltersState;$GetAllHazardCategoriesStateCopyWith<$Res> get getAllHazardCategoriesState;

}
/// @nodoc
class _$HazardFiltersProviderStateCopyWithImpl<$Res>
    implements $HazardFiltersProviderStateCopyWith<$Res> {
  _$HazardFiltersProviderStateCopyWithImpl(this._self, this._then);

  final HazardFiltersProviderState _self;
  final $Res Function(HazardFiltersProviderState) _then;

/// Create a copy of HazardFiltersProviderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? filters = null,Object? selectedFilters = null,Object? parentHazardCategories = null,Object? getHazardFiltersState = null,Object? getAllHazardCategoriesState = null,}) {
  return _then(_self.copyWith(
filters: null == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as HazardFilters,selectedFilters: null == selectedFilters ? _self.selectedFilters : selectedFilters // ignore: cast_nullable_to_non_nullable
as HazardFilters,parentHazardCategories: null == parentHazardCategories ? _self.parentHazardCategories : parentHazardCategories // ignore: cast_nullable_to_non_nullable
as List<HazardCategory>,getHazardFiltersState: null == getHazardFiltersState ? _self.getHazardFiltersState : getHazardFiltersState // ignore: cast_nullable_to_non_nullable
as GetHazardFiltersState,getAllHazardCategoriesState: null == getAllHazardCategoriesState ? _self.getAllHazardCategoriesState : getAllHazardCategoriesState // ignore: cast_nullable_to_non_nullable
as GetAllHazardCategoriesState,
  ));
}
/// Create a copy of HazardFiltersProviderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HazardFiltersCopyWith<$Res> get filters {
  
  return $HazardFiltersCopyWith<$Res>(_self.filters, (value) {
    return _then(_self.copyWith(filters: value));
  });
}/// Create a copy of HazardFiltersProviderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HazardFiltersCopyWith<$Res> get selectedFilters {
  
  return $HazardFiltersCopyWith<$Res>(_self.selectedFilters, (value) {
    return _then(_self.copyWith(selectedFilters: value));
  });
}/// Create a copy of HazardFiltersProviderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GetHazardFiltersStateCopyWith<$Res> get getHazardFiltersState {
  
  return $GetHazardFiltersStateCopyWith<$Res>(_self.getHazardFiltersState, (value) {
    return _then(_self.copyWith(getHazardFiltersState: value));
  });
}/// Create a copy of HazardFiltersProviderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GetAllHazardCategoriesStateCopyWith<$Res> get getAllHazardCategoriesState {
  
  return $GetAllHazardCategoriesStateCopyWith<$Res>(_self.getAllHazardCategoriesState, (value) {
    return _then(_self.copyWith(getAllHazardCategoriesState: value));
  });
}
}


/// Adds pattern-matching-related methods to [HazardFiltersProviderState].
extension HazardFiltersProviderStatePatterns on HazardFiltersProviderState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HazardFiltersProviderState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HazardFiltersProviderState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HazardFiltersProviderState value)  $default,){
final _that = this;
switch (_that) {
case _HazardFiltersProviderState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HazardFiltersProviderState value)?  $default,){
final _that = this;
switch (_that) {
case _HazardFiltersProviderState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HazardFilters filters,  HazardFilters selectedFilters,  List<HazardCategory> parentHazardCategories,  GetHazardFiltersState getHazardFiltersState,  GetAllHazardCategoriesState getAllHazardCategoriesState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HazardFiltersProviderState() when $default != null:
return $default(_that.filters,_that.selectedFilters,_that.parentHazardCategories,_that.getHazardFiltersState,_that.getAllHazardCategoriesState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HazardFilters filters,  HazardFilters selectedFilters,  List<HazardCategory> parentHazardCategories,  GetHazardFiltersState getHazardFiltersState,  GetAllHazardCategoriesState getAllHazardCategoriesState)  $default,) {final _that = this;
switch (_that) {
case _HazardFiltersProviderState():
return $default(_that.filters,_that.selectedFilters,_that.parentHazardCategories,_that.getHazardFiltersState,_that.getAllHazardCategoriesState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HazardFilters filters,  HazardFilters selectedFilters,  List<HazardCategory> parentHazardCategories,  GetHazardFiltersState getHazardFiltersState,  GetAllHazardCategoriesState getAllHazardCategoriesState)?  $default,) {final _that = this;
switch (_that) {
case _HazardFiltersProviderState() when $default != null:
return $default(_that.filters,_that.selectedFilters,_that.parentHazardCategories,_that.getHazardFiltersState,_that.getAllHazardCategoriesState);case _:
  return null;

}
}

}

/// @nodoc


class _HazardFiltersProviderState extends HazardFiltersProviderState {
  const _HazardFiltersProviderState({this.filters = const HazardFilters(), this.selectedFilters = const HazardFilters(), final  List<HazardCategory> parentHazardCategories = const <HazardCategory>[], this.getHazardFiltersState = const GetHazardFiltersState.initial(), this.getAllHazardCategoriesState = const GetAllHazardCategoriesState.initial()}): _parentHazardCategories = parentHazardCategories,super._();
  

/// The complete set of hazard filters fetched from the service.
@override@JsonKey() final  HazardFilters filters;
/// The currently selected hazard filters.
@override@JsonKey() final  HazardFilters selectedFilters;
/// The list of all parent hazard categories.
 final  List<HazardCategory> _parentHazardCategories;
/// The list of all parent hazard categories.
@override@JsonKey() List<HazardCategory> get parentHazardCategories {
  if (_parentHazardCategories is EqualUnmodifiableListView) return _parentHazardCategories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_parentHazardCategories);
}

/// The state of fetching hazard filters.
@override@JsonKey() final  GetHazardFiltersState getHazardFiltersState;
/// The state of fetching hazard categories.
@override@JsonKey() final  GetAllHazardCategoriesState getAllHazardCategoriesState;

/// Create a copy of HazardFiltersProviderState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HazardFiltersProviderStateCopyWith<_HazardFiltersProviderState> get copyWith => __$HazardFiltersProviderStateCopyWithImpl<_HazardFiltersProviderState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HazardFiltersProviderState&&(identical(other.filters, filters) || other.filters == filters)&&(identical(other.selectedFilters, selectedFilters) || other.selectedFilters == selectedFilters)&&const DeepCollectionEquality().equals(other._parentHazardCategories, _parentHazardCategories)&&(identical(other.getHazardFiltersState, getHazardFiltersState) || other.getHazardFiltersState == getHazardFiltersState)&&(identical(other.getAllHazardCategoriesState, getAllHazardCategoriesState) || other.getAllHazardCategoriesState == getAllHazardCategoriesState));
}


@override
int get hashCode => Object.hash(runtimeType,filters,selectedFilters,const DeepCollectionEquality().hash(_parentHazardCategories),getHazardFiltersState,getAllHazardCategoriesState);

@override
String toString() {
  return 'HazardFiltersProviderState(filters: $filters, selectedFilters: $selectedFilters, parentHazardCategories: $parentHazardCategories, getHazardFiltersState: $getHazardFiltersState, getAllHazardCategoriesState: $getAllHazardCategoriesState)';
}


}

/// @nodoc
abstract mixin class _$HazardFiltersProviderStateCopyWith<$Res> implements $HazardFiltersProviderStateCopyWith<$Res> {
  factory _$HazardFiltersProviderStateCopyWith(_HazardFiltersProviderState value, $Res Function(_HazardFiltersProviderState) _then) = __$HazardFiltersProviderStateCopyWithImpl;
@override @useResult
$Res call({
 HazardFilters filters, HazardFilters selectedFilters, List<HazardCategory> parentHazardCategories, GetHazardFiltersState getHazardFiltersState, GetAllHazardCategoriesState getAllHazardCategoriesState
});


@override $HazardFiltersCopyWith<$Res> get filters;@override $HazardFiltersCopyWith<$Res> get selectedFilters;@override $GetHazardFiltersStateCopyWith<$Res> get getHazardFiltersState;@override $GetAllHazardCategoriesStateCopyWith<$Res> get getAllHazardCategoriesState;

}
/// @nodoc
class __$HazardFiltersProviderStateCopyWithImpl<$Res>
    implements _$HazardFiltersProviderStateCopyWith<$Res> {
  __$HazardFiltersProviderStateCopyWithImpl(this._self, this._then);

  final _HazardFiltersProviderState _self;
  final $Res Function(_HazardFiltersProviderState) _then;

/// Create a copy of HazardFiltersProviderState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filters = null,Object? selectedFilters = null,Object? parentHazardCategories = null,Object? getHazardFiltersState = null,Object? getAllHazardCategoriesState = null,}) {
  return _then(_HazardFiltersProviderState(
filters: null == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as HazardFilters,selectedFilters: null == selectedFilters ? _self.selectedFilters : selectedFilters // ignore: cast_nullable_to_non_nullable
as HazardFilters,parentHazardCategories: null == parentHazardCategories ? _self._parentHazardCategories : parentHazardCategories // ignore: cast_nullable_to_non_nullable
as List<HazardCategory>,getHazardFiltersState: null == getHazardFiltersState ? _self.getHazardFiltersState : getHazardFiltersState // ignore: cast_nullable_to_non_nullable
as GetHazardFiltersState,getAllHazardCategoriesState: null == getAllHazardCategoriesState ? _self.getAllHazardCategoriesState : getAllHazardCategoriesState // ignore: cast_nullable_to_non_nullable
as GetAllHazardCategoriesState,
  ));
}

/// Create a copy of HazardFiltersProviderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HazardFiltersCopyWith<$Res> get filters {
  
  return $HazardFiltersCopyWith<$Res>(_self.filters, (value) {
    return _then(_self.copyWith(filters: value));
  });
}/// Create a copy of HazardFiltersProviderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HazardFiltersCopyWith<$Res> get selectedFilters {
  
  return $HazardFiltersCopyWith<$Res>(_self.selectedFilters, (value) {
    return _then(_self.copyWith(selectedFilters: value));
  });
}/// Create a copy of HazardFiltersProviderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GetHazardFiltersStateCopyWith<$Res> get getHazardFiltersState {
  
  return $GetHazardFiltersStateCopyWith<$Res>(_self.getHazardFiltersState, (value) {
    return _then(_self.copyWith(getHazardFiltersState: value));
  });
}/// Create a copy of HazardFiltersProviderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GetAllHazardCategoriesStateCopyWith<$Res> get getAllHazardCategoriesState {
  
  return $GetAllHazardCategoriesStateCopyWith<$Res>(_self.getAllHazardCategoriesState, (value) {
    return _then(_self.copyWith(getAllHazardCategoriesState: value));
  });
}
}

/// @nodoc
mixin _$GetAllHazardCategoriesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAllHazardCategoriesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetAllHazardCategoriesState()';
}


}

/// @nodoc
class $GetAllHazardCategoriesStateCopyWith<$Res>  {
$GetAllHazardCategoriesStateCopyWith(GetAllHazardCategoriesState _, $Res Function(GetAllHazardCategoriesState) __);
}


/// Adds pattern-matching-related methods to [GetAllHazardCategoriesState].
extension GetAllHazardCategoriesStatePatterns on GetAllHazardCategoriesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GetAllHazardCategoriesStateInitial value)?  initial,TResult Function( _GetAllHazardCategoriesStateLoading value)?  loading,TResult Function( _GetAllHazardCategoriesStateSuccess value)?  success,TResult Function( _GetAllHazardCategoriesStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetAllHazardCategoriesStateInitial() when initial != null:
return initial(_that);case _GetAllHazardCategoriesStateLoading() when loading != null:
return loading(_that);case _GetAllHazardCategoriesStateSuccess() when success != null:
return success(_that);case _GetAllHazardCategoriesStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GetAllHazardCategoriesStateInitial value)  initial,required TResult Function( _GetAllHazardCategoriesStateLoading value)  loading,required TResult Function( _GetAllHazardCategoriesStateSuccess value)  success,required TResult Function( _GetAllHazardCategoriesStateError value)  error,}){
final _that = this;
switch (_that) {
case _GetAllHazardCategoriesStateInitial():
return initial(_that);case _GetAllHazardCategoriesStateLoading():
return loading(_that);case _GetAllHazardCategoriesStateSuccess():
return success(_that);case _GetAllHazardCategoriesStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GetAllHazardCategoriesStateInitial value)?  initial,TResult? Function( _GetAllHazardCategoriesStateLoading value)?  loading,TResult? Function( _GetAllHazardCategoriesStateSuccess value)?  success,TResult? Function( _GetAllHazardCategoriesStateError value)?  error,}){
final _that = this;
switch (_that) {
case _GetAllHazardCategoriesStateInitial() when initial != null:
return initial(_that);case _GetAllHazardCategoriesStateLoading() when loading != null:
return loading(_that);case _GetAllHazardCategoriesStateSuccess() when success != null:
return success(_that);case _GetAllHazardCategoriesStateError() when error != null:
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
case _GetAllHazardCategoriesStateInitial() when initial != null:
return initial();case _GetAllHazardCategoriesStateLoading() when loading != null:
return loading();case _GetAllHazardCategoriesStateSuccess() when success != null:
return success(_that.hazardCategories);case _GetAllHazardCategoriesStateError() when error != null:
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
case _GetAllHazardCategoriesStateInitial():
return initial();case _GetAllHazardCategoriesStateLoading():
return loading();case _GetAllHazardCategoriesStateSuccess():
return success(_that.hazardCategories);case _GetAllHazardCategoriesStateError():
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
case _GetAllHazardCategoriesStateInitial() when initial != null:
return initial();case _GetAllHazardCategoriesStateLoading() when loading != null:
return loading();case _GetAllHazardCategoriesStateSuccess() when success != null:
return success(_that.hazardCategories);case _GetAllHazardCategoriesStateError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _GetAllHazardCategoriesStateInitial implements GetAllHazardCategoriesState {
  const _GetAllHazardCategoriesStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetAllHazardCategoriesStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetAllHazardCategoriesState.initial()';
}


}




/// @nodoc


class _GetAllHazardCategoriesStateLoading implements GetAllHazardCategoriesState {
  const _GetAllHazardCategoriesStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetAllHazardCategoriesStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetAllHazardCategoriesState.loading()';
}


}




/// @nodoc


class _GetAllHazardCategoriesStateSuccess implements GetAllHazardCategoriesState {
  const _GetAllHazardCategoriesStateSuccess(final  List<HazardCategory> hazardCategories): _hazardCategories = hazardCategories;
  

 final  List<HazardCategory> _hazardCategories;
 List<HazardCategory> get hazardCategories {
  if (_hazardCategories is EqualUnmodifiableListView) return _hazardCategories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hazardCategories);
}


/// Create a copy of GetAllHazardCategoriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetAllHazardCategoriesStateSuccessCopyWith<_GetAllHazardCategoriesStateSuccess> get copyWith => __$GetAllHazardCategoriesStateSuccessCopyWithImpl<_GetAllHazardCategoriesStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetAllHazardCategoriesStateSuccess&&const DeepCollectionEquality().equals(other._hazardCategories, _hazardCategories));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_hazardCategories));

@override
String toString() {
  return 'GetAllHazardCategoriesState.success(hazardCategories: $hazardCategories)';
}


}

/// @nodoc
abstract mixin class _$GetAllHazardCategoriesStateSuccessCopyWith<$Res> implements $GetAllHazardCategoriesStateCopyWith<$Res> {
  factory _$GetAllHazardCategoriesStateSuccessCopyWith(_GetAllHazardCategoriesStateSuccess value, $Res Function(_GetAllHazardCategoriesStateSuccess) _then) = __$GetAllHazardCategoriesStateSuccessCopyWithImpl;
@useResult
$Res call({
 List<HazardCategory> hazardCategories
});




}
/// @nodoc
class __$GetAllHazardCategoriesStateSuccessCopyWithImpl<$Res>
    implements _$GetAllHazardCategoriesStateSuccessCopyWith<$Res> {
  __$GetAllHazardCategoriesStateSuccessCopyWithImpl(this._self, this._then);

  final _GetAllHazardCategoriesStateSuccess _self;
  final $Res Function(_GetAllHazardCategoriesStateSuccess) _then;

/// Create a copy of GetAllHazardCategoriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? hazardCategories = null,}) {
  return _then(_GetAllHazardCategoriesStateSuccess(
null == hazardCategories ? _self._hazardCategories : hazardCategories // ignore: cast_nullable_to_non_nullable
as List<HazardCategory>,
  ));
}


}

/// @nodoc


class _GetAllHazardCategoriesStateError implements GetAllHazardCategoriesState {
  const _GetAllHazardCategoriesStateError(this.error);
  

 final  AppError error;

/// Create a copy of GetAllHazardCategoriesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetAllHazardCategoriesStateErrorCopyWith<_GetAllHazardCategoriesStateError> get copyWith => __$GetAllHazardCategoriesStateErrorCopyWithImpl<_GetAllHazardCategoriesStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetAllHazardCategoriesStateError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'GetAllHazardCategoriesState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class _$GetAllHazardCategoriesStateErrorCopyWith<$Res> implements $GetAllHazardCategoriesStateCopyWith<$Res> {
  factory _$GetAllHazardCategoriesStateErrorCopyWith(_GetAllHazardCategoriesStateError value, $Res Function(_GetAllHazardCategoriesStateError) _then) = __$GetAllHazardCategoriesStateErrorCopyWithImpl;
@useResult
$Res call({
 AppError error
});


$AppErrorCopyWith<$Res> get error;

}
/// @nodoc
class __$GetAllHazardCategoriesStateErrorCopyWithImpl<$Res>
    implements _$GetAllHazardCategoriesStateErrorCopyWith<$Res> {
  __$GetAllHazardCategoriesStateErrorCopyWithImpl(this._self, this._then);

  final _GetAllHazardCategoriesStateError _self;
  final $Res Function(_GetAllHazardCategoriesStateError) _then;

/// Create a copy of GetAllHazardCategoriesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_GetAllHazardCategoriesStateError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppError,
  ));
}

/// Create a copy of GetAllHazardCategoriesState
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
mixin _$GetHazardFiltersState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetHazardFiltersState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetHazardFiltersState()';
}


}

/// @nodoc
class $GetHazardFiltersStateCopyWith<$Res>  {
$GetHazardFiltersStateCopyWith(GetHazardFiltersState _, $Res Function(GetHazardFiltersState) __);
}


/// Adds pattern-matching-related methods to [GetHazardFiltersState].
extension GetHazardFiltersStatePatterns on GetHazardFiltersState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GetHazardFiltersStateInitial value)?  initial,TResult Function( _GetHazardFiltersStateLoading value)?  loading,TResult Function( _GetHazardFiltersStateSuccess value)?  success,TResult Function( _GetHazardFiltersStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetHazardFiltersStateInitial() when initial != null:
return initial(_that);case _GetHazardFiltersStateLoading() when loading != null:
return loading(_that);case _GetHazardFiltersStateSuccess() when success != null:
return success(_that);case _GetHazardFiltersStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GetHazardFiltersStateInitial value)  initial,required TResult Function( _GetHazardFiltersStateLoading value)  loading,required TResult Function( _GetHazardFiltersStateSuccess value)  success,required TResult Function( _GetHazardFiltersStateError value)  error,}){
final _that = this;
switch (_that) {
case _GetHazardFiltersStateInitial():
return initial(_that);case _GetHazardFiltersStateLoading():
return loading(_that);case _GetHazardFiltersStateSuccess():
return success(_that);case _GetHazardFiltersStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GetHazardFiltersStateInitial value)?  initial,TResult? Function( _GetHazardFiltersStateLoading value)?  loading,TResult? Function( _GetHazardFiltersStateSuccess value)?  success,TResult? Function( _GetHazardFiltersStateError value)?  error,}){
final _that = this;
switch (_that) {
case _GetHazardFiltersStateInitial() when initial != null:
return initial(_that);case _GetHazardFiltersStateLoading() when loading != null:
return loading(_that);case _GetHazardFiltersStateSuccess() when success != null:
return success(_that);case _GetHazardFiltersStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( HazardFilters hazardFilters)?  success,TResult Function( AppError error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetHazardFiltersStateInitial() when initial != null:
return initial();case _GetHazardFiltersStateLoading() when loading != null:
return loading();case _GetHazardFiltersStateSuccess() when success != null:
return success(_that.hazardFilters);case _GetHazardFiltersStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( HazardFilters hazardFilters)  success,required TResult Function( AppError error)  error,}) {final _that = this;
switch (_that) {
case _GetHazardFiltersStateInitial():
return initial();case _GetHazardFiltersStateLoading():
return loading();case _GetHazardFiltersStateSuccess():
return success(_that.hazardFilters);case _GetHazardFiltersStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( HazardFilters hazardFilters)?  success,TResult? Function( AppError error)?  error,}) {final _that = this;
switch (_that) {
case _GetHazardFiltersStateInitial() when initial != null:
return initial();case _GetHazardFiltersStateLoading() when loading != null:
return loading();case _GetHazardFiltersStateSuccess() when success != null:
return success(_that.hazardFilters);case _GetHazardFiltersStateError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _GetHazardFiltersStateInitial implements GetHazardFiltersState {
  const _GetHazardFiltersStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetHazardFiltersStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetHazardFiltersState.initial()';
}


}




/// @nodoc


class _GetHazardFiltersStateLoading implements GetHazardFiltersState {
  const _GetHazardFiltersStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetHazardFiltersStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetHazardFiltersState.loading()';
}


}




/// @nodoc


class _GetHazardFiltersStateSuccess implements GetHazardFiltersState {
  const _GetHazardFiltersStateSuccess(this.hazardFilters);
  

 final  HazardFilters hazardFilters;

/// Create a copy of GetHazardFiltersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetHazardFiltersStateSuccessCopyWith<_GetHazardFiltersStateSuccess> get copyWith => __$GetHazardFiltersStateSuccessCopyWithImpl<_GetHazardFiltersStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetHazardFiltersStateSuccess&&(identical(other.hazardFilters, hazardFilters) || other.hazardFilters == hazardFilters));
}


@override
int get hashCode => Object.hash(runtimeType,hazardFilters);

@override
String toString() {
  return 'GetHazardFiltersState.success(hazardFilters: $hazardFilters)';
}


}

/// @nodoc
abstract mixin class _$GetHazardFiltersStateSuccessCopyWith<$Res> implements $GetHazardFiltersStateCopyWith<$Res> {
  factory _$GetHazardFiltersStateSuccessCopyWith(_GetHazardFiltersStateSuccess value, $Res Function(_GetHazardFiltersStateSuccess) _then) = __$GetHazardFiltersStateSuccessCopyWithImpl;
@useResult
$Res call({
 HazardFilters hazardFilters
});


$HazardFiltersCopyWith<$Res> get hazardFilters;

}
/// @nodoc
class __$GetHazardFiltersStateSuccessCopyWithImpl<$Res>
    implements _$GetHazardFiltersStateSuccessCopyWith<$Res> {
  __$GetHazardFiltersStateSuccessCopyWithImpl(this._self, this._then);

  final _GetHazardFiltersStateSuccess _self;
  final $Res Function(_GetHazardFiltersStateSuccess) _then;

/// Create a copy of GetHazardFiltersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? hazardFilters = null,}) {
  return _then(_GetHazardFiltersStateSuccess(
null == hazardFilters ? _self.hazardFilters : hazardFilters // ignore: cast_nullable_to_non_nullable
as HazardFilters,
  ));
}

/// Create a copy of GetHazardFiltersState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HazardFiltersCopyWith<$Res> get hazardFilters {
  
  return $HazardFiltersCopyWith<$Res>(_self.hazardFilters, (value) {
    return _then(_self.copyWith(hazardFilters: value));
  });
}
}

/// @nodoc


class _GetHazardFiltersStateError implements GetHazardFiltersState {
  const _GetHazardFiltersStateError(this.error);
  

 final  AppError error;

/// Create a copy of GetHazardFiltersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetHazardFiltersStateErrorCopyWith<_GetHazardFiltersStateError> get copyWith => __$GetHazardFiltersStateErrorCopyWithImpl<_GetHazardFiltersStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetHazardFiltersStateError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'GetHazardFiltersState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class _$GetHazardFiltersStateErrorCopyWith<$Res> implements $GetHazardFiltersStateCopyWith<$Res> {
  factory _$GetHazardFiltersStateErrorCopyWith(_GetHazardFiltersStateError value, $Res Function(_GetHazardFiltersStateError) _then) = __$GetHazardFiltersStateErrorCopyWithImpl;
@useResult
$Res call({
 AppError error
});


$AppErrorCopyWith<$Res> get error;

}
/// @nodoc
class __$GetHazardFiltersStateErrorCopyWithImpl<$Res>
    implements _$GetHazardFiltersStateErrorCopyWith<$Res> {
  __$GetHazardFiltersStateErrorCopyWithImpl(this._self, this._then);

  final _GetHazardFiltersStateError _self;
  final $Res Function(_GetHazardFiltersStateError) _then;

/// Create a copy of GetHazardFiltersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_GetHazardFiltersStateError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppError,
  ));
}

/// Create a copy of GetHazardFiltersState
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
