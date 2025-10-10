// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hazard_search_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HazardSearchParams {

/// The search string to filter hazards by their title or description.
 String? get searchString;/// The list of category IDs to filter hazards.
 List<String> get categoryIds;/// The latitude for location-based filtering.
@JsonKey(name: 'lat') double? get latitude;/// The longitude for location-based filtering.
@JsonKey(name: 'lng') double? get longitude;/// The bounds for location-based filtering.
///
/// If provided, [latitude] and [longitude] will be ignored.
 double? get northeastLat;/// The bounds for location-based filtering.
///
/// If provided, [latitude] and [longitude] will be ignored.
 double? get northeastLng;/// The bounds for location-based filtering.
///
/// If provided, [latitude] and [longitude] will be ignored.
 double? get southwestLat;/// The bounds for location-based filtering.
///
/// If provided, [latitude] and [longitude] will be ignored.
 double? get southwestLng;/// The page number for pagination.
 int get page;/// The number of items per page for pagination.
 int get pageSize;
/// Create a copy of HazardSearchParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HazardSearchParamsCopyWith<HazardSearchParams> get copyWith => _$HazardSearchParamsCopyWithImpl<HazardSearchParams>(this as HazardSearchParams, _$identity);

  /// Serializes this HazardSearchParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HazardSearchParams&&(identical(other.searchString, searchString) || other.searchString == searchString)&&const DeepCollectionEquality().equals(other.categoryIds, categoryIds)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.northeastLat, northeastLat) || other.northeastLat == northeastLat)&&(identical(other.northeastLng, northeastLng) || other.northeastLng == northeastLng)&&(identical(other.southwestLat, southwestLat) || other.southwestLat == southwestLat)&&(identical(other.southwestLng, southwestLng) || other.southwestLng == southwestLng)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,searchString,const DeepCollectionEquality().hash(categoryIds),latitude,longitude,northeastLat,northeastLng,southwestLat,southwestLng,page,pageSize);

@override
String toString() {
  return 'HazardSearchParams(searchString: $searchString, categoryIds: $categoryIds, latitude: $latitude, longitude: $longitude, northeastLat: $northeastLat, northeastLng: $northeastLng, southwestLat: $southwestLat, southwestLng: $southwestLng, page: $page, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class $HazardSearchParamsCopyWith<$Res>  {
  factory $HazardSearchParamsCopyWith(HazardSearchParams value, $Res Function(HazardSearchParams) _then) = _$HazardSearchParamsCopyWithImpl;
@useResult
$Res call({
 String? searchString, List<String> categoryIds,@JsonKey(name: 'lat') double? latitude,@JsonKey(name: 'lng') double? longitude, double? northeastLat, double? northeastLng, double? southwestLat, double? southwestLng, int page, int pageSize
});




}
/// @nodoc
class _$HazardSearchParamsCopyWithImpl<$Res>
    implements $HazardSearchParamsCopyWith<$Res> {
  _$HazardSearchParamsCopyWithImpl(this._self, this._then);

  final HazardSearchParams _self;
  final $Res Function(HazardSearchParams) _then;

/// Create a copy of HazardSearchParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? searchString = freezed,Object? categoryIds = null,Object? latitude = freezed,Object? longitude = freezed,Object? northeastLat = freezed,Object? northeastLng = freezed,Object? southwestLat = freezed,Object? southwestLng = freezed,Object? page = null,Object? pageSize = null,}) {
  return _then(_self.copyWith(
searchString: freezed == searchString ? _self.searchString : searchString // ignore: cast_nullable_to_non_nullable
as String?,categoryIds: null == categoryIds ? _self.categoryIds : categoryIds // ignore: cast_nullable_to_non_nullable
as List<String>,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,northeastLat: freezed == northeastLat ? _self.northeastLat : northeastLat // ignore: cast_nullable_to_non_nullable
as double?,northeastLng: freezed == northeastLng ? _self.northeastLng : northeastLng // ignore: cast_nullable_to_non_nullable
as double?,southwestLat: freezed == southwestLat ? _self.southwestLat : southwestLat // ignore: cast_nullable_to_non_nullable
as double?,southwestLng: freezed == southwestLng ? _self.southwestLng : southwestLng // ignore: cast_nullable_to_non_nullable
as double?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [HazardSearchParams].
extension HazardSearchParamsPatterns on HazardSearchParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HazardSearchParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HazardSearchParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HazardSearchParams value)  $default,){
final _that = this;
switch (_that) {
case _HazardSearchParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HazardSearchParams value)?  $default,){
final _that = this;
switch (_that) {
case _HazardSearchParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? searchString,  List<String> categoryIds, @JsonKey(name: 'lat')  double? latitude, @JsonKey(name: 'lng')  double? longitude,  double? northeastLat,  double? northeastLng,  double? southwestLat,  double? southwestLng,  int page,  int pageSize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HazardSearchParams() when $default != null:
return $default(_that.searchString,_that.categoryIds,_that.latitude,_that.longitude,_that.northeastLat,_that.northeastLng,_that.southwestLat,_that.southwestLng,_that.page,_that.pageSize);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? searchString,  List<String> categoryIds, @JsonKey(name: 'lat')  double? latitude, @JsonKey(name: 'lng')  double? longitude,  double? northeastLat,  double? northeastLng,  double? southwestLat,  double? southwestLng,  int page,  int pageSize)  $default,) {final _that = this;
switch (_that) {
case _HazardSearchParams():
return $default(_that.searchString,_that.categoryIds,_that.latitude,_that.longitude,_that.northeastLat,_that.northeastLng,_that.southwestLat,_that.southwestLng,_that.page,_that.pageSize);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? searchString,  List<String> categoryIds, @JsonKey(name: 'lat')  double? latitude, @JsonKey(name: 'lng')  double? longitude,  double? northeastLat,  double? northeastLng,  double? southwestLat,  double? southwestLng,  int page,  int pageSize)?  $default,) {final _that = this;
switch (_that) {
case _HazardSearchParams() when $default != null:
return $default(_that.searchString,_that.categoryIds,_that.latitude,_that.longitude,_that.northeastLat,_that.northeastLng,_that.southwestLat,_that.southwestLng,_that.page,_that.pageSize);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HazardSearchParams implements HazardSearchParams {
  const _HazardSearchParams({this.searchString, final  List<String> categoryIds = const <String>[], @JsonKey(name: 'lat') this.latitude, @JsonKey(name: 'lng') this.longitude, this.northeastLat, this.northeastLng, this.southwestLat, this.southwestLng, this.page = 1, this.pageSize = 20}): _categoryIds = categoryIds;
  factory _HazardSearchParams.fromJson(Map<String, dynamic> json) => _$HazardSearchParamsFromJson(json);

/// The search string to filter hazards by their title or description.
@override final  String? searchString;
/// The list of category IDs to filter hazards.
 final  List<String> _categoryIds;
/// The list of category IDs to filter hazards.
@override@JsonKey() List<String> get categoryIds {
  if (_categoryIds is EqualUnmodifiableListView) return _categoryIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categoryIds);
}

/// The latitude for location-based filtering.
@override@JsonKey(name: 'lat') final  double? latitude;
/// The longitude for location-based filtering.
@override@JsonKey(name: 'lng') final  double? longitude;
/// The bounds for location-based filtering.
///
/// If provided, [latitude] and [longitude] will be ignored.
@override final  double? northeastLat;
/// The bounds for location-based filtering.
///
/// If provided, [latitude] and [longitude] will be ignored.
@override final  double? northeastLng;
/// The bounds for location-based filtering.
///
/// If provided, [latitude] and [longitude] will be ignored.
@override final  double? southwestLat;
/// The bounds for location-based filtering.
///
/// If provided, [latitude] and [longitude] will be ignored.
@override final  double? southwestLng;
/// The page number for pagination.
@override@JsonKey() final  int page;
/// The number of items per page for pagination.
@override@JsonKey() final  int pageSize;

/// Create a copy of HazardSearchParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HazardSearchParamsCopyWith<_HazardSearchParams> get copyWith => __$HazardSearchParamsCopyWithImpl<_HazardSearchParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HazardSearchParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HazardSearchParams&&(identical(other.searchString, searchString) || other.searchString == searchString)&&const DeepCollectionEquality().equals(other._categoryIds, _categoryIds)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.northeastLat, northeastLat) || other.northeastLat == northeastLat)&&(identical(other.northeastLng, northeastLng) || other.northeastLng == northeastLng)&&(identical(other.southwestLat, southwestLat) || other.southwestLat == southwestLat)&&(identical(other.southwestLng, southwestLng) || other.southwestLng == southwestLng)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,searchString,const DeepCollectionEquality().hash(_categoryIds),latitude,longitude,northeastLat,northeastLng,southwestLat,southwestLng,page,pageSize);

@override
String toString() {
  return 'HazardSearchParams(searchString: $searchString, categoryIds: $categoryIds, latitude: $latitude, longitude: $longitude, northeastLat: $northeastLat, northeastLng: $northeastLng, southwestLat: $southwestLat, southwestLng: $southwestLng, page: $page, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class _$HazardSearchParamsCopyWith<$Res> implements $HazardSearchParamsCopyWith<$Res> {
  factory _$HazardSearchParamsCopyWith(_HazardSearchParams value, $Res Function(_HazardSearchParams) _then) = __$HazardSearchParamsCopyWithImpl;
@override @useResult
$Res call({
 String? searchString, List<String> categoryIds,@JsonKey(name: 'lat') double? latitude,@JsonKey(name: 'lng') double? longitude, double? northeastLat, double? northeastLng, double? southwestLat, double? southwestLng, int page, int pageSize
});




}
/// @nodoc
class __$HazardSearchParamsCopyWithImpl<$Res>
    implements _$HazardSearchParamsCopyWith<$Res> {
  __$HazardSearchParamsCopyWithImpl(this._self, this._then);

  final _HazardSearchParams _self;
  final $Res Function(_HazardSearchParams) _then;

/// Create a copy of HazardSearchParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? searchString = freezed,Object? categoryIds = null,Object? latitude = freezed,Object? longitude = freezed,Object? northeastLat = freezed,Object? northeastLng = freezed,Object? southwestLat = freezed,Object? southwestLng = freezed,Object? page = null,Object? pageSize = null,}) {
  return _then(_HazardSearchParams(
searchString: freezed == searchString ? _self.searchString : searchString // ignore: cast_nullable_to_non_nullable
as String?,categoryIds: null == categoryIds ? _self._categoryIds : categoryIds // ignore: cast_nullable_to_non_nullable
as List<String>,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,northeastLat: freezed == northeastLat ? _self.northeastLat : northeastLat // ignore: cast_nullable_to_non_nullable
as double?,northeastLng: freezed == northeastLng ? _self.northeastLng : northeastLng // ignore: cast_nullable_to_non_nullable
as double?,southwestLat: freezed == southwestLat ? _self.southwestLat : southwestLat // ignore: cast_nullable_to_non_nullable
as double?,southwestLng: freezed == southwestLng ? _self.southwestLng : southwestLng // ignore: cast_nullable_to_non_nullable
as double?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
