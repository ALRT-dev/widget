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
      shape: $enumDecodeNullable(_$HazardSourceShapeEnumMap, json['shape']),
      severitySystem: $enumDecodeNullable(
        _$HazardSeveritySystemEnumMap,
        json['severitySystem'],
      ),
      levelHandling: $enumDecodeNullable(
        _$SeverityLevelHandlingEnumMap,
        json['levelHandling'],
      ),
      stickiness: (json['stickiness'] as num?)?.toInt(),
      maxInternalBand: $enumDecodeNullable(
        _$HazardSeverityBandEnumMap,
        json['maxInternalBand'],
      ),
      pushPolicy: $enumDecodeNullable(
        _$SourcePushPolicyEnumMap,
        json['pushPolicy'],
      ),
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
      'shape': ?_$HazardSourceShapeEnumMap[instance.shape],
      'severitySystem': ?_$HazardSeveritySystemEnumMap[instance.severitySystem],
      'levelHandling': ?_$SeverityLevelHandlingEnumMap[instance.levelHandling],
      'stickiness': ?instance.stickiness,
      'maxInternalBand': ?_$HazardSeverityBandEnumMap[instance.maxInternalBand],
      'pushPolicy': ?_$SourcePushPolicyEnumMap[instance.pushPolicy],
    };

const _$HazardSourceShapeEnumMap = {
  HazardSourceShape.triangle: 'triangle',
  HazardSourceShape.diamond: 'diamond',
  HazardSourceShape.circle: 'circle',
  HazardSourceShape.square: 'square',
  HazardSourceShape.shield: 'shield',
};

const _$HazardSeveritySystemEnumMap = {
  HazardSeveritySystem.awsLevel: 'awsLevel',
  HazardSeveritySystem.band: 'band',
  HazardSeveritySystem.category: 'category',
  HazardSeveritySystem.gdacsColour: 'gdacsColour',
  HazardSeveritySystem.advisory: 'advisory',
};

const _$SeverityLevelHandlingEnumMap = {
  SeverityLevelHandling.verbatim: 'verbatim',
  SeverityLevelHandling.bandColourOnly: 'bandColourOnly',
  SeverityLevelHandling.categoryColour: 'categoryColour',
  SeverityLevelHandling.levelExempt: 'levelExempt',
};

const _$HazardSeverityBandEnumMap = {
  HazardSeverityBand.info: 'info',
  HazardSeverityBand.monitor: 'monitor',
  HazardSeverityBand.action: 'action',
  HazardSeverityBand.critical: 'critical',
};

const _$SourcePushPolicyEnumMap = {
  SourcePushPolicy.everyLevel: 'everyLevel',
  SourcePushPolicy.bandThreshold: 'bandThreshold',
  SourcePushPolicy.afterConfirmation: 'afterConfirmation',
  SourcePushPolicy.greenExempt: 'greenExempt',
  SourcePushPolicy.advisoryOnly: 'advisoryOnly',
};
