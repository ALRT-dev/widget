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
 List<String> get categoryIds;/// The severity filter to filter hazards.
 HazardSeverityFilter? get severityFilter;/// The id of the user who reported the hazard to filter hazards.
 String? get reportedById;/// The review status to filter hazards.
///
/// Defaults to [HazardReviewStatus.accepted] to show only accepted hazards.
 HazardReviewStatus get reviewStatus;/// The bounds for location-based filtering.
 double? get northeastLat;/// The bounds for location-based filtering.
 double? get northeastLng;/// The bounds for location-based filtering.
 double? get southwestLat;/// The bounds for location-based filtering.
 double? get southwestLng;/// Whether to show expired hazards or not.
 bool get showExpired;/// The list of sorting types to sort hazards.
 List<Map<SortCategory, SortOrder>> get sortSettings;/// The page number for pagination.
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HazardSearchParams&&(identical(other.searchString, searchString) || other.searchString == searchString)&&const DeepCollectionEquality().equals(other.categoryIds, categoryIds)&&(identical(other.severityFilter, severityFilter) || other.severityFilter == severityFilter)&&(identical(other.reportedById, reportedById) || other.reportedById == reportedById)&&(identical(other.reviewStatus, reviewStatus) || other.reviewStatus == reviewStatus)&&(identical(other.northeastLat, northeastLat) || other.northeastLat == northeastLat)&&(identical(other.northeastLng, northeastLng) || other.northeastLng == northeastLng)&&(identical(other.southwestLat, southwestLat) || other.southwestLat == southwestLat)&&(identical(other.southwestLng, southwestLng) || other.southwestLng == southwestLng)&&(identical(other.showExpired, showExpired) || other.showExpired == showExpired)&&const DeepCollectionEquality().equals(other.sortSettings, sortSettings)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,searchString,const DeepCollectionEquality().hash(categoryIds),severityFilter,reportedById,reviewStatus,northeastLat,northeastLng,southwestLat,southwestLng,showExpired,const DeepCollectionEquality().hash(sortSettings),page,pageSize);

@override
String toString() {
  return 'HazardSearchParams(searchString: $searchString, categoryIds: $categoryIds, severityFilter: $severityFilter, reportedById: $reportedById, reviewStatus: $reviewStatus, northeastLat: $northeastLat, northeastLng: $northeastLng, southwestLat: $southwestLat, southwestLng: $southwestLng, showExpired: $showExpired, sortSettings: $sortSettings, page: $page, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class $HazardSearchParamsCopyWith<$Res>  {
  factory $HazardSearchParamsCopyWith(HazardSearchParams value, $Res Function(HazardSearchParams) _then) = _$HazardSearchParamsCopyWithImpl;
@useResult
$Res call({
 String? searchString, List<String> categoryIds, HazardSeverityFilter? severityFilter, String? reportedById, HazardReviewStatus reviewStatus, double? northeastLat, double? northeastLng, double? southwestLat, double? southwestLng, bool showExpired, List<Map<SortCategory, SortOrder>> sortSettings, int page, int pageSize
});


$HazardSeverityFilterCopyWith<$Res>? get severityFilter;

}
/// @nodoc
class _$HazardSearchParamsCopyWithImpl<$Res>
    implements $HazardSearchParamsCopyWith<$Res> {
  _$HazardSearchParamsCopyWithImpl(this._self, this._then);

  final HazardSearchParams _self;
  final $Res Function(HazardSearchParams) _then;

/// Create a copy of HazardSearchParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? searchString = freezed,Object? categoryIds = null,Object? severityFilter = freezed,Object? reportedById = freezed,Object? reviewStatus = null,Object? northeastLat = freezed,Object? northeastLng = freezed,Object? southwestLat = freezed,Object? southwestLng = freezed,Object? showExpired = null,Object? sortSettings = null,Object? page = null,Object? pageSize = null,}) {
  return _then(_self.copyWith(
searchString: freezed == searchString ? _self.searchString : searchString // ignore: cast_nullable_to_non_nullable
as String?,categoryIds: null == categoryIds ? _self.categoryIds : categoryIds // ignore: cast_nullable_to_non_nullable
as List<String>,severityFilter: freezed == severityFilter ? _self.severityFilter : severityFilter // ignore: cast_nullable_to_non_nullable
as HazardSeverityFilter?,reportedById: freezed == reportedById ? _self.reportedById : reportedById // ignore: cast_nullable_to_non_nullable
as String?,reviewStatus: null == reviewStatus ? _self.reviewStatus : reviewStatus // ignore: cast_nullable_to_non_nullable
as HazardReviewStatus,northeastLat: freezed == northeastLat ? _self.northeastLat : northeastLat // ignore: cast_nullable_to_non_nullable
as double?,northeastLng: freezed == northeastLng ? _self.northeastLng : northeastLng // ignore: cast_nullable_to_non_nullable
as double?,southwestLat: freezed == southwestLat ? _self.southwestLat : southwestLat // ignore: cast_nullable_to_non_nullable
as double?,southwestLng: freezed == southwestLng ? _self.southwestLng : southwestLng // ignore: cast_nullable_to_non_nullable
as double?,showExpired: null == showExpired ? _self.showExpired : showExpired // ignore: cast_nullable_to_non_nullable
as bool,sortSettings: null == sortSettings ? _self.sortSettings : sortSettings // ignore: cast_nullable_to_non_nullable
as List<Map<SortCategory, SortOrder>>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of HazardSearchParams
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HazardSeverityFilterCopyWith<$Res>? get severityFilter {
    if (_self.severityFilter == null) {
    return null;
  }

  return $HazardSeverityFilterCopyWith<$Res>(_self.severityFilter!, (value) {
    return _then(_self.copyWith(severityFilter: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? searchString,  List<String> categoryIds,  HazardSeverityFilter? severityFilter,  String? reportedById,  HazardReviewStatus reviewStatus,  double? northeastLat,  double? northeastLng,  double? southwestLat,  double? southwestLng,  bool showExpired,  List<Map<SortCategory, SortOrder>> sortSettings,  int page,  int pageSize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HazardSearchParams() when $default != null:
return $default(_that.searchString,_that.categoryIds,_that.severityFilter,_that.reportedById,_that.reviewStatus,_that.northeastLat,_that.northeastLng,_that.southwestLat,_that.southwestLng,_that.showExpired,_that.sortSettings,_that.page,_that.pageSize);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? searchString,  List<String> categoryIds,  HazardSeverityFilter? severityFilter,  String? reportedById,  HazardReviewStatus reviewStatus,  double? northeastLat,  double? northeastLng,  double? southwestLat,  double? southwestLng,  bool showExpired,  List<Map<SortCategory, SortOrder>> sortSettings,  int page,  int pageSize)  $default,) {final _that = this;
switch (_that) {
case _HazardSearchParams():
return $default(_that.searchString,_that.categoryIds,_that.severityFilter,_that.reportedById,_that.reviewStatus,_that.northeastLat,_that.northeastLng,_that.southwestLat,_that.southwestLng,_that.showExpired,_that.sortSettings,_that.page,_that.pageSize);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? searchString,  List<String> categoryIds,  HazardSeverityFilter? severityFilter,  String? reportedById,  HazardReviewStatus reviewStatus,  double? northeastLat,  double? northeastLng,  double? southwestLat,  double? southwestLng,  bool showExpired,  List<Map<SortCategory, SortOrder>> sortSettings,  int page,  int pageSize)?  $default,) {final _that = this;
switch (_that) {
case _HazardSearchParams() when $default != null:
return $default(_that.searchString,_that.categoryIds,_that.severityFilter,_that.reportedById,_that.reviewStatus,_that.northeastLat,_that.northeastLng,_that.southwestLat,_that.southwestLng,_that.showExpired,_that.sortSettings,_that.page,_that.pageSize);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HazardSearchParams implements HazardSearchParams {
  const _HazardSearchParams({this.searchString, final  List<String> categoryIds = const <String>[], this.severityFilter, this.reportedById, this.reviewStatus = HazardReviewStatus.accepted, this.northeastLat, this.northeastLng, this.southwestLat, this.southwestLng, this.showExpired = false, final  List<Map<SortCategory, SortOrder>> sortSettings = const <Map<SortCategory, SortOrder>>[{SortCategory.severity : SortOrder.desc}, {SortCategory.distance : SortOrder.asc}, {SortCategory.createdAt : SortOrder.desc}, {SortCategory.confidenceScore : SortOrder.desc}], this.page = 1, this.pageSize = 20}): _categoryIds = categoryIds,_sortSettings = sortSettings;
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

/// The severity filter to filter hazards.
@override final  HazardSeverityFilter? severityFilter;
/// The id of the user who reported the hazard to filter hazards.
@override final  String? reportedById;
/// The review status to filter hazards.
///
/// Defaults to [HazardReviewStatus.accepted] to show only accepted hazards.
@override@JsonKey() final  HazardReviewStatus reviewStatus;
/// The bounds for location-based filtering.
@override final  double? northeastLat;
/// The bounds for location-based filtering.
@override final  double? northeastLng;
/// The bounds for location-based filtering.
@override final  double? southwestLat;
/// The bounds for location-based filtering.
@override final  double? southwestLng;
/// Whether to show expired hazards or not.
@override@JsonKey() final  bool showExpired;
/// The list of sorting types to sort hazards.
 final  List<Map<SortCategory, SortOrder>> _sortSettings;
/// The list of sorting types to sort hazards.
@override@JsonKey() List<Map<SortCategory, SortOrder>> get sortSettings {
  if (_sortSettings is EqualUnmodifiableListView) return _sortSettings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sortSettings);
}

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HazardSearchParams&&(identical(other.searchString, searchString) || other.searchString == searchString)&&const DeepCollectionEquality().equals(other._categoryIds, _categoryIds)&&(identical(other.severityFilter, severityFilter) || other.severityFilter == severityFilter)&&(identical(other.reportedById, reportedById) || other.reportedById == reportedById)&&(identical(other.reviewStatus, reviewStatus) || other.reviewStatus == reviewStatus)&&(identical(other.northeastLat, northeastLat) || other.northeastLat == northeastLat)&&(identical(other.northeastLng, northeastLng) || other.northeastLng == northeastLng)&&(identical(other.southwestLat, southwestLat) || other.southwestLat == southwestLat)&&(identical(other.southwestLng, southwestLng) || other.southwestLng == southwestLng)&&(identical(other.showExpired, showExpired) || other.showExpired == showExpired)&&const DeepCollectionEquality().equals(other._sortSettings, _sortSettings)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,searchString,const DeepCollectionEquality().hash(_categoryIds),severityFilter,reportedById,reviewStatus,northeastLat,northeastLng,southwestLat,southwestLng,showExpired,const DeepCollectionEquality().hash(_sortSettings),page,pageSize);

@override
String toString() {
  return 'HazardSearchParams(searchString: $searchString, categoryIds: $categoryIds, severityFilter: $severityFilter, reportedById: $reportedById, reviewStatus: $reviewStatus, northeastLat: $northeastLat, northeastLng: $northeastLng, southwestLat: $southwestLat, southwestLng: $southwestLng, showExpired: $showExpired, sortSettings: $sortSettings, page: $page, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class _$HazardSearchParamsCopyWith<$Res> implements $HazardSearchParamsCopyWith<$Res> {
  factory _$HazardSearchParamsCopyWith(_HazardSearchParams value, $Res Function(_HazardSearchParams) _then) = __$HazardSearchParamsCopyWithImpl;
@override @useResult
$Res call({
 String? searchString, List<String> categoryIds, HazardSeverityFilter? severityFilter, String? reportedById, HazardReviewStatus reviewStatus, double? northeastLat, double? northeastLng, double? southwestLat, double? southwestLng, bool showExpired, List<Map<SortCategory, SortOrder>> sortSettings, int page, int pageSize
});


@override $HazardSeverityFilterCopyWith<$Res>? get severityFilter;

}
/// @nodoc
class __$HazardSearchParamsCopyWithImpl<$Res>
    implements _$HazardSearchParamsCopyWith<$Res> {
  __$HazardSearchParamsCopyWithImpl(this._self, this._then);

  final _HazardSearchParams _self;
  final $Res Function(_HazardSearchParams) _then;

/// Create a copy of HazardSearchParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? searchString = freezed,Object? categoryIds = null,Object? severityFilter = freezed,Object? reportedById = freezed,Object? reviewStatus = null,Object? northeastLat = freezed,Object? northeastLng = freezed,Object? southwestLat = freezed,Object? southwestLng = freezed,Object? showExpired = null,Object? sortSettings = null,Object? page = null,Object? pageSize = null,}) {
  return _then(_HazardSearchParams(
searchString: freezed == searchString ? _self.searchString : searchString // ignore: cast_nullable_to_non_nullable
as String?,categoryIds: null == categoryIds ? _self._categoryIds : categoryIds // ignore: cast_nullable_to_non_nullable
as List<String>,severityFilter: freezed == severityFilter ? _self.severityFilter : severityFilter // ignore: cast_nullable_to_non_nullable
as HazardSeverityFilter?,reportedById: freezed == reportedById ? _self.reportedById : reportedById // ignore: cast_nullable_to_non_nullable
as String?,reviewStatus: null == reviewStatus ? _self.reviewStatus : reviewStatus // ignore: cast_nullable_to_non_nullable
as HazardReviewStatus,northeastLat: freezed == northeastLat ? _self.northeastLat : northeastLat // ignore: cast_nullable_to_non_nullable
as double?,northeastLng: freezed == northeastLng ? _self.northeastLng : northeastLng // ignore: cast_nullable_to_non_nullable
as double?,southwestLat: freezed == southwestLat ? _self.southwestLat : southwestLat // ignore: cast_nullable_to_non_nullable
as double?,southwestLng: freezed == southwestLng ? _self.southwestLng : southwestLng // ignore: cast_nullable_to_non_nullable
as double?,showExpired: null == showExpired ? _self.showExpired : showExpired // ignore: cast_nullable_to_non_nullable
as bool,sortSettings: null == sortSettings ? _self._sortSettings : sortSettings // ignore: cast_nullable_to_non_nullable
as List<Map<SortCategory, SortOrder>>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of HazardSearchParams
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HazardSeverityFilterCopyWith<$Res>? get severityFilter {
    if (_self.severityFilter == null) {
    return null;
  }

  return $HazardSeverityFilterCopyWith<$Res>(_self.severityFilter!, (value) {
    return _then(_self.copyWith(severityFilter: value));
  });
}
}

// dart format on
