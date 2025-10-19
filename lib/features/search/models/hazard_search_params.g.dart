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
      reportedById: json['reportedById'] as String?,
      reviewStatus:
          $enumDecodeNullable(
            _$HazardReviewStatusEnumMap,
            json['reviewStatus'],
          ) ??
          HazardReviewStatus.accepted,
      northeastLat: (json['northeastLat'] as num?)?.toDouble(),
      northeastLng: (json['northeastLng'] as num?)?.toDouble(),
      southwestLat: (json['southwestLat'] as num?)?.toDouble(),
      southwestLng: (json['southwestLng'] as num?)?.toDouble(),
      showExpired: json['showExpired'] as bool? ?? false,
      page: (json['page'] as num?)?.toInt() ?? 1,
      pageSize: (json['pageSize'] as num?)?.toInt() ?? 20,
    );

Map<String, dynamic> _$HazardSearchParamsToJson(_HazardSearchParams instance) =>
    <String, dynamic>{
      'searchString': ?instance.searchString,
      'categoryIds': instance.categoryIds,
      'reportedById': ?instance.reportedById,
      'reviewStatus': _$HazardReviewStatusEnumMap[instance.reviewStatus]!,
      'northeastLat': ?instance.northeastLat,
      'northeastLng': ?instance.northeastLng,
      'southwestLat': ?instance.southwestLat,
      'southwestLng': ?instance.southwestLng,
      'showExpired': instance.showExpired,
      'page': instance.page,
      'pageSize': instance.pageSize,
    };

const _$HazardReviewStatusEnumMap = {
  HazardReviewStatus.pending: 'pending',
  HazardReviewStatus.accepted: 'accepted',
  HazardReviewStatus.rejected: 'rejected',
};
