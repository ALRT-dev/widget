// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hazard_categories_provider_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HazardCategoriesProviderState {

/// The list of hazard categories fetched from the service.
 List<HazardCategory> get hazardCategories;/// The list of categories selected by the user.
 List<HazardCategory> get selectedCategories;/// The state of fetching hazard categories.
 GetHazardCategoriesState get getHazardCategoriesState;
/// Create a copy of HazardCategoriesProviderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HazardCategoriesProviderStateCopyWith<HazardCategoriesProviderState> get copyWith => _$HazardCategoriesProviderStateCopyWithImpl<HazardCategoriesProviderState>(this as HazardCategoriesProviderState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HazardCategoriesProviderState&&const DeepCollectionEquality().equals(other.hazardCategories, hazardCategories)&&const DeepCollectionEquality().equals(other.selectedCategories, selectedCategories)&&(identical(other.getHazardCategoriesState, getHazardCategoriesState) || other.getHazardCategoriesState == getHazardCategoriesState));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(hazardCategories),const DeepCollectionEquality().hash(selectedCategories),getHazardCategoriesState);

@override
String toString() {
  return 'HazardCategoriesProviderState(hazardCategories: $hazardCategories, selectedCategories: $selectedCategories, getHazardCategoriesState: $getHazardCategoriesState)';
}


}

/// @nodoc
abstract mixin class $HazardCategoriesProviderStateCopyWith<$Res>  {
  factory $HazardCategoriesProviderStateCopyWith(HazardCategoriesProviderState value, $Res Function(HazardCategoriesProviderState) _then) = _$HazardCategoriesProviderStateCopyWithImpl;
@useResult
$Res call({
 List<HazardCategory> hazardCategories, List<HazardCategory> selectedCategories, GetHazardCategoriesState getHazardCategoriesState
});


$GetHazardCategoriesStateCopyWith<$Res> get getHazardCategoriesState;

}
/// @nodoc
class _$HazardCategoriesProviderStateCopyWithImpl<$Res>
    implements $HazardCategoriesProviderStateCopyWith<$Res> {
  _$HazardCategoriesProviderStateCopyWithImpl(this._self, this._then);

  final HazardCategoriesProviderState _self;
  final $Res Function(HazardCategoriesProviderState) _then;

/// Create a copy of HazardCategoriesProviderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hazardCategories = null,Object? selectedCategories = null,Object? getHazardCategoriesState = null,}) {
  return _then(_self.copyWith(
hazardCategories: null == hazardCategories ? _self.hazardCategories : hazardCategories // ignore: cast_nullable_to_non_nullable
as List<HazardCategory>,selectedCategories: null == selectedCategories ? _self.selectedCategories : selectedCategories // ignore: cast_nullable_to_non_nullable
as List<HazardCategory>,getHazardCategoriesState: null == getHazardCategoriesState ? _self.getHazardCategoriesState : getHazardCategoriesState // ignore: cast_nullable_to_non_nullable
as GetHazardCategoriesState,
  ));
}
/// Create a copy of HazardCategoriesProviderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GetHazardCategoriesStateCopyWith<$Res> get getHazardCategoriesState {
  
  return $GetHazardCategoriesStateCopyWith<$Res>(_self.getHazardCategoriesState, (value) {
    return _then(_self.copyWith(getHazardCategoriesState: value));
  });
}
}


/// Adds pattern-matching-related methods to [HazardCategoriesProviderState].
extension HazardCategoriesProviderStatePatterns on HazardCategoriesProviderState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HazardCategoriesProviderState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HazardCategoriesProviderState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HazardCategoriesProviderState value)  $default,){
final _that = this;
switch (_that) {
case _HazardCategoriesProviderState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HazardCategoriesProviderState value)?  $default,){
final _that = this;
switch (_that) {
case _HazardCategoriesProviderState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<HazardCategory> hazardCategories,  List<HazardCategory> selectedCategories,  GetHazardCategoriesState getHazardCategoriesState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HazardCategoriesProviderState() when $default != null:
return $default(_that.hazardCategories,_that.selectedCategories,_that.getHazardCategoriesState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<HazardCategory> hazardCategories,  List<HazardCategory> selectedCategories,  GetHazardCategoriesState getHazardCategoriesState)  $default,) {final _that = this;
switch (_that) {
case _HazardCategoriesProviderState():
return $default(_that.hazardCategories,_that.selectedCategories,_that.getHazardCategoriesState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<HazardCategory> hazardCategories,  List<HazardCategory> selectedCategories,  GetHazardCategoriesState getHazardCategoriesState)?  $default,) {final _that = this;
switch (_that) {
case _HazardCategoriesProviderState() when $default != null:
return $default(_that.hazardCategories,_that.selectedCategories,_that.getHazardCategoriesState);case _:
  return null;

}
}

}

/// @nodoc


class _HazardCategoriesProviderState implements HazardCategoriesProviderState {
  const _HazardCategoriesProviderState({final  List<HazardCategory> hazardCategories = const <HazardCategory>[], final  List<HazardCategory> selectedCategories = const <HazardCategory>[], this.getHazardCategoriesState = const GetHazardCategoriesState.initial()}): _hazardCategories = hazardCategories,_selectedCategories = selectedCategories;
  

/// The list of hazard categories fetched from the service.
 final  List<HazardCategory> _hazardCategories;
/// The list of hazard categories fetched from the service.
@override@JsonKey() List<HazardCategory> get hazardCategories {
  if (_hazardCategories is EqualUnmodifiableListView) return _hazardCategories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hazardCategories);
}

/// The list of categories selected by the user.
 final  List<HazardCategory> _selectedCategories;
/// The list of categories selected by the user.
@override@JsonKey() List<HazardCategory> get selectedCategories {
  if (_selectedCategories is EqualUnmodifiableListView) return _selectedCategories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedCategories);
}

/// The state of fetching hazard categories.
@override@JsonKey() final  GetHazardCategoriesState getHazardCategoriesState;

/// Create a copy of HazardCategoriesProviderState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HazardCategoriesProviderStateCopyWith<_HazardCategoriesProviderState> get copyWith => __$HazardCategoriesProviderStateCopyWithImpl<_HazardCategoriesProviderState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HazardCategoriesProviderState&&const DeepCollectionEquality().equals(other._hazardCategories, _hazardCategories)&&const DeepCollectionEquality().equals(other._selectedCategories, _selectedCategories)&&(identical(other.getHazardCategoriesState, getHazardCategoriesState) || other.getHazardCategoriesState == getHazardCategoriesState));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_hazardCategories),const DeepCollectionEquality().hash(_selectedCategories),getHazardCategoriesState);

@override
String toString() {
  return 'HazardCategoriesProviderState(hazardCategories: $hazardCategories, selectedCategories: $selectedCategories, getHazardCategoriesState: $getHazardCategoriesState)';
}


}

/// @nodoc
abstract mixin class _$HazardCategoriesProviderStateCopyWith<$Res> implements $HazardCategoriesProviderStateCopyWith<$Res> {
  factory _$HazardCategoriesProviderStateCopyWith(_HazardCategoriesProviderState value, $Res Function(_HazardCategoriesProviderState) _then) = __$HazardCategoriesProviderStateCopyWithImpl;
@override @useResult
$Res call({
 List<HazardCategory> hazardCategories, List<HazardCategory> selectedCategories, GetHazardCategoriesState getHazardCategoriesState
});


@override $GetHazardCategoriesStateCopyWith<$Res> get getHazardCategoriesState;

}
/// @nodoc
class __$HazardCategoriesProviderStateCopyWithImpl<$Res>
    implements _$HazardCategoriesProviderStateCopyWith<$Res> {
  __$HazardCategoriesProviderStateCopyWithImpl(this._self, this._then);

  final _HazardCategoriesProviderState _self;
  final $Res Function(_HazardCategoriesProviderState) _then;

/// Create a copy of HazardCategoriesProviderState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hazardCategories = null,Object? selectedCategories = null,Object? getHazardCategoriesState = null,}) {
  return _then(_HazardCategoriesProviderState(
hazardCategories: null == hazardCategories ? _self._hazardCategories : hazardCategories // ignore: cast_nullable_to_non_nullable
as List<HazardCategory>,selectedCategories: null == selectedCategories ? _self._selectedCategories : selectedCategories // ignore: cast_nullable_to_non_nullable
as List<HazardCategory>,getHazardCategoriesState: null == getHazardCategoriesState ? _self.getHazardCategoriesState : getHazardCategoriesState // ignore: cast_nullable_to_non_nullable
as GetHazardCategoriesState,
  ));
}

/// Create a copy of HazardCategoriesProviderState
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
