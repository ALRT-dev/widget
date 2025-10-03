// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hazard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Hazard _$HazardFromJson(Map<String, dynamic> json) => _Hazard(
      id: json['id'] as String,
      title: json['title'] as String?,
      shortDescription: json['shortDescription'] as String?,
      severity: $enumDecodeNullable(_$HazardSeverityEnumMap, json['severity']),
      source: json['source'] as String?,
      location: json['location'] == null
          ? null
          : AlrtLocation.fromJson(json['location'] as Map<String, dynamic>),
      category: json['category'] == null
          ? null
          : HazardCategory.fromJson(json['category'] as Map<String, dynamic>),
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
      'id': instance.id,
      'title': instance.title,
      'shortDescription': instance.shortDescription,
      'severity': _$HazardSeverityEnumMap[instance.severity],
      'source': instance.source,
      'location': instance.location,
      'category': instance.category,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'expiresAt': instance.expiresAt?.toIso8601String(),
    };

const _$HazardSeverityEnumMap = {
  HazardSeverity.info: 'info',
  HazardSeverity.advice: 'advice',
  HazardSeverity.watchAndAct: 'watchAndAct',
  HazardSeverity.emergency: 'emergency',
};
