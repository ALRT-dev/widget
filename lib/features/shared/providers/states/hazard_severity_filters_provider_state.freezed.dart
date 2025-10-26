// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hazard_severity_filters_provider_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HazardSeverityFiltersProviderState {

/// The list of hazard severities fetched from the service.
 List<HazardSeverityWithCount> get hazardSeverities;/// The list of severities selected by the user.
 List<HazardSeverityWithCount> get selectedSeverities;/// Whether the severity filters are displayed in the UI.
 bool get isFiltersVisible;
/// Create a copy of HazardSeverityFiltersProviderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HazardSeverityFiltersProviderStateCopyWith<HazardSeverityFiltersProviderState> get copyWith => _$HazardSeverityFiltersProviderStateCopyWithImpl<HazardSeverityFiltersProviderState>(this as HazardSeverityFiltersProviderState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HazardSeverityFiltersProviderState&&const DeepCollectionEquality().equals(other.hazardSeverities, hazardSeverities)&&const DeepCollectionEquality().equals(other.selectedSeverities, selectedSeverities)&&(identical(other.isFiltersVisible, isFiltersVisible) || other.isFiltersVisible == isFiltersVisible));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(hazardSeverities),const DeepCollectionEquality().hash(selectedSeverities),isFiltersVisible);

@override
String toString() {
  return 'HazardSeverityFiltersProviderState(hazardSeverities: $hazardSeverities, selectedSeverities: $selectedSeverities, isFiltersVisible: $isFiltersVisible)';
}


}

/// @nodoc
abstract mixin class $HazardSeverityFiltersProviderStateCopyWith<$Res>  {
  factory $HazardSeverityFiltersProviderStateCopyWith(HazardSeverityFiltersProviderState value, $Res Function(HazardSeverityFiltersProviderState) _then) = _$HazardSeverityFiltersProviderStateCopyWithImpl;
@useResult
$Res call({
 List<HazardSeverityWithCount> hazardSeverities, List<HazardSeverityWithCount> selectedSeverities, bool isFiltersVisible
});




}
/// @nodoc
class _$HazardSeverityFiltersProviderStateCopyWithImpl<$Res>
    implements $HazardSeverityFiltersProviderStateCopyWith<$Res> {
  _$HazardSeverityFiltersProviderStateCopyWithImpl(this._self, this._then);

  final HazardSeverityFiltersProviderState _self;
  final $Res Function(HazardSeverityFiltersProviderState) _then;

/// Create a copy of HazardSeverityFiltersProviderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hazardSeverities = null,Object? selectedSeverities = null,Object? isFiltersVisible = null,}) {
  return _then(_self.copyWith(
hazardSeverities: null == hazardSeverities ? _self.hazardSeverities : hazardSeverities // ignore: cast_nullable_to_non_nullable
as List<HazardSeverityWithCount>,selectedSeverities: null == selectedSeverities ? _self.selectedSeverities : selectedSeverities // ignore: cast_nullable_to_non_nullable
as List<HazardSeverityWithCount>,isFiltersVisible: null == isFiltersVisible ? _self.isFiltersVisible : isFiltersVisible // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [HazardSeverityFiltersProviderState].
extension HazardSeverityFiltersProviderStatePatterns on HazardSeverityFiltersProviderState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HazardSeverityFiltersProviderState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HazardSeverityFiltersProviderState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HazardSeverityFiltersProviderState value)  $default,){
final _that = this;
switch (_that) {
case _HazardSeverityFiltersProviderState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HazardSeverityFiltersProviderState value)?  $default,){
final _that = this;
switch (_that) {
case _HazardSeverityFiltersProviderState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<HazardSeverityWithCount> hazardSeverities,  List<HazardSeverityWithCount> selectedSeverities,  bool isFiltersVisible)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HazardSeverityFiltersProviderState() when $default != null:
return $default(_that.hazardSeverities,_that.selectedSeverities,_that.isFiltersVisible);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<HazardSeverityWithCount> hazardSeverities,  List<HazardSeverityWithCount> selectedSeverities,  bool isFiltersVisible)  $default,) {final _that = this;
switch (_that) {
case _HazardSeverityFiltersProviderState():
return $default(_that.hazardSeverities,_that.selectedSeverities,_that.isFiltersVisible);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<HazardSeverityWithCount> hazardSeverities,  List<HazardSeverityWithCount> selectedSeverities,  bool isFiltersVisible)?  $default,) {final _that = this;
switch (_that) {
case _HazardSeverityFiltersProviderState() when $default != null:
return $default(_that.hazardSeverities,_that.selectedSeverities,_that.isFiltersVisible);case _:
  return null;

}
}

}

/// @nodoc


class _HazardSeverityFiltersProviderState implements HazardSeverityFiltersProviderState {
  const _HazardSeverityFiltersProviderState({final  List<HazardSeverityWithCount> hazardSeverities = const <HazardSeverityWithCount>[], final  List<HazardSeverityWithCount> selectedSeverities = const <HazardSeverityWithCount>[], this.isFiltersVisible = false}): _hazardSeverities = hazardSeverities,_selectedSeverities = selectedSeverities;
  

/// The list of hazard severities fetched from the service.
 final  List<HazardSeverityWithCount> _hazardSeverities;
/// The list of hazard severities fetched from the service.
@override@JsonKey() List<HazardSeverityWithCount> get hazardSeverities {
  if (_hazardSeverities is EqualUnmodifiableListView) return _hazardSeverities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hazardSeverities);
}

/// The list of severities selected by the user.
 final  List<HazardSeverityWithCount> _selectedSeverities;
/// The list of severities selected by the user.
@override@JsonKey() List<HazardSeverityWithCount> get selectedSeverities {
  if (_selectedSeverities is EqualUnmodifiableListView) return _selectedSeverities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedSeverities);
}

/// Whether the severity filters are displayed in the UI.
@override@JsonKey() final  bool isFiltersVisible;

/// Create a copy of HazardSeverityFiltersProviderState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HazardSeverityFiltersProviderStateCopyWith<_HazardSeverityFiltersProviderState> get copyWith => __$HazardSeverityFiltersProviderStateCopyWithImpl<_HazardSeverityFiltersProviderState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HazardSeverityFiltersProviderState&&const DeepCollectionEquality().equals(other._hazardSeverities, _hazardSeverities)&&const DeepCollectionEquality().equals(other._selectedSeverities, _selectedSeverities)&&(identical(other.isFiltersVisible, isFiltersVisible) || other.isFiltersVisible == isFiltersVisible));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_hazardSeverities),const DeepCollectionEquality().hash(_selectedSeverities),isFiltersVisible);

@override
String toString() {
  return 'HazardSeverityFiltersProviderState(hazardSeverities: $hazardSeverities, selectedSeverities: $selectedSeverities, isFiltersVisible: $isFiltersVisible)';
}


}

/// @nodoc
abstract mixin class _$HazardSeverityFiltersProviderStateCopyWith<$Res> implements $HazardSeverityFiltersProviderStateCopyWith<$Res> {
  factory _$HazardSeverityFiltersProviderStateCopyWith(_HazardSeverityFiltersProviderState value, $Res Function(_HazardSeverityFiltersProviderState) _then) = __$HazardSeverityFiltersProviderStateCopyWithImpl;
@override @useResult
$Res call({
 List<HazardSeverityWithCount> hazardSeverities, List<HazardSeverityWithCount> selectedSeverities, bool isFiltersVisible
});




}
/// @nodoc
class __$HazardSeverityFiltersProviderStateCopyWithImpl<$Res>
    implements _$HazardSeverityFiltersProviderStateCopyWith<$Res> {
  __$HazardSeverityFiltersProviderStateCopyWithImpl(this._self, this._then);

  final _HazardSeverityFiltersProviderState _self;
  final $Res Function(_HazardSeverityFiltersProviderState) _then;

/// Create a copy of HazardSeverityFiltersProviderState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hazardSeverities = null,Object? selectedSeverities = null,Object? isFiltersVisible = null,}) {
  return _then(_HazardSeverityFiltersProviderState(
hazardSeverities: null == hazardSeverities ? _self._hazardSeverities : hazardSeverities // ignore: cast_nullable_to_non_nullable
as List<HazardSeverityWithCount>,selectedSeverities: null == selectedSeverities ? _self._selectedSeverities : selectedSeverities // ignore: cast_nullable_to_non_nullable
as List<HazardSeverityWithCount>,isFiltersVisible: null == isFiltersVisible ? _self.isFiltersVisible : isFiltersVisible // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
