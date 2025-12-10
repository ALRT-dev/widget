// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'temp_provider_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TempProviderState {

/// The state of getting temp data.
 GetTempDataState get getTempDataState;
/// Create a copy of TempProviderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TempProviderStateCopyWith<TempProviderState> get copyWith => _$TempProviderStateCopyWithImpl<TempProviderState>(this as TempProviderState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TempProviderState&&(identical(other.getTempDataState, getTempDataState) || other.getTempDataState == getTempDataState));
}


@override
int get hashCode => Object.hash(runtimeType,getTempDataState);

@override
String toString() {
  return 'TempProviderState(getTempDataState: $getTempDataState)';
}


}

/// @nodoc
abstract mixin class $TempProviderStateCopyWith<$Res>  {
  factory $TempProviderStateCopyWith(TempProviderState value, $Res Function(TempProviderState) _then) = _$TempProviderStateCopyWithImpl;
@useResult
$Res call({
 GetTempDataState getTempDataState
});


$GetTempDataStateCopyWith<$Res> get getTempDataState;

}
/// @nodoc
class _$TempProviderStateCopyWithImpl<$Res>
    implements $TempProviderStateCopyWith<$Res> {
  _$TempProviderStateCopyWithImpl(this._self, this._then);

  final TempProviderState _self;
  final $Res Function(TempProviderState) _then;

/// Create a copy of TempProviderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? getTempDataState = null,}) {
  return _then(_self.copyWith(
getTempDataState: null == getTempDataState ? _self.getTempDataState : getTempDataState // ignore: cast_nullable_to_non_nullable
as GetTempDataState,
  ));
}
/// Create a copy of TempProviderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GetTempDataStateCopyWith<$Res> get getTempDataState {
  
  return $GetTempDataStateCopyWith<$Res>(_self.getTempDataState, (value) {
    return _then(_self.copyWith(getTempDataState: value));
  });
}
}


/// Adds pattern-matching-related methods to [TempProviderState].
extension TempProviderStatePatterns on TempProviderState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TempProviderState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TempProviderState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TempProviderState value)  $default,){
final _that = this;
switch (_that) {
case _TempProviderState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TempProviderState value)?  $default,){
final _that = this;
switch (_that) {
case _TempProviderState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( GetTempDataState getTempDataState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TempProviderState() when $default != null:
return $default(_that.getTempDataState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( GetTempDataState getTempDataState)  $default,) {final _that = this;
switch (_that) {
case _TempProviderState():
return $default(_that.getTempDataState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( GetTempDataState getTempDataState)?  $default,) {final _that = this;
switch (_that) {
case _TempProviderState() when $default != null:
return $default(_that.getTempDataState);case _:
  return null;

}
}

}

/// @nodoc


class _TempProviderState implements TempProviderState {
  const _TempProviderState({this.getTempDataState = const GetTempDataState.initial()});
  

/// The state of getting temp data.
@override@JsonKey() final  GetTempDataState getTempDataState;

/// Create a copy of TempProviderState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TempProviderStateCopyWith<_TempProviderState> get copyWith => __$TempProviderStateCopyWithImpl<_TempProviderState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TempProviderState&&(identical(other.getTempDataState, getTempDataState) || other.getTempDataState == getTempDataState));
}


@override
int get hashCode => Object.hash(runtimeType,getTempDataState);

@override
String toString() {
  return 'TempProviderState(getTempDataState: $getTempDataState)';
}


}

/// @nodoc
abstract mixin class _$TempProviderStateCopyWith<$Res> implements $TempProviderStateCopyWith<$Res> {
  factory _$TempProviderStateCopyWith(_TempProviderState value, $Res Function(_TempProviderState) _then) = __$TempProviderStateCopyWithImpl;
@override @useResult
$Res call({
 GetTempDataState getTempDataState
});


@override $GetTempDataStateCopyWith<$Res> get getTempDataState;

}
/// @nodoc
class __$TempProviderStateCopyWithImpl<$Res>
    implements _$TempProviderStateCopyWith<$Res> {
  __$TempProviderStateCopyWithImpl(this._self, this._then);

  final _TempProviderState _self;
  final $Res Function(_TempProviderState) _then;

/// Create a copy of TempProviderState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? getTempDataState = null,}) {
  return _then(_TempProviderState(
getTempDataState: null == getTempDataState ? _self.getTempDataState : getTempDataState // ignore: cast_nullable_to_non_nullable
as GetTempDataState,
  ));
}

/// Create a copy of TempProviderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GetTempDataStateCopyWith<$Res> get getTempDataState {
  
  return $GetTempDataStateCopyWith<$Res>(_self.getTempDataState, (value) {
    return _then(_self.copyWith(getTempDataState: value));
  });
}
}

/// @nodoc
mixin _$GetTempDataState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetTempDataState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetTempDataState()';
}


}

/// @nodoc
class $GetTempDataStateCopyWith<$Res>  {
$GetTempDataStateCopyWith(GetTempDataState _, $Res Function(GetTempDataState) __);
}


/// Adds pattern-matching-related methods to [GetTempDataState].
extension GetTempDataStatePatterns on GetTempDataState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GetTempDataStateInitial value)?  initial,TResult Function( _GetTempDataStateLoading value)?  loading,TResult Function( _GetTempDataStateSuccess value)?  success,TResult Function( _GetTempDataStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetTempDataStateInitial() when initial != null:
return initial(_that);case _GetTempDataStateLoading() when loading != null:
return loading(_that);case _GetTempDataStateSuccess() when success != null:
return success(_that);case _GetTempDataStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GetTempDataStateInitial value)  initial,required TResult Function( _GetTempDataStateLoading value)  loading,required TResult Function( _GetTempDataStateSuccess value)  success,required TResult Function( _GetTempDataStateError value)  error,}){
final _that = this;
switch (_that) {
case _GetTempDataStateInitial():
return initial(_that);case _GetTempDataStateLoading():
return loading(_that);case _GetTempDataStateSuccess():
return success(_that);case _GetTempDataStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GetTempDataStateInitial value)?  initial,TResult? Function( _GetTempDataStateLoading value)?  loading,TResult? Function( _GetTempDataStateSuccess value)?  success,TResult? Function( _GetTempDataStateError value)?  error,}){
final _that = this;
switch (_that) {
case _GetTempDataStateInitial() when initial != null:
return initial(_that);case _GetTempDataStateLoading() when loading != null:
return loading(_that);case _GetTempDataStateSuccess() when success != null:
return success(_that);case _GetTempDataStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( dynamic result)?  success,TResult Function( AppError error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetTempDataStateInitial() when initial != null:
return initial();case _GetTempDataStateLoading() when loading != null:
return loading();case _GetTempDataStateSuccess() when success != null:
return success(_that.result);case _GetTempDataStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( dynamic result)  success,required TResult Function( AppError error)  error,}) {final _that = this;
switch (_that) {
case _GetTempDataStateInitial():
return initial();case _GetTempDataStateLoading():
return loading();case _GetTempDataStateSuccess():
return success(_that.result);case _GetTempDataStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( dynamic result)?  success,TResult? Function( AppError error)?  error,}) {final _that = this;
switch (_that) {
case _GetTempDataStateInitial() when initial != null:
return initial();case _GetTempDataStateLoading() when loading != null:
return loading();case _GetTempDataStateSuccess() when success != null:
return success(_that.result);case _GetTempDataStateError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _GetTempDataStateInitial implements GetTempDataState {
  const _GetTempDataStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetTempDataStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetTempDataState.initial()';
}


}




/// @nodoc


class _GetTempDataStateLoading implements GetTempDataState {
  const _GetTempDataStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetTempDataStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetTempDataState.loading()';
}


}




/// @nodoc


class _GetTempDataStateSuccess implements GetTempDataState {
  const _GetTempDataStateSuccess(this.result);
  

 final  dynamic result;

/// Create a copy of GetTempDataState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetTempDataStateSuccessCopyWith<_GetTempDataStateSuccess> get copyWith => __$GetTempDataStateSuccessCopyWithImpl<_GetTempDataStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetTempDataStateSuccess&&const DeepCollectionEquality().equals(other.result, result));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(result));

@override
String toString() {
  return 'GetTempDataState.success(result: $result)';
}


}

/// @nodoc
abstract mixin class _$GetTempDataStateSuccessCopyWith<$Res> implements $GetTempDataStateCopyWith<$Res> {
  factory _$GetTempDataStateSuccessCopyWith(_GetTempDataStateSuccess value, $Res Function(_GetTempDataStateSuccess) _then) = __$GetTempDataStateSuccessCopyWithImpl;
@useResult
$Res call({
 dynamic result
});




}
/// @nodoc
class __$GetTempDataStateSuccessCopyWithImpl<$Res>
    implements _$GetTempDataStateSuccessCopyWith<$Res> {
  __$GetTempDataStateSuccessCopyWithImpl(this._self, this._then);

  final _GetTempDataStateSuccess _self;
  final $Res Function(_GetTempDataStateSuccess) _then;

/// Create a copy of GetTempDataState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? result = freezed,}) {
  return _then(_GetTempDataStateSuccess(
freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

/// @nodoc


class _GetTempDataStateError implements GetTempDataState {
  const _GetTempDataStateError(this.error);
  

 final  AppError error;

/// Create a copy of GetTempDataState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetTempDataStateErrorCopyWith<_GetTempDataStateError> get copyWith => __$GetTempDataStateErrorCopyWithImpl<_GetTempDataStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetTempDataStateError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'GetTempDataState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class _$GetTempDataStateErrorCopyWith<$Res> implements $GetTempDataStateCopyWith<$Res> {
  factory _$GetTempDataStateErrorCopyWith(_GetTempDataStateError value, $Res Function(_GetTempDataStateError) _then) = __$GetTempDataStateErrorCopyWithImpl;
@useResult
$Res call({
 AppError error
});


$AppErrorCopyWith<$Res> get error;

}
/// @nodoc
class __$GetTempDataStateErrorCopyWithImpl<$Res>
    implements _$GetTempDataStateErrorCopyWith<$Res> {
  __$GetTempDataStateErrorCopyWithImpl(this._self, this._then);

  final _GetTempDataStateError _self;
  final $Res Function(_GetTempDataStateError) _then;

/// Create a copy of GetTempDataState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_GetTempDataStateError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppError,
  ));
}

/// Create a copy of GetTempDataState
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
