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
      severities: (json['severities'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry($enumDecode(_$HazardSeverityEnumMap, k), e as bool),
      ),
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
      sortSettings:
          (json['sortSettings'] as List<dynamic>?)
              ?.map(
                (e) => (e as Map<String, dynamic>).map(
                  (k, e) => MapEntry(
                    $enumDecode(_$SortCategoryEnumMap, k),
                    $enumDecode(_$SortOrderEnumMap, e),
                  ),
                ),
              )
              .toList() ??
          const <Map<SortCategory, SortOrder>>[
            {SortCategory.severity: SortOrder.desc},
            {SortCategory.distance: SortOrder.asc},
            {SortCategory.createdAt: SortOrder.desc},
            {SortCategory.confidenceScore: SortOrder.desc},
          ],
      page: (json['page'] as num?)?.toInt() ?? 1,
      pageSize: (json['pageSize'] as num?)?.toInt() ?? 20,
    );

Map<String, dynamic> _$HazardSearchParamsToJson(_HazardSearchParams instance) =>
    <String, dynamic>{
      'searchString': ?instance.searchString,
      'categoryIds': instance.categoryIds,
      'severities': ?instance.severities?.map(
        (k, e) => MapEntry(_$HazardSeverityEnumMap[k]!, e),
      ),
      'reportedById': ?instance.reportedById,
      'reviewStatus': _$HazardReviewStatusEnumMap[instance.reviewStatus]!,
      'northeastLat': ?instance.northeastLat,
      'northeastLng': ?instance.northeastLng,
      'southwestLat': ?instance.southwestLat,
      'southwestLng': ?instance.southwestLng,
      'showExpired': instance.showExpired,
      'sortSettings': instance.sortSettings
          .map(
            (e) => e.map(
              (k, e) =>
                  MapEntry(_$SortCategoryEnumMap[k]!, _$SortOrderEnumMap[e]!),
            ),
          )
          .toList(),
      'page': instance.page,
      'pageSize': instance.pageSize,
    };

const _$HazardSeverityEnumMap = {
  HazardSeverity.unknown: 'unknown',
  HazardSeverity.info: 'info',
  HazardSeverity.low: 'low',
  HazardSeverity.advice: 'advice',
  HazardSeverity.watchAndAct: 'watchAndAct',
  HazardSeverity.emergency: 'emergency',
};

const _$HazardReviewStatusEnumMap = {
  HazardReviewStatus.pending: 'pending',
  HazardReviewStatus.accepted: 'accepted',
  HazardReviewStatus.rejected: 'rejected',
};

const _$SortOrderEnumMap = {SortOrder.asc: 'asc', SortOrder.desc: 'desc'};

const _$SortCategoryEnumMap = {
  SortCategory.severity: 'severity',
  SortCategory.distance: 'distance',
  SortCategory.createdAt: 'createdAt',
  SortCategory.confidenceScore: 'confidenceScore',
};
