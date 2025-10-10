// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_hazards_with_categories_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetHazardsWithCategoriesResponse {

 List<Hazard> get hazards; List<HazardCategory> get categories; String? get subscriptionId;
/// Create a copy of GetHazardsWithCategoriesResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetHazardsWithCategoriesResponseCopyWith<GetHazardsWithCategoriesResponse> get copyWith => _$GetHazardsWithCategoriesResponseCopyWithImpl<GetHazardsWithCategoriesResponse>(this as GetHazardsWithCategoriesResponse, _$identity);

  /// Serializes this GetHazardsWithCategoriesResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetHazardsWithCategoriesResponse&&const DeepCollectionEquality().equals(other.hazards, hazards)&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.subscriptionId, subscriptionId) || other.subscriptionId == subscriptionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(hazards),const DeepCollectionEquality().hash(categories),subscriptionId);

@override
String toString() {
  return 'GetHazardsWithCategoriesResponse(hazards: $hazards, categories: $categories, subscriptionId: $subscriptionId)';
}


}

/// @nodoc
abstract mixin class $GetHazardsWithCategoriesResponseCopyWith<$Res>  {
  factory $GetHazardsWithCategoriesResponseCopyWith(GetHazardsWithCategoriesResponse value, $Res Function(GetHazardsWithCategoriesResponse) _then) = _$GetHazardsWithCategoriesResponseCopyWithImpl;
@useResult
$Res call({
 List<Hazard> hazards, List<HazardCategory> categories, String? subscriptionId
});




}
/// @nodoc
class _$GetHazardsWithCategoriesResponseCopyWithImpl<$Res>
    implements $GetHazardsWithCategoriesResponseCopyWith<$Res> {
  _$GetHazardsWithCategoriesResponseCopyWithImpl(this._self, this._then);

  final GetHazardsWithCategoriesResponse _self;
  final $Res Function(GetHazardsWithCategoriesResponse) _then;

/// Create a copy of GetHazardsWithCategoriesResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hazards = null,Object? categories = null,Object? subscriptionId = freezed,}) {
  return _then(_self.copyWith(
hazards: null == hazards ? _self.hazards : hazards // ignore: cast_nullable_to_non_nullable
as List<Hazard>,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<HazardCategory>,subscriptionId: freezed == subscriptionId ? _self.subscriptionId : subscriptionId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GetHazardsWithCategoriesResponse].
extension GetHazardsWithCategoriesResponsePatterns on GetHazardsWithCategoriesResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetHazardsWithCategoriesResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetHazardsWithCategoriesResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetHazardsWithCategoriesResponse value)  $default,){
final _that = this;
switch (_that) {
case _GetHazardsWithCategoriesResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetHazardsWithCategoriesResponse value)?  $default,){
final _that = this;
switch (_that) {
case _GetHazardsWithCategoriesResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Hazard> hazards,  List<HazardCategory> categories,  String? subscriptionId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetHazardsWithCategoriesResponse() when $default != null:
return $default(_that.hazards,_that.categories,_that.subscriptionId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Hazard> hazards,  List<HazardCategory> categories,  String? subscriptionId)  $default,) {final _that = this;
switch (_that) {
case _GetHazardsWithCategoriesResponse():
return $default(_that.hazards,_that.categories,_that.subscriptionId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Hazard> hazards,  List<HazardCategory> categories,  String? subscriptionId)?  $default,) {final _that = this;
switch (_that) {
case _GetHazardsWithCategoriesResponse() when $default != null:
return $default(_that.hazards,_that.categories,_that.subscriptionId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetHazardsWithCategoriesResponse implements GetHazardsWithCategoriesResponse {
  const _GetHazardsWithCategoriesResponse({required final  List<Hazard> hazards, required final  List<HazardCategory> categories, this.subscriptionId}): _hazards = hazards,_categories = categories;
  factory _GetHazardsWithCategoriesResponse.fromJson(Map<String, dynamic> json) => _$GetHazardsWithCategoriesResponseFromJson(json);

 final  List<Hazard> _hazards;
@override List<Hazard> get hazards {
  if (_hazards is EqualUnmodifiableListView) return _hazards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hazards);
}

 final  List<HazardCategory> _categories;
@override List<HazardCategory> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

@override final  String? subscriptionId;

/// Create a copy of GetHazardsWithCategoriesResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetHazardsWithCategoriesResponseCopyWith<_GetHazardsWithCategoriesResponse> get copyWith => __$GetHazardsWithCategoriesResponseCopyWithImpl<_GetHazardsWithCategoriesResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetHazardsWithCategoriesResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetHazardsWithCategoriesResponse&&const DeepCollectionEquality().equals(other._hazards, _hazards)&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.subscriptionId, subscriptionId) || other.subscriptionId == subscriptionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_hazards),const DeepCollectionEquality().hash(_categories),subscriptionId);

@override
String toString() {
  return 'GetHazardsWithCategoriesResponse(hazards: $hazards, categories: $categories, subscriptionId: $subscriptionId)';
}


}

/// @nodoc
abstract mixin class _$GetHazardsWithCategoriesResponseCopyWith<$Res> implements $GetHazardsWithCategoriesResponseCopyWith<$Res> {
  factory _$GetHazardsWithCategoriesResponseCopyWith(_GetHazardsWithCategoriesResponse value, $Res Function(_GetHazardsWithCategoriesResponse) _then) = __$GetHazardsWithCategoriesResponseCopyWithImpl;
@override @useResult
$Res call({
 List<Hazard> hazards, List<HazardCategory> categories, String? subscriptionId
});




}
/// @nodoc
class __$GetHazardsWithCategoriesResponseCopyWithImpl<$Res>
    implements _$GetHazardsWithCategoriesResponseCopyWith<$Res> {
  __$GetHazardsWithCategoriesResponseCopyWithImpl(this._self, this._then);

  final _GetHazardsWithCategoriesResponse _self;
  final $Res Function(_GetHazardsWithCategoriesResponse) _then;

/// Create a copy of GetHazardsWithCategoriesResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hazards = null,Object? categories = null,Object? subscriptionId = freezed,}) {
  return _then(_GetHazardsWithCategoriesResponse(
hazards: null == hazards ? _self._hazards : hazards // ignore: cast_nullable_to_non_nullable
as List<Hazard>,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<HazardCategory>,subscriptionId: freezed == subscriptionId ? _self.subscriptionId : subscriptionId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
