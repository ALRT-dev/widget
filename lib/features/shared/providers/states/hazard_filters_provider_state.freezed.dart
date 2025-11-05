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

/// The list of hazard categories fetched from the service.
 List<HazardCategory> get hazardCategories;/// The list of categories selected by the user.
 List<HazardCategory> get selectedHazardCategories;/// The list of hazard severities (AWS compliant) fetched from the service.
 List<HazardSeverityWithCount> get hazardSeveritiesAws;/// The list of AWS severities selected by the user.
 List<HazardSeverityWithCount> get selectedHazardSeveritiesAws;/// The list of hazard severities (Non-AWS compliant) fetched from the service.
 List<HazardSeverityWithCount> get hazardSeveritiesNonAws;/// The list of Non-AWS severities selected by the user.
 List<HazardSeverityWithCount> get selectedHazardSeveritiesNonAws;/// The state of fetching hazard categories.
 GetAllHazardCategoriesState get getAllHazardCategoriesState;
/// Create a copy of HazardFiltersProviderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HazardFiltersProviderStateCopyWith<HazardFiltersProviderState> get copyWith => _$HazardFiltersProviderStateCopyWithImpl<HazardFiltersProviderState>(this as HazardFiltersProviderState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HazardFiltersProviderState&&const DeepCollectionEquality().equals(other.hazardCategories, hazardCategories)&&const DeepCollectionEquality().equals(other.selectedHazardCategories, selectedHazardCategories)&&const DeepCollectionEquality().equals(other.hazardSeveritiesAws, hazardSeveritiesAws)&&const DeepCollectionEquality().equals(other.selectedHazardSeveritiesAws, selectedHazardSeveritiesAws)&&const DeepCollectionEquality().equals(other.hazardSeveritiesNonAws, hazardSeveritiesNonAws)&&const DeepCollectionEquality().equals(other.selectedHazardSeveritiesNonAws, selectedHazardSeveritiesNonAws)&&(identical(other.getAllHazardCategoriesState, getAllHazardCategoriesState) || other.getAllHazardCategoriesState == getAllHazardCategoriesState));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(hazardCategories),const DeepCollectionEquality().hash(selectedHazardCategories),const DeepCollectionEquality().hash(hazardSeveritiesAws),const DeepCollectionEquality().hash(selectedHazardSeveritiesAws),const DeepCollectionEquality().hash(hazardSeveritiesNonAws),const DeepCollectionEquality().hash(selectedHazardSeveritiesNonAws),getAllHazardCategoriesState);

@override
String toString() {
  return 'HazardFiltersProviderState(hazardCategories: $hazardCategories, selectedHazardCategories: $selectedHazardCategories, hazardSeveritiesAws: $hazardSeveritiesAws, selectedHazardSeveritiesAws: $selectedHazardSeveritiesAws, hazardSeveritiesNonAws: $hazardSeveritiesNonAws, selectedHazardSeveritiesNonAws: $selectedHazardSeveritiesNonAws, getAllHazardCategoriesState: $getAllHazardCategoriesState)';
}


}

/// @nodoc
abstract mixin class $HazardFiltersProviderStateCopyWith<$Res>  {
  factory $HazardFiltersProviderStateCopyWith(HazardFiltersProviderState value, $Res Function(HazardFiltersProviderState) _then) = _$HazardFiltersProviderStateCopyWithImpl;
@useResult
$Res call({
 List<HazardCategory> hazardCategories, List<HazardCategory> selectedHazardCategories, List<HazardSeverityWithCount> hazardSeveritiesAws, List<HazardSeverityWithCount> selectedHazardSeveritiesAws, List<HazardSeverityWithCount> hazardSeveritiesNonAws, List<HazardSeverityWithCount> selectedHazardSeveritiesNonAws, GetAllHazardCategoriesState getAllHazardCategoriesState
});


$GetAllHazardCategoriesStateCopyWith<$Res> get getAllHazardCategoriesState;

}
/// @nodoc
class _$HazardFiltersProviderStateCopyWithImpl<$Res>
    implements $HazardFiltersProviderStateCopyWith<$Res> {
  _$HazardFiltersProviderStateCopyWithImpl(this._self, this._then);

  final HazardFiltersProviderState _self;
  final $Res Function(HazardFiltersProviderState) _then;

/// Create a copy of HazardFiltersProviderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hazardCategories = null,Object? selectedHazardCategories = null,Object? hazardSeveritiesAws = null,Object? selectedHazardSeveritiesAws = null,Object? hazardSeveritiesNonAws = null,Object? selectedHazardSeveritiesNonAws = null,Object? getAllHazardCategoriesState = null,}) {
  return _then(_self.copyWith(
hazardCategories: null == hazardCategories ? _self.hazardCategories : hazardCategories // ignore: cast_nullable_to_non_nullable
as List<HazardCategory>,selectedHazardCategories: null == selectedHazardCategories ? _self.selectedHazardCategories : selectedHazardCategories // ignore: cast_nullable_to_non_nullable
as List<HazardCategory>,hazardSeveritiesAws: null == hazardSeveritiesAws ? _self.hazardSeveritiesAws : hazardSeveritiesAws // ignore: cast_nullable_to_non_nullable
as List<HazardSeverityWithCount>,selectedHazardSeveritiesAws: null == selectedHazardSeveritiesAws ? _self.selectedHazardSeveritiesAws : selectedHazardSeveritiesAws // ignore: cast_nullable_to_non_nullable
as List<HazardSeverityWithCount>,hazardSeveritiesNonAws: null == hazardSeveritiesNonAws ? _self.hazardSeveritiesNonAws : hazardSeveritiesNonAws // ignore: cast_nullable_to_non_nullable
as List<HazardSeverityWithCount>,selectedHazardSeveritiesNonAws: null == selectedHazardSeveritiesNonAws ? _self.selectedHazardSeveritiesNonAws : selectedHazardSeveritiesNonAws // ignore: cast_nullable_to_non_nullable
as List<HazardSeverityWithCount>,getAllHazardCategoriesState: null == getAllHazardCategoriesState ? _self.getAllHazardCategoriesState : getAllHazardCategoriesState // ignore: cast_nullable_to_non_nullable
as GetAllHazardCategoriesState,
  ));
}
/// Create a copy of HazardFiltersProviderState
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<HazardCategory> hazardCategories,  List<HazardCategory> selectedHazardCategories,  List<HazardSeverityWithCount> hazardSeveritiesAws,  List<HazardSeverityWithCount> selectedHazardSeveritiesAws,  List<HazardSeverityWithCount> hazardSeveritiesNonAws,  List<HazardSeverityWithCount> selectedHazardSeveritiesNonAws,  GetAllHazardCategoriesState getAllHazardCategoriesState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HazardFiltersProviderState() when $default != null:
return $default(_that.hazardCategories,_that.selectedHazardCategories,_that.hazardSeveritiesAws,_that.selectedHazardSeveritiesAws,_that.hazardSeveritiesNonAws,_that.selectedHazardSeveritiesNonAws,_that.getAllHazardCategoriesState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<HazardCategory> hazardCategories,  List<HazardCategory> selectedHazardCategories,  List<HazardSeverityWithCount> hazardSeveritiesAws,  List<HazardSeverityWithCount> selectedHazardSeveritiesAws,  List<HazardSeverityWithCount> hazardSeveritiesNonAws,  List<HazardSeverityWithCount> selectedHazardSeveritiesNonAws,  GetAllHazardCategoriesState getAllHazardCategoriesState)  $default,) {final _that = this;
switch (_that) {
case _HazardFiltersProviderState():
return $default(_that.hazardCategories,_that.selectedHazardCategories,_that.hazardSeveritiesAws,_that.selectedHazardSeveritiesAws,_that.hazardSeveritiesNonAws,_that.selectedHazardSeveritiesNonAws,_that.getAllHazardCategoriesState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<HazardCategory> hazardCategories,  List<HazardCategory> selectedHazardCategories,  List<HazardSeverityWithCount> hazardSeveritiesAws,  List<HazardSeverityWithCount> selectedHazardSeveritiesAws,  List<HazardSeverityWithCount> hazardSeveritiesNonAws,  List<HazardSeverityWithCount> selectedHazardSeveritiesNonAws,  GetAllHazardCategoriesState getAllHazardCategoriesState)?  $default,) {final _that = this;
switch (_that) {
case _HazardFiltersProviderState() when $default != null:
return $default(_that.hazardCategories,_that.selectedHazardCategories,_that.hazardSeveritiesAws,_that.selectedHazardSeveritiesAws,_that.hazardSeveritiesNonAws,_that.selectedHazardSeveritiesNonAws,_that.getAllHazardCategoriesState);case _:
  return null;

}
}

}

/// @nodoc


class _HazardFiltersProviderState implements HazardFiltersProviderState {
  const _HazardFiltersProviderState({final  List<HazardCategory> hazardCategories = const <HazardCategory>[], final  List<HazardCategory> selectedHazardCategories = const <HazardCategory>[], final  List<HazardSeverityWithCount> hazardSeveritiesAws = const <HazardSeverityWithCount>[], final  List<HazardSeverityWithCount> selectedHazardSeveritiesAws = const <HazardSeverityWithCount>[], final  List<HazardSeverityWithCount> hazardSeveritiesNonAws = const <HazardSeverityWithCount>[], final  List<HazardSeverityWithCount> selectedHazardSeveritiesNonAws = const <HazardSeverityWithCount>[], this.getAllHazardCategoriesState = const GetAllHazardCategoriesState.initial()}): _hazardCategories = hazardCategories,_selectedHazardCategories = selectedHazardCategories,_hazardSeveritiesAws = hazardSeveritiesAws,_selectedHazardSeveritiesAws = selectedHazardSeveritiesAws,_hazardSeveritiesNonAws = hazardSeveritiesNonAws,_selectedHazardSeveritiesNonAws = selectedHazardSeveritiesNonAws;
  

/// The list of hazard categories fetched from the service.
 final  List<HazardCategory> _hazardCategories;
/// The list of hazard categories fetched from the service.
@override@JsonKey() List<HazardCategory> get hazardCategories {
  if (_hazardCategories is EqualUnmodifiableListView) return _hazardCategories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hazardCategories);
}

/// The list of categories selected by the user.
 final  List<HazardCategory> _selectedHazardCategories;
/// The list of categories selected by the user.
@override@JsonKey() List<HazardCategory> get selectedHazardCategories {
  if (_selectedHazardCategories is EqualUnmodifiableListView) return _selectedHazardCategories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedHazardCategories);
}

/// The list of hazard severities (AWS compliant) fetched from the service.
 final  List<HazardSeverityWithCount> _hazardSeveritiesAws;
/// The list of hazard severities (AWS compliant) fetched from the service.
@override@JsonKey() List<HazardSeverityWithCount> get hazardSeveritiesAws {
  if (_hazardSeveritiesAws is EqualUnmodifiableListView) return _hazardSeveritiesAws;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hazardSeveritiesAws);
}

/// The list of AWS severities selected by the user.
 final  List<HazardSeverityWithCount> _selectedHazardSeveritiesAws;
/// The list of AWS severities selected by the user.
@override@JsonKey() List<HazardSeverityWithCount> get selectedHazardSeveritiesAws {
  if (_selectedHazardSeveritiesAws is EqualUnmodifiableListView) return _selectedHazardSeveritiesAws;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedHazardSeveritiesAws);
}

/// The list of hazard severities (Non-AWS compliant) fetched from the service.
 final  List<HazardSeverityWithCount> _hazardSeveritiesNonAws;
/// The list of hazard severities (Non-AWS compliant) fetched from the service.
@override@JsonKey() List<HazardSeverityWithCount> get hazardSeveritiesNonAws {
  if (_hazardSeveritiesNonAws is EqualUnmodifiableListView) return _hazardSeveritiesNonAws;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hazardSeveritiesNonAws);
}

/// The list of Non-AWS severities selected by the user.
 final  List<HazardSeverityWithCount> _selectedHazardSeveritiesNonAws;
/// The list of Non-AWS severities selected by the user.
@override@JsonKey() List<HazardSeverityWithCount> get selectedHazardSeveritiesNonAws {
  if (_selectedHazardSeveritiesNonAws is EqualUnmodifiableListView) return _selectedHazardSeveritiesNonAws;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedHazardSeveritiesNonAws);
}

/// The state of fetching hazard categories.
@override@JsonKey() final  GetAllHazardCategoriesState getAllHazardCategoriesState;

/// Create a copy of HazardFiltersProviderState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HazardFiltersProviderStateCopyWith<_HazardFiltersProviderState> get copyWith => __$HazardFiltersProviderStateCopyWithImpl<_HazardFiltersProviderState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HazardFiltersProviderState&&const DeepCollectionEquality().equals(other._hazardCategories, _hazardCategories)&&const DeepCollectionEquality().equals(other._selectedHazardCategories, _selectedHazardCategories)&&const DeepCollectionEquality().equals(other._hazardSeveritiesAws, _hazardSeveritiesAws)&&const DeepCollectionEquality().equals(other._selectedHazardSeveritiesAws, _selectedHazardSeveritiesAws)&&const DeepCollectionEquality().equals(other._hazardSeveritiesNonAws, _hazardSeveritiesNonAws)&&const DeepCollectionEquality().equals(other._selectedHazardSeveritiesNonAws, _selectedHazardSeveritiesNonAws)&&(identical(other.getAllHazardCategoriesState, getAllHazardCategoriesState) || other.getAllHazardCategoriesState == getAllHazardCategoriesState));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_hazardCategories),const DeepCollectionEquality().hash(_selectedHazardCategories),const DeepCollectionEquality().hash(_hazardSeveritiesAws),const DeepCollectionEquality().hash(_selectedHazardSeveritiesAws),const DeepCollectionEquality().hash(_hazardSeveritiesNonAws),const DeepCollectionEquality().hash(_selectedHazardSeveritiesNonAws),getAllHazardCategoriesState);

@override
String toString() {
  return 'HazardFiltersProviderState(hazardCategories: $hazardCategories, selectedHazardCategories: $selectedHazardCategories, hazardSeveritiesAws: $hazardSeveritiesAws, selectedHazardSeveritiesAws: $selectedHazardSeveritiesAws, hazardSeveritiesNonAws: $hazardSeveritiesNonAws, selectedHazardSeveritiesNonAws: $selectedHazardSeveritiesNonAws, getAllHazardCategoriesState: $getAllHazardCategoriesState)';
}


}

/// @nodoc
abstract mixin class _$HazardFiltersProviderStateCopyWith<$Res> implements $HazardFiltersProviderStateCopyWith<$Res> {
  factory _$HazardFiltersProviderStateCopyWith(_HazardFiltersProviderState value, $Res Function(_HazardFiltersProviderState) _then) = __$HazardFiltersProviderStateCopyWithImpl;
@override @useResult
$Res call({
 List<HazardCategory> hazardCategories, List<HazardCategory> selectedHazardCategories, List<HazardSeverityWithCount> hazardSeveritiesAws, List<HazardSeverityWithCount> selectedHazardSeveritiesAws, List<HazardSeverityWithCount> hazardSeveritiesNonAws, List<HazardSeverityWithCount> selectedHazardSeveritiesNonAws, GetAllHazardCategoriesState getAllHazardCategoriesState
});


@override $GetAllHazardCategoriesStateCopyWith<$Res> get getAllHazardCategoriesState;

}
/// @nodoc
class __$HazardFiltersProviderStateCopyWithImpl<$Res>
    implements _$HazardFiltersProviderStateCopyWith<$Res> {
  __$HazardFiltersProviderStateCopyWithImpl(this._self, this._then);

  final _HazardFiltersProviderState _self;
  final $Res Function(_HazardFiltersProviderState) _then;

/// Create a copy of HazardFiltersProviderState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hazardCategories = null,Object? selectedHazardCategories = null,Object? hazardSeveritiesAws = null,Object? selectedHazardSeveritiesAws = null,Object? hazardSeveritiesNonAws = null,Object? selectedHazardSeveritiesNonAws = null,Object? getAllHazardCategoriesState = null,}) {
  return _then(_HazardFiltersProviderState(
hazardCategories: null == hazardCategories ? _self._hazardCategories : hazardCategories // ignore: cast_nullable_to_non_nullable
as List<HazardCategory>,selectedHazardCategories: null == selectedHazardCategories ? _self._selectedHazardCategories : selectedHazardCategories // ignore: cast_nullable_to_non_nullable
as List<HazardCategory>,hazardSeveritiesAws: null == hazardSeveritiesAws ? _self._hazardSeveritiesAws : hazardSeveritiesAws // ignore: cast_nullable_to_non_nullable
as List<HazardSeverityWithCount>,selectedHazardSeveritiesAws: null == selectedHazardSeveritiesAws ? _self._selectedHazardSeveritiesAws : selectedHazardSeveritiesAws // ignore: cast_nullable_to_non_nullable
as List<HazardSeverityWithCount>,hazardSeveritiesNonAws: null == hazardSeveritiesNonAws ? _self._hazardSeveritiesNonAws : hazardSeveritiesNonAws // ignore: cast_nullable_to_non_nullable
as List<HazardSeverityWithCount>,selectedHazardSeveritiesNonAws: null == selectedHazardSeveritiesNonAws ? _self._selectedHazardSeveritiesNonAws : selectedHazardSeveritiesNonAws // ignore: cast_nullable_to_non_nullable
as List<HazardSeverityWithCount>,getAllHazardCategoriesState: null == getAllHazardCategoriesState ? _self.getAllHazardCategoriesState : getAllHazardCategoriesState // ignore: cast_nullable_to_non_nullable
as GetAllHazardCategoriesState,
  ));
}

/// Create a copy of HazardFiltersProviderState
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

// dart format on
