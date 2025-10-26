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
 GetAllHazardCategoriesState get getAllHazardCategoriesState;
/// Create a copy of HazardCategoriesProviderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HazardCategoriesProviderStateCopyWith<HazardCategoriesProviderState> get copyWith => _$HazardCategoriesProviderStateCopyWithImpl<HazardCategoriesProviderState>(this as HazardCategoriesProviderState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HazardCategoriesProviderState&&const DeepCollectionEquality().equals(other.hazardCategories, hazardCategories)&&const DeepCollectionEquality().equals(other.selectedCategories, selectedCategories)&&(identical(other.getAllHazardCategoriesState, getAllHazardCategoriesState) || other.getAllHazardCategoriesState == getAllHazardCategoriesState));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(hazardCategories),const DeepCollectionEquality().hash(selectedCategories),getAllHazardCategoriesState);

@override
String toString() {
  return 'HazardCategoriesProviderState(hazardCategories: $hazardCategories, selectedCategories: $selectedCategories, getAllHazardCategoriesState: $getAllHazardCategoriesState)';
}


}

/// @nodoc
abstract mixin class $HazardCategoriesProviderStateCopyWith<$Res>  {
  factory $HazardCategoriesProviderStateCopyWith(HazardCategoriesProviderState value, $Res Function(HazardCategoriesProviderState) _then) = _$HazardCategoriesProviderStateCopyWithImpl;
@useResult
$Res call({
 List<HazardCategory> hazardCategories, List<HazardCategory> selectedCategories, GetAllHazardCategoriesState getAllHazardCategoriesState
});


$GetAllHazardCategoriesStateCopyWith<$Res> get getAllHazardCategoriesState;

}
/// @nodoc
class _$HazardCategoriesProviderStateCopyWithImpl<$Res>
    implements $HazardCategoriesProviderStateCopyWith<$Res> {
  _$HazardCategoriesProviderStateCopyWithImpl(this._self, this._then);

  final HazardCategoriesProviderState _self;
  final $Res Function(HazardCategoriesProviderState) _then;

/// Create a copy of HazardCategoriesProviderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hazardCategories = null,Object? selectedCategories = null,Object? getAllHazardCategoriesState = null,}) {
  return _then(_self.copyWith(
hazardCategories: null == hazardCategories ? _self.hazardCategories : hazardCategories // ignore: cast_nullable_to_non_nullable
as List<HazardCategory>,selectedCategories: null == selectedCategories ? _self.selectedCategories : selectedCategories // ignore: cast_nullable_to_non_nullable
as List<HazardCategory>,getAllHazardCategoriesState: null == getAllHazardCategoriesState ? _self.getAllHazardCategoriesState : getAllHazardCategoriesState // ignore: cast_nullable_to_non_nullable
as GetAllHazardCategoriesState,
  ));
}
/// Create a copy of HazardCategoriesProviderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GetAllHazardCategoriesStateCopyWith<$Res> get getAllHazardCategoriesState {
  
  return $GetAllHazardCategoriesStateCopyWith<$Res>(_self.getAllHazardCategoriesState, (value) {
    return _then(_self.copyWith(getAllHazardCategoriesState: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<HazardCategory> hazardCategories,  List<HazardCategory> selectedCategories,  GetAllHazardCategoriesState getAllHazardCategoriesState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HazardCategoriesProviderState() when $default != null:
return $default(_that.hazardCategories,_that.selectedCategories,_that.getAllHazardCategoriesState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<HazardCategory> hazardCategories,  List<HazardCategory> selectedCategories,  GetAllHazardCategoriesState getAllHazardCategoriesState)  $default,) {final _that = this;
switch (_that) {
case _HazardCategoriesProviderState():
return $default(_that.hazardCategories,_that.selectedCategories,_that.getAllHazardCategoriesState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<HazardCategory> hazardCategories,  List<HazardCategory> selectedCategories,  GetAllHazardCategoriesState getAllHazardCategoriesState)?  $default,) {final _that = this;
switch (_that) {
case _HazardCategoriesProviderState() when $default != null:
return $default(_that.hazardCategories,_that.selectedCategories,_that.getAllHazardCategoriesState);case _:
  return null;

}
}

}

/// @nodoc


class _HazardCategoriesProviderState implements HazardCategoriesProviderState {
  const _HazardCategoriesProviderState({final  List<HazardCategory> hazardCategories = const <HazardCategory>[], final  List<HazardCategory> selectedCategories = const <HazardCategory>[], this.getAllHazardCategoriesState = const GetAllHazardCategoriesState.initial()}): _hazardCategories = hazardCategories,_selectedCategories = selectedCategories;
  

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
@override@JsonKey() final  GetAllHazardCategoriesState getAllHazardCategoriesState;

/// Create a copy of HazardCategoriesProviderState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HazardCategoriesProviderStateCopyWith<_HazardCategoriesProviderState> get copyWith => __$HazardCategoriesProviderStateCopyWithImpl<_HazardCategoriesProviderState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HazardCategoriesProviderState&&const DeepCollectionEquality().equals(other._hazardCategories, _hazardCategories)&&const DeepCollectionEquality().equals(other._selectedCategories, _selectedCategories)&&(identical(other.getAllHazardCategoriesState, getAllHazardCategoriesState) || other.getAllHazardCategoriesState == getAllHazardCategoriesState));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_hazardCategories),const DeepCollectionEquality().hash(_selectedCategories),getAllHazardCategoriesState);

@override
String toString() {
  return 'HazardCategoriesProviderState(hazardCategories: $hazardCategories, selectedCategories: $selectedCategories, getAllHazardCategoriesState: $getAllHazardCategoriesState)';
}


}

/// @nodoc
abstract mixin class _$HazardCategoriesProviderStateCopyWith<$Res> implements $HazardCategoriesProviderStateCopyWith<$Res> {
  factory _$HazardCategoriesProviderStateCopyWith(_HazardCategoriesProviderState value, $Res Function(_HazardCategoriesProviderState) _then) = __$HazardCategoriesProviderStateCopyWithImpl;
@override @useResult
$Res call({
 List<HazardCategory> hazardCategories, List<HazardCategory> selectedCategories, GetAllHazardCategoriesState getAllHazardCategoriesState
});


@override $GetAllHazardCategoriesStateCopyWith<$Res> get getAllHazardCategoriesState;

}
/// @nodoc
class __$HazardCategoriesProviderStateCopyWithImpl<$Res>
    implements _$HazardCategoriesProviderStateCopyWith<$Res> {
  __$HazardCategoriesProviderStateCopyWithImpl(this._self, this._then);

  final _HazardCategoriesProviderState _self;
  final $Res Function(_HazardCategoriesProviderState) _then;

/// Create a copy of HazardCategoriesProviderState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hazardCategories = null,Object? selectedCategories = null,Object? getAllHazardCategoriesState = null,}) {
  return _then(_HazardCategoriesProviderState(
hazardCategories: null == hazardCategories ? _self._hazardCategories : hazardCategories // ignore: cast_nullable_to_non_nullable
as List<HazardCategory>,selectedCategories: null == selectedCategories ? _self._selectedCategories : selectedCategories // ignore: cast_nullable_to_non_nullable
as List<HazardCategory>,getAllHazardCategoriesState: null == getAllHazardCategoriesState ? _self.getAllHazardCategoriesState : getAllHazardCategoriesState // ignore: cast_nullable_to_non_nullable
as GetAllHazardCategoriesState,
  ));
}

/// Create a copy of HazardCategoriesProviderState
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
