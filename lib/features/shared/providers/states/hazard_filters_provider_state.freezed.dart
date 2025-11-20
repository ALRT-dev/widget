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

/// AWS Emergency Level Filters
 bool get isAwsEmergency; bool get isAwsWatchAndAct; bool get isAwsAdvice;/// Other Source Filters
 bool get isOfficialNonAws; bool get isUserReported;/// Category selection state
 Set<String> get selectedCategoryIds;
/// Create a copy of HazardFiltersProviderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HazardFiltersProviderStateCopyWith<HazardFiltersProviderState> get copyWith => _$HazardFiltersProviderStateCopyWithImpl<HazardFiltersProviderState>(this as HazardFiltersProviderState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HazardFiltersProviderState&&(identical(other.isAwsEmergency, isAwsEmergency) || other.isAwsEmergency == isAwsEmergency)&&(identical(other.isAwsWatchAndAct, isAwsWatchAndAct) || other.isAwsWatchAndAct == isAwsWatchAndAct)&&(identical(other.isAwsAdvice, isAwsAdvice) || other.isAwsAdvice == isAwsAdvice)&&(identical(other.isOfficialNonAws, isOfficialNonAws) || other.isOfficialNonAws == isOfficialNonAws)&&(identical(other.isUserReported, isUserReported) || other.isUserReported == isUserReported)&&const DeepCollectionEquality().equals(other.selectedCategoryIds, selectedCategoryIds));
}


@override
int get hashCode => Object.hash(runtimeType,isAwsEmergency,isAwsWatchAndAct,isAwsAdvice,isOfficialNonAws,isUserReported,const DeepCollectionEquality().hash(selectedCategoryIds));

@override
String toString() {
  return 'HazardFiltersProviderState(isAwsEmergency: $isAwsEmergency, isAwsWatchAndAct: $isAwsWatchAndAct, isAwsAdvice: $isAwsAdvice, isOfficialNonAws: $isOfficialNonAws, isUserReported: $isUserReported, selectedCategoryIds: $selectedCategoryIds)';
}


}

/// @nodoc
abstract mixin class $HazardFiltersProviderStateCopyWith<$Res>  {
  factory $HazardFiltersProviderStateCopyWith(HazardFiltersProviderState value, $Res Function(HazardFiltersProviderState) _then) = _$HazardFiltersProviderStateCopyWithImpl;
@useResult
$Res call({
 bool isAwsEmergency, bool isAwsWatchAndAct, bool isAwsAdvice, bool isOfficialNonAws, bool isUserReported, Set<String> selectedCategoryIds
});




}
/// @nodoc
class _$HazardFiltersProviderStateCopyWithImpl<$Res>
    implements $HazardFiltersProviderStateCopyWith<$Res> {
  _$HazardFiltersProviderStateCopyWithImpl(this._self, this._then);

  final HazardFiltersProviderState _self;
  final $Res Function(HazardFiltersProviderState) _then;

/// Create a copy of HazardFiltersProviderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isAwsEmergency = null,Object? isAwsWatchAndAct = null,Object? isAwsAdvice = null,Object? isOfficialNonAws = null,Object? isUserReported = null,Object? selectedCategoryIds = null,}) {
  return _then(_self.copyWith(
isAwsEmergency: null == isAwsEmergency ? _self.isAwsEmergency : isAwsEmergency // ignore: cast_nullable_to_non_nullable
as bool,isAwsWatchAndAct: null == isAwsWatchAndAct ? _self.isAwsWatchAndAct : isAwsWatchAndAct // ignore: cast_nullable_to_non_nullable
as bool,isAwsAdvice: null == isAwsAdvice ? _self.isAwsAdvice : isAwsAdvice // ignore: cast_nullable_to_non_nullable
as bool,isOfficialNonAws: null == isOfficialNonAws ? _self.isOfficialNonAws : isOfficialNonAws // ignore: cast_nullable_to_non_nullable
as bool,isUserReported: null == isUserReported ? _self.isUserReported : isUserReported // ignore: cast_nullable_to_non_nullable
as bool,selectedCategoryIds: null == selectedCategoryIds ? _self.selectedCategoryIds : selectedCategoryIds // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isAwsEmergency,  bool isAwsWatchAndAct,  bool isAwsAdvice,  bool isOfficialNonAws,  bool isUserReported,  Set<String> selectedCategoryIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HazardFiltersProviderState() when $default != null:
return $default(_that.isAwsEmergency,_that.isAwsWatchAndAct,_that.isAwsAdvice,_that.isOfficialNonAws,_that.isUserReported,_that.selectedCategoryIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isAwsEmergency,  bool isAwsWatchAndAct,  bool isAwsAdvice,  bool isOfficialNonAws,  bool isUserReported,  Set<String> selectedCategoryIds)  $default,) {final _that = this;
switch (_that) {
case _HazardFiltersProviderState():
return $default(_that.isAwsEmergency,_that.isAwsWatchAndAct,_that.isAwsAdvice,_that.isOfficialNonAws,_that.isUserReported,_that.selectedCategoryIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isAwsEmergency,  bool isAwsWatchAndAct,  bool isAwsAdvice,  bool isOfficialNonAws,  bool isUserReported,  Set<String> selectedCategoryIds)?  $default,) {final _that = this;
switch (_that) {
case _HazardFiltersProviderState() when $default != null:
return $default(_that.isAwsEmergency,_that.isAwsWatchAndAct,_that.isAwsAdvice,_that.isOfficialNonAws,_that.isUserReported,_that.selectedCategoryIds);case _:
  return null;

}
}

}

/// @nodoc


class _HazardFiltersProviderState extends HazardFiltersProviderState {
  const _HazardFiltersProviderState({this.isAwsEmergency = false, this.isAwsWatchAndAct = false, this.isAwsAdvice = false, this.isOfficialNonAws = false, this.isUserReported = false, final  Set<String> selectedCategoryIds = const <String>{}}): _selectedCategoryIds = selectedCategoryIds,super._();
  

/// AWS Emergency Level Filters
@override@JsonKey() final  bool isAwsEmergency;
@override@JsonKey() final  bool isAwsWatchAndAct;
@override@JsonKey() final  bool isAwsAdvice;
/// Other Source Filters
@override@JsonKey() final  bool isOfficialNonAws;
@override@JsonKey() final  bool isUserReported;
/// Category selection state
 final  Set<String> _selectedCategoryIds;
/// Category selection state
@override@JsonKey() Set<String> get selectedCategoryIds {
  if (_selectedCategoryIds is EqualUnmodifiableSetView) return _selectedCategoryIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_selectedCategoryIds);
}


/// Create a copy of HazardFiltersProviderState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HazardFiltersProviderStateCopyWith<_HazardFiltersProviderState> get copyWith => __$HazardFiltersProviderStateCopyWithImpl<_HazardFiltersProviderState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HazardFiltersProviderState&&(identical(other.isAwsEmergency, isAwsEmergency) || other.isAwsEmergency == isAwsEmergency)&&(identical(other.isAwsWatchAndAct, isAwsWatchAndAct) || other.isAwsWatchAndAct == isAwsWatchAndAct)&&(identical(other.isAwsAdvice, isAwsAdvice) || other.isAwsAdvice == isAwsAdvice)&&(identical(other.isOfficialNonAws, isOfficialNonAws) || other.isOfficialNonAws == isOfficialNonAws)&&(identical(other.isUserReported, isUserReported) || other.isUserReported == isUserReported)&&const DeepCollectionEquality().equals(other._selectedCategoryIds, _selectedCategoryIds));
}


@override
int get hashCode => Object.hash(runtimeType,isAwsEmergency,isAwsWatchAndAct,isAwsAdvice,isOfficialNonAws,isUserReported,const DeepCollectionEquality().hash(_selectedCategoryIds));

@override
String toString() {
  return 'HazardFiltersProviderState(isAwsEmergency: $isAwsEmergency, isAwsWatchAndAct: $isAwsWatchAndAct, isAwsAdvice: $isAwsAdvice, isOfficialNonAws: $isOfficialNonAws, isUserReported: $isUserReported, selectedCategoryIds: $selectedCategoryIds)';
}


}

/// @nodoc
abstract mixin class _$HazardFiltersProviderStateCopyWith<$Res> implements $HazardFiltersProviderStateCopyWith<$Res> {
  factory _$HazardFiltersProviderStateCopyWith(_HazardFiltersProviderState value, $Res Function(_HazardFiltersProviderState) _then) = __$HazardFiltersProviderStateCopyWithImpl;
@override @useResult
$Res call({
 bool isAwsEmergency, bool isAwsWatchAndAct, bool isAwsAdvice, bool isOfficialNonAws, bool isUserReported, Set<String> selectedCategoryIds
});




}
/// @nodoc
class __$HazardFiltersProviderStateCopyWithImpl<$Res>
    implements _$HazardFiltersProviderStateCopyWith<$Res> {
  __$HazardFiltersProviderStateCopyWithImpl(this._self, this._then);

  final _HazardFiltersProviderState _self;
  final $Res Function(_HazardFiltersProviderState) _then;

/// Create a copy of HazardFiltersProviderState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isAwsEmergency = null,Object? isAwsWatchAndAct = null,Object? isAwsAdvice = null,Object? isOfficialNonAws = null,Object? isUserReported = null,Object? selectedCategoryIds = null,}) {
  return _then(_HazardFiltersProviderState(
isAwsEmergency: null == isAwsEmergency ? _self.isAwsEmergency : isAwsEmergency // ignore: cast_nullable_to_non_nullable
as bool,isAwsWatchAndAct: null == isAwsWatchAndAct ? _self.isAwsWatchAndAct : isAwsWatchAndAct // ignore: cast_nullable_to_non_nullable
as bool,isAwsAdvice: null == isAwsAdvice ? _self.isAwsAdvice : isAwsAdvice // ignore: cast_nullable_to_non_nullable
as bool,isOfficialNonAws: null == isOfficialNonAws ? _self.isOfficialNonAws : isOfficialNonAws // ignore: cast_nullable_to_non_nullable
as bool,isUserReported: null == isUserReported ? _self.isUserReported : isUserReported // ignore: cast_nullable_to_non_nullable
as bool,selectedCategoryIds: null == selectedCategoryIds ? _self._selectedCategoryIds : selectedCategoryIds // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}


}

// dart format on
