// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_hazards_with_filters_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetHazardsWithFiltersResponse _$GetHazardsWithFiltersResponseFromJson(
  Map<String, dynamic> json,
) => _GetHazardsWithFiltersResponse(
  hazards:
      (json['hazards'] as List<dynamic>?)
          ?.map((e) => Hazard.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Hazard>[],
  subscriptionId: json['subscriptionId'] as String?,
  availableFilters: json['availableFilters'] == null
      ? const GetAvailableFiltersResponse()
      : GetAvailableFiltersResponse.fromJson(
          json['availableFilters'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$GetHazardsWithFiltersResponseToJson(
  _GetHazardsWithFiltersResponse instance,
) => <String, dynamic>{
  'hazards': instance.hazards.map((e) => e.toJson()).toList(),
  'subscriptionId': ?instance.subscriptionId,
  'availableFilters': instance.availableFilters.toJson(),
};
