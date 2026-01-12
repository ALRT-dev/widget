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
      license: json['license'] == null
          ? null
          : HazardSourceLicense.fromJson(
              json['license'] as Map<String, dynamic>,
            ),
      copyrightText: json['copyrightText'] as String?,
      copyrightLink: json['copyrightLink'] as String?,
      advisoryText: json['advisoryText'] as String?,
    );

Map<String, dynamic> _$HazardSourceToJson(_HazardSource instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': ?instance.name,
      'url': ?instance.url,
      'license': ?instance.license?.toJson(),
      'copyrightText': ?instance.copyrightText,
      'copyrightLink': ?instance.copyrightLink,
      'advisoryText': ?instance.advisoryText,
    };
