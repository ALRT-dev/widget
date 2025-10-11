// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hazard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Hazard _$HazardFromJson(Map<String, dynamic> json) => _Hazard(
  id: json['id'] as String?,
  title: json['title'] as String?,
  description: json['description'] as String?,
  shortDescription: json['shortDescription'] as String?,
  visibility: json['visibility'] as bool? ?? true,
  severity: $enumDecodeNullable(_$HazardSeverityEnumMap, json['severity']),
  source: json['source'] as String?,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  categoryId: json['categoryId'] as String?,
  category: json['category'] == null
      ? null
      : HazardCategory.fromJson(json['category'] as Map<String, dynamic>),
  aiSummary: json['aiSummary'] as String?,
  aiFeedback: json['aiFeedback'] as String?,
  aiSeverity: $enumDecodeNullable(_$HazardSeverityEnumMap, json['aiSeverity']),
  aiConfidence: $enumDecodeNullable(
    _$AIConfidenceEnumMap,
    json['aiConfidence'],
  ),
  occuredAt: json['occuredAt'] == null
      ? null
      : DateTime.parse(json['occuredAt'] as String),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  expiresAt: json['expiresAt'] == null
      ? null
      : DateTime.parse(json['expiresAt'] as String),
);

Map<String, dynamic> _$HazardToJson(_Hazard instance) => <String, dynamic>{
  'id': ?instance.id,
  'title': ?instance.title,
  'description': ?instance.description,
  'shortDescription': ?instance.shortDescription,
  'visibility': instance.visibility,
  'severity': ?_$HazardSeverityEnumMap[instance.severity],
  'source': ?instance.source,
  'latitude': ?instance.latitude,
  'longitude': ?instance.longitude,
  'categoryId': ?instance.categoryId,
  'category': ?instance.category?.toJson(),
  'aiSummary': ?instance.aiSummary,
  'aiFeedback': ?instance.aiFeedback,
  'aiSeverity': ?_$HazardSeverityEnumMap[instance.aiSeverity],
  'aiConfidence': ?_$AIConfidenceEnumMap[instance.aiConfidence],
  'occuredAt': ?instance.occuredAt?.toIso8601String(),
  'createdAt': ?instance.createdAt?.toIso8601String(),
  'updatedAt': ?instance.updatedAt?.toIso8601String(),
  'expiresAt': ?instance.expiresAt?.toIso8601String(),
};

const _$HazardSeverityEnumMap = {
  HazardSeverity.info: 'info',
  HazardSeverity.advice: 'advice',
  HazardSeverity.watchAndAct: 'watchAndAct',
  HazardSeverity.emergency: 'emergency',
};

const _$AIConfidenceEnumMap = {
  AIConfidence.low: 'low',
  AIConfidence.medium: 'medium',
  AIConfidence.high: 'high',
};
