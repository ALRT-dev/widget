// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hazard_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HazardCategory _$HazardCategoryFromJson(Map<String, dynamic> json) =>
    _HazardCategory(
      id: json['id'] as String,
      name: json['name'] as String?,
      emoji: json['emoji'] as String?,
      hazardsCount: (json['hazardsCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$HazardCategoryToJson(_HazardCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': ?instance.name,
      'emoji': ?instance.emoji,
      'hazardsCount': instance.hazardsCount,
    };
