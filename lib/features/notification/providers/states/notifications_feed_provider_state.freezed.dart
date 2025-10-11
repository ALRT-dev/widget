// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_feed_provider_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NotificationsFeedProviderState {

/// The search string to filter hazards by their title or description.
 String get searchString;/// The list of selected hazard categories to filter hazards.
 List<HazardCategory> get selectedCategories;/// The list of hazards in the notifications feed.
 List<Hazard> get hazards;/// The state of fetching the notifications feed.
 GetNotificationsFeed get getNotificationsFeed;
/// Create a copy of NotificationsFeedProviderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationsFeedProviderStateCopyWith<NotificationsFeedProviderState> get copyWith => _$NotificationsFeedProviderStateCopyWithImpl<NotificationsFeedProviderState>(this as NotificationsFeedProviderState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsFeedProviderState&&(identical(other.searchString, searchString) || other.searchString == searchString)&&const DeepCollectionEquality().equals(other.selectedCategories, selectedCategories)&&const DeepCollectionEquality().equals(other.hazards, hazards)&&(identical(other.getNotificationsFeed, getNotificationsFeed) || other.getNotificationsFeed == getNotificationsFeed));
}


@override
int get hashCode => Object.hash(runtimeType,searchString,const DeepCollectionEquality().hash(selectedCategories),const DeepCollectionEquality().hash(hazards),getNotificationsFeed);

@override
String toString() {
  return 'NotificationsFeedProviderState(searchString: $searchString, selectedCategories: $selectedCategories, hazards: $hazards, getNotificationsFeed: $getNotificationsFeed)';
}


}

/// @nodoc
abstract mixin class $NotificationsFeedProviderStateCopyWith<$Res>  {
  factory $NotificationsFeedProviderStateCopyWith(NotificationsFeedProviderState value, $Res Function(NotificationsFeedProviderState) _then) = _$NotificationsFeedProviderStateCopyWithImpl;
@useResult
$Res call({
 String searchString, List<HazardCategory> selectedCategories, List<Hazard> hazards, GetNotificationsFeed getNotificationsFeed
});


$GetNotificationsFeedCopyWith<$Res> get getNotificationsFeed;

}
/// @nodoc
class _$NotificationsFeedProviderStateCopyWithImpl<$Res>
    implements $NotificationsFeedProviderStateCopyWith<$Res> {
  _$NotificationsFeedProviderStateCopyWithImpl(this._self, this._then);

  final NotificationsFeedProviderState _self;
  final $Res Function(NotificationsFeedProviderState) _then;

/// Create a copy of NotificationsFeedProviderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? searchString = null,Object? selectedCategories = null,Object? hazards = null,Object? getNotificationsFeed = null,}) {
  return _then(_self.copyWith(
searchString: null == searchString ? _self.searchString : searchString // ignore: cast_nullable_to_non_nullable
as String,selectedCategories: null == selectedCategories ? _self.selectedCategories : selectedCategories // ignore: cast_nullable_to_non_nullable
as List<HazardCategory>,hazards: null == hazards ? _self.hazards : hazards // ignore: cast_nullable_to_non_nullable
as List<Hazard>,getNotificationsFeed: null == getNotificationsFeed ? _self.getNotificationsFeed : getNotificationsFeed // ignore: cast_nullable_to_non_nullable
as GetNotificationsFeed,
  ));
}
/// Create a copy of NotificationsFeedProviderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GetNotificationsFeedCopyWith<$Res> get getNotificationsFeed {
  
  return $GetNotificationsFeedCopyWith<$Res>(_self.getNotificationsFeed, (value) {
    return _then(_self.copyWith(getNotificationsFeed: value));
  });
}
}


/// Adds pattern-matching-related methods to [NotificationsFeedProviderState].
extension NotificationsFeedProviderStatePatterns on NotificationsFeedProviderState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationsFeedProviderState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationsFeedProviderState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationsFeedProviderState value)  $default,){
final _that = this;
switch (_that) {
case _NotificationsFeedProviderState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationsFeedProviderState value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationsFeedProviderState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String searchString,  List<HazardCategory> selectedCategories,  List<Hazard> hazards,  GetNotificationsFeed getNotificationsFeed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationsFeedProviderState() when $default != null:
return $default(_that.searchString,_that.selectedCategories,_that.hazards,_that.getNotificationsFeed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String searchString,  List<HazardCategory> selectedCategories,  List<Hazard> hazards,  GetNotificationsFeed getNotificationsFeed)  $default,) {final _that = this;
switch (_that) {
case _NotificationsFeedProviderState():
return $default(_that.searchString,_that.selectedCategories,_that.hazards,_that.getNotificationsFeed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String searchString,  List<HazardCategory> selectedCategories,  List<Hazard> hazards,  GetNotificationsFeed getNotificationsFeed)?  $default,) {final _that = this;
switch (_that) {
case _NotificationsFeedProviderState() when $default != null:
return $default(_that.searchString,_that.selectedCategories,_that.hazards,_that.getNotificationsFeed);case _:
  return null;

}
}

}

/// @nodoc


class _NotificationsFeedProviderState implements NotificationsFeedProviderState {
  const _NotificationsFeedProviderState({this.searchString = '', final  List<HazardCategory> selectedCategories = const <HazardCategory>[], final  List<Hazard> hazards = const <Hazard>[], this.getNotificationsFeed = const GetNotificationsFeed.initial()}): _selectedCategories = selectedCategories,_hazards = hazards;
  

/// The search string to filter hazards by their title or description.
@override@JsonKey() final  String searchString;
/// The list of selected hazard categories to filter hazards.
 final  List<HazardCategory> _selectedCategories;
/// The list of selected hazard categories to filter hazards.
@override@JsonKey() List<HazardCategory> get selectedCategories {
  if (_selectedCategories is EqualUnmodifiableListView) return _selectedCategories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedCategories);
}

/// The list of hazards in the notifications feed.
 final  List<Hazard> _hazards;
/// The list of hazards in the notifications feed.
@override@JsonKey() List<Hazard> get hazards {
  if (_hazards is EqualUnmodifiableListView) return _hazards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hazards);
}

/// The state of fetching the notifications feed.
@override@JsonKey() final  GetNotificationsFeed getNotificationsFeed;

/// Create a copy of NotificationsFeedProviderState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationsFeedProviderStateCopyWith<_NotificationsFeedProviderState> get copyWith => __$NotificationsFeedProviderStateCopyWithImpl<_NotificationsFeedProviderState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationsFeedProviderState&&(identical(other.searchString, searchString) || other.searchString == searchString)&&const DeepCollectionEquality().equals(other._selectedCategories, _selectedCategories)&&const DeepCollectionEquality().equals(other._hazards, _hazards)&&(identical(other.getNotificationsFeed, getNotificationsFeed) || other.getNotificationsFeed == getNotificationsFeed));
}


@override
int get hashCode => Object.hash(runtimeType,searchString,const DeepCollectionEquality().hash(_selectedCategories),const DeepCollectionEquality().hash(_hazards),getNotificationsFeed);

@override
String toString() {
  return 'NotificationsFeedProviderState(searchString: $searchString, selectedCategories: $selectedCategories, hazards: $hazards, getNotificationsFeed: $getNotificationsFeed)';
}


}

/// @nodoc
abstract mixin class _$NotificationsFeedProviderStateCopyWith<$Res> implements $NotificationsFeedProviderStateCopyWith<$Res> {
  factory _$NotificationsFeedProviderStateCopyWith(_NotificationsFeedProviderState value, $Res Function(_NotificationsFeedProviderState) _then) = __$NotificationsFeedProviderStateCopyWithImpl;
@override @useResult
$Res call({
 String searchString, List<HazardCategory> selectedCategories, List<Hazard> hazards, GetNotificationsFeed getNotificationsFeed
});


@override $GetNotificationsFeedCopyWith<$Res> get getNotificationsFeed;

}
/// @nodoc
class __$NotificationsFeedProviderStateCopyWithImpl<$Res>
    implements _$NotificationsFeedProviderStateCopyWith<$Res> {
  __$NotificationsFeedProviderStateCopyWithImpl(this._self, this._then);

  final _NotificationsFeedProviderState _self;
  final $Res Function(_NotificationsFeedProviderState) _then;

/// Create a copy of NotificationsFeedProviderState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? searchString = null,Object? selectedCategories = null,Object? hazards = null,Object? getNotificationsFeed = null,}) {
  return _then(_NotificationsFeedProviderState(
searchString: null == searchString ? _self.searchString : searchString // ignore: cast_nullable_to_non_nullable
as String,selectedCategories: null == selectedCategories ? _self._selectedCategories : selectedCategories // ignore: cast_nullable_to_non_nullable
as List<HazardCategory>,hazards: null == hazards ? _self._hazards : hazards // ignore: cast_nullable_to_non_nullable
as List<Hazard>,getNotificationsFeed: null == getNotificationsFeed ? _self.getNotificationsFeed : getNotificationsFeed // ignore: cast_nullable_to_non_nullable
as GetNotificationsFeed,
  ));
}

/// Create a copy of NotificationsFeedProviderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GetNotificationsFeedCopyWith<$Res> get getNotificationsFeed {
  
  return $GetNotificationsFeedCopyWith<$Res>(_self.getNotificationsFeed, (value) {
    return _then(_self.copyWith(getNotificationsFeed: value));
  });
}
}

/// @nodoc
mixin _$GetNotificationsFeed {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetNotificationsFeed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetNotificationsFeed()';
}


}

/// @nodoc
class $GetNotificationsFeedCopyWith<$Res>  {
$GetNotificationsFeedCopyWith(GetNotificationsFeed _, $Res Function(GetNotificationsFeed) __);
}


/// Adds pattern-matching-related methods to [GetNotificationsFeed].
extension GetNotificationsFeedPatterns on GetNotificationsFeed {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GetNotificationsFeedInitial value)?  initial,TResult Function( _GetNotificationsFeedLoading value)?  loading,TResult Function( _GetNotificationsFeedSuccess value)?  success,TResult Function( _GetNotificationsFeedError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetNotificationsFeedInitial() when initial != null:
return initial(_that);case _GetNotificationsFeedLoading() when loading != null:
return loading(_that);case _GetNotificationsFeedSuccess() when success != null:
return success(_that);case _GetNotificationsFeedError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GetNotificationsFeedInitial value)  initial,required TResult Function( _GetNotificationsFeedLoading value)  loading,required TResult Function( _GetNotificationsFeedSuccess value)  success,required TResult Function( _GetNotificationsFeedError value)  error,}){
final _that = this;
switch (_that) {
case _GetNotificationsFeedInitial():
return initial(_that);case _GetNotificationsFeedLoading():
return loading(_that);case _GetNotificationsFeedSuccess():
return success(_that);case _GetNotificationsFeedError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GetNotificationsFeedInitial value)?  initial,TResult? Function( _GetNotificationsFeedLoading value)?  loading,TResult? Function( _GetNotificationsFeedSuccess value)?  success,TResult? Function( _GetNotificationsFeedError value)?  error,}){
final _that = this;
switch (_that) {
case _GetNotificationsFeedInitial() when initial != null:
return initial(_that);case _GetNotificationsFeedLoading() when loading != null:
return loading(_that);case _GetNotificationsFeedSuccess() when success != null:
return success(_that);case _GetNotificationsFeedError() when error != null:
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
case _GetNotificationsFeedInitial() when initial != null:
return initial();case _GetNotificationsFeedLoading() when loading != null:
return loading();case _GetNotificationsFeedSuccess() when success != null:
return success(_that.hazards);case _GetNotificationsFeedError() when error != null:
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
case _GetNotificationsFeedInitial():
return initial();case _GetNotificationsFeedLoading():
return loading();case _GetNotificationsFeedSuccess():
return success(_that.hazards);case _GetNotificationsFeedError():
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
case _GetNotificationsFeedInitial() when initial != null:
return initial();case _GetNotificationsFeedLoading() when loading != null:
return loading();case _GetNotificationsFeedSuccess() when success != null:
return success(_that.hazards);case _GetNotificationsFeedError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _GetNotificationsFeedInitial implements GetNotificationsFeed {
  const _GetNotificationsFeedInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetNotificationsFeedInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetNotificationsFeed.initial()';
}


}




/// @nodoc


class _GetNotificationsFeedLoading implements GetNotificationsFeed {
  const _GetNotificationsFeedLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetNotificationsFeedLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetNotificationsFeed.loading()';
}


}




/// @nodoc


class _GetNotificationsFeedSuccess implements GetNotificationsFeed {
  const _GetNotificationsFeedSuccess(final  List<Hazard> hazards): _hazards = hazards;
  

 final  List<Hazard> _hazards;
 List<Hazard> get hazards {
  if (_hazards is EqualUnmodifiableListView) return _hazards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hazards);
}


/// Create a copy of GetNotificationsFeed
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetNotificationsFeedSuccessCopyWith<_GetNotificationsFeedSuccess> get copyWith => __$GetNotificationsFeedSuccessCopyWithImpl<_GetNotificationsFeedSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetNotificationsFeedSuccess&&const DeepCollectionEquality().equals(other._hazards, _hazards));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_hazards));

@override
String toString() {
  return 'GetNotificationsFeed.success(hazards: $hazards)';
}


}

/// @nodoc
abstract mixin class _$GetNotificationsFeedSuccessCopyWith<$Res> implements $GetNotificationsFeedCopyWith<$Res> {
  factory _$GetNotificationsFeedSuccessCopyWith(_GetNotificationsFeedSuccess value, $Res Function(_GetNotificationsFeedSuccess) _then) = __$GetNotificationsFeedSuccessCopyWithImpl;
@useResult
$Res call({
 List<Hazard> hazards
});




}
/// @nodoc
class __$GetNotificationsFeedSuccessCopyWithImpl<$Res>
    implements _$GetNotificationsFeedSuccessCopyWith<$Res> {
  __$GetNotificationsFeedSuccessCopyWithImpl(this._self, this._then);

  final _GetNotificationsFeedSuccess _self;
  final $Res Function(_GetNotificationsFeedSuccess) _then;

/// Create a copy of GetNotificationsFeed
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? hazards = null,}) {
  return _then(_GetNotificationsFeedSuccess(
null == hazards ? _self._hazards : hazards // ignore: cast_nullable_to_non_nullable
as List<Hazard>,
  ));
}


}

/// @nodoc


class _GetNotificationsFeedError implements GetNotificationsFeed {
  const _GetNotificationsFeedError(this.error);
  

 final  AppError error;

/// Create a copy of GetNotificationsFeed
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetNotificationsFeedErrorCopyWith<_GetNotificationsFeedError> get copyWith => __$GetNotificationsFeedErrorCopyWithImpl<_GetNotificationsFeedError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetNotificationsFeedError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'GetNotificationsFeed.error(error: $error)';
}


}

/// @nodoc
abstract mixin class _$GetNotificationsFeedErrorCopyWith<$Res> implements $GetNotificationsFeedCopyWith<$Res> {
  factory _$GetNotificationsFeedErrorCopyWith(_GetNotificationsFeedError value, $Res Function(_GetNotificationsFeedError) _then) = __$GetNotificationsFeedErrorCopyWithImpl;
@useResult
$Res call({
 AppError error
});


$AppErrorCopyWith<$Res> get error;

}
/// @nodoc
class __$GetNotificationsFeedErrorCopyWithImpl<$Res>
    implements _$GetNotificationsFeedErrorCopyWith<$Res> {
  __$GetNotificationsFeedErrorCopyWithImpl(this._self, this._then);

  final _GetNotificationsFeedError _self;
  final $Res Function(_GetNotificationsFeedError) _then;

/// Create a copy of GetNotificationsFeed
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_GetNotificationsFeedError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppError,
  ));
}

/// Create a copy of GetNotificationsFeed
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
