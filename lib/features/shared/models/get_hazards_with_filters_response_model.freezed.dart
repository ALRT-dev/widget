// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_hazards_with_filters_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetHazardsWithFiltersResponse {

/// The list of hazards.
 List<Hazard> get hazards;/// The subscription ID associated with the hazards retrieval.
 String? get subscriptionId;/// The available filters including categories and severities.
 GetAvailableFiltersResponse get availableFilters;
/// Create a copy of GetHazardsWithFiltersResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetHazardsWithFiltersResponseCopyWith<GetHazardsWithFiltersResponse> get copyWith => _$GetHazardsWithFiltersResponseCopyWithImpl<GetHazardsWithFiltersResponse>(this as GetHazardsWithFiltersResponse, _$identity);

  /// Serializes this GetHazardsWithFiltersResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetHazardsWithFiltersResponse&&const DeepCollectionEquality().equals(other.hazards, hazards)&&(identical(other.subscriptionId, subscriptionId) || other.subscriptionId == subscriptionId)&&(identical(other.availableFilters, availableFilters) || other.availableFilters == availableFilters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(hazards),subscriptionId,availableFilters);

@override
String toString() {
  return 'GetHazardsWithFiltersResponse(hazards: $hazards, subscriptionId: $subscriptionId, availableFilters: $availableFilters)';
}


}

/// @nodoc
abstract mixin class $GetHazardsWithFiltersResponseCopyWith<$Res>  {
  factory $GetHazardsWithFiltersResponseCopyWith(GetHazardsWithFiltersResponse value, $Res Function(GetHazardsWithFiltersResponse) _then) = _$GetHazardsWithFiltersResponseCopyWithImpl;
@useResult
$Res call({
 List<Hazard> hazards, String? subscriptionId, GetAvailableFiltersResponse availableFilters
});


$GetAvailableFiltersResponseCopyWith<$Res> get availableFilters;

}
/// @nodoc
class _$GetHazardsWithFiltersResponseCopyWithImpl<$Res>
    implements $GetHazardsWithFiltersResponseCopyWith<$Res> {
  _$GetHazardsWithFiltersResponseCopyWithImpl(this._self, this._then);

  final GetHazardsWithFiltersResponse _self;
  final $Res Function(GetHazardsWithFiltersResponse) _then;

/// Create a copy of GetHazardsWithFiltersResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hazards = null,Object? subscriptionId = freezed,Object? availableFilters = null,}) {
  return _then(_self.copyWith(
hazards: null == hazards ? _self.hazards : hazards // ignore: cast_nullable_to_non_nullable
as List<Hazard>,subscriptionId: freezed == subscriptionId ? _self.subscriptionId : subscriptionId // ignore: cast_nullable_to_non_nullable
as String?,availableFilters: null == availableFilters ? _self.availableFilters : availableFilters // ignore: cast_nullable_to_non_nullable
as GetAvailableFiltersResponse,
  ));
}
/// Create a copy of GetHazardsWithFiltersResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GetAvailableFiltersResponseCopyWith<$Res> get availableFilters {
  
  return $GetAvailableFiltersResponseCopyWith<$Res>(_self.availableFilters, (value) {
    return _then(_self.copyWith(availableFilters: value));
  });
}
}


/// Adds pattern-matching-related methods to [GetHazardsWithFiltersResponse].
extension GetHazardsWithFiltersResponsePatterns on GetHazardsWithFiltersResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetHazardsWithFiltersResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetHazardsWithFiltersResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetHazardsWithFiltersResponse value)  $default,){
final _that = this;
switch (_that) {
case _GetHazardsWithFiltersResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetHazardsWithFiltersResponse value)?  $default,){
final _that = this;
switch (_that) {
case _GetHazardsWithFiltersResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Hazard> hazards,  String? subscriptionId,  GetAvailableFiltersResponse availableFilters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetHazardsWithFiltersResponse() when $default != null:
return $default(_that.hazards,_that.subscriptionId,_that.availableFilters);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Hazard> hazards,  String? subscriptionId,  GetAvailableFiltersResponse availableFilters)  $default,) {final _that = this;
switch (_that) {
case _GetHazardsWithFiltersResponse():
return $default(_that.hazards,_that.subscriptionId,_that.availableFilters);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Hazard> hazards,  String? subscriptionId,  GetAvailableFiltersResponse availableFilters)?  $default,) {final _that = this;
switch (_that) {
case _GetHazardsWithFiltersResponse() when $default != null:
return $default(_that.hazards,_that.subscriptionId,_that.availableFilters);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetHazardsWithFiltersResponse implements GetHazardsWithFiltersResponse {
  const _GetHazardsWithFiltersResponse({final  List<Hazard> hazards = const <Hazard>[], this.subscriptionId, this.availableFilters = const GetAvailableFiltersResponse()}): _hazards = hazards;
  factory _GetHazardsWithFiltersResponse.fromJson(Map<String, dynamic> json) => _$GetHazardsWithFiltersResponseFromJson(json);

/// The list of hazards.
 final  List<Hazard> _hazards;
/// The list of hazards.
@override@JsonKey() List<Hazard> get hazards {
  if (_hazards is EqualUnmodifiableListView) return _hazards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hazards);
}

/// The subscription ID associated with the hazards retrieval.
@override final  String? subscriptionId;
/// The available filters including categories and severities.
@override@JsonKey() final  GetAvailableFiltersResponse availableFilters;

/// Create a copy of GetHazardsWithFiltersResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetHazardsWithFiltersResponseCopyWith<_GetHazardsWithFiltersResponse> get copyWith => __$GetHazardsWithFiltersResponseCopyWithImpl<_GetHazardsWithFiltersResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetHazardsWithFiltersResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetHazardsWithFiltersResponse&&const DeepCollectionEquality().equals(other._hazards, _hazards)&&(identical(other.subscriptionId, subscriptionId) || other.subscriptionId == subscriptionId)&&(identical(other.availableFilters, availableFilters) || other.availableFilters == availableFilters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_hazards),subscriptionId,availableFilters);

@override
String toString() {
  return 'GetHazardsWithFiltersResponse(hazards: $hazards, subscriptionId: $subscriptionId, availableFilters: $availableFilters)';
}


}

/// @nodoc
abstract mixin class _$GetHazardsWithFiltersResponseCopyWith<$Res> implements $GetHazardsWithFiltersResponseCopyWith<$Res> {
  factory _$GetHazardsWithFiltersResponseCopyWith(_GetHazardsWithFiltersResponse value, $Res Function(_GetHazardsWithFiltersResponse) _then) = __$GetHazardsWithFiltersResponseCopyWithImpl;
@override @useResult
$Res call({
 List<Hazard> hazards, String? subscriptionId, GetAvailableFiltersResponse availableFilters
});


@override $GetAvailableFiltersResponseCopyWith<$Res> get availableFilters;

}
/// @nodoc
class __$GetHazardsWithFiltersResponseCopyWithImpl<$Res>
    implements _$GetHazardsWithFiltersResponseCopyWith<$Res> {
  __$GetHazardsWithFiltersResponseCopyWithImpl(this._self, this._then);

  final _GetHazardsWithFiltersResponse _self;
  final $Res Function(_GetHazardsWithFiltersResponse) _then;

/// Create a copy of GetHazardsWithFiltersResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hazards = null,Object? subscriptionId = freezed,Object? availableFilters = null,}) {
  return _then(_GetHazardsWithFiltersResponse(
hazards: null == hazards ? _self._hazards : hazards // ignore: cast_nullable_to_non_nullable
as List<Hazard>,subscriptionId: freezed == subscriptionId ? _self.subscriptionId : subscriptionId // ignore: cast_nullable_to_non_nullable
as String?,availableFilters: null == availableFilters ? _self.availableFilters : availableFilters // ignore: cast_nullable_to_non_nullable
as GetAvailableFiltersResponse,
  ));
}

/// Create a copy of GetHazardsWithFiltersResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GetAvailableFiltersResponseCopyWith<$Res> get availableFilters {
  
  return $GetAvailableFiltersResponseCopyWith<$Res>(_self.availableFilters, (value) {
    return _then(_self.copyWith(availableFilters: value));
  });
}
}

// dart format on
