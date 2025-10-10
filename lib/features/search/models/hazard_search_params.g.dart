// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hazard_search_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HazardSearchParams _$HazardSearchParamsFromJson(Map<String, dynamic> json) =>
    _HazardSearchParams(
      searchString: json['searchString'] as String?,
      categoryIds:
          (json['categoryIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      latitude: (json['lat'] as num?)?.toDouble(),
      longitude: (json['lng'] as num?)?.toDouble(),
      northeastLat: (json['northeastLat'] as num?)?.toDouble(),
      northeastLng: (json['northeastLng'] as num?)?.toDouble(),
      southwestLat: (json['southwestLat'] as num?)?.toDouble(),
      southwestLng: (json['southwestLng'] as num?)?.toDouble(),
      page: (json['page'] as num?)?.toInt() ?? 1,
      pageSize: (json['pageSize'] as num?)?.toInt() ?? 20,
    );

Map<String, dynamic> _$HazardSearchParamsToJson(_HazardSearchParams instance) =>
    <String, dynamic>{
      'searchString': ?instance.searchString,
      'categoryIds': instance.categoryIds,
      'lat': ?instance.latitude,
      'lng': ?instance.longitude,
      'northeastLat': ?instance.northeastLat,
      'northeastLng': ?instance.northeastLng,
      'southwestLat': ?instance.southwestLat,
      'southwestLng': ?instance.southwestLng,
      'page': instance.page,
      'pageSize': instance.pageSize,
    };
