// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_hazards_with_categories_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetHazardsWithCategoriesResponse _$GetHazardsWithCategoriesResponseFromJson(
  Map<String, dynamic> json,
) => _GetHazardsWithCategoriesResponse(
  hazards: (json['hazards'] as List<dynamic>)
      .map((e) => Hazard.fromJson(e as Map<String, dynamic>))
      .toList(),
  categories: (json['categories'] as List<dynamic>)
      .map((e) => HazardCategory.fromJson(e as Map<String, dynamic>))
      .toList(),
  subscriptionId: json['subscriptionId'] as String?,
);

Map<String, dynamic> _$GetHazardsWithCategoriesResponseToJson(
  _GetHazardsWithCategoriesResponse instance,
) => <String, dynamic>{
  'hazards': instance.hazards.map((e) => e.toJson()).toList(),
  'categories': instance.categories.map((e) => e.toJson()).toList(),
  'subscriptionId': ?instance.subscriptionId,
};
