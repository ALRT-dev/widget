// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hazard_source_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HazardSource _$HazardSourceFromJson(Map<String, dynamic> json) =>
    _HazardSource(
      id: json['id'] as String,
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$HazardSourceToJson(_HazardSource instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': ?instance.name,
      'url': ?instance.url,
    };
