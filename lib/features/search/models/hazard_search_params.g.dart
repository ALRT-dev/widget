// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hazard_search_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HazardSearchParams _$HazardSearchParamsFromJson(Map<String, dynamic> json) =>
    _HazardSearchParams(
      searchString: json['searchString'] as String?,
      categoryIds: (json['categoryIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      page: (json['page'] as num?)?.toInt() ?? 1,
      pageSize: (json['pageSize'] as num?)?.toInt() ?? 20,
    );

Map<String, dynamic> _$HazardSearchParamsToJson(_HazardSearchParams instance) =>
    <String, dynamic>{
      'searchString': instance.searchString,
      'categoryIds': instance.categoryIds,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'page': instance.page,
      'pageSize': instance.pageSize,
    };
