// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppUser _$AppUserFromJson(Map<String, dynamic> json) => _AppUser(
  id: json['id'] as String?,
  name: json['name'] as String?,
  email: json['email'] as String?,
  xpPoints: (json['xpPoints'] as num?)?.toInt() ?? 0,
  reliabilityScore: (json['reliabilityScore'] as num?)?.toDouble() ?? 0.0,
  hazardsViewedCount: (json['hazardsViewedCount'] as num?)?.toInt() ?? 0,
  hazardsReportedCount: (json['hazardsReportedCount'] as num?)?.toInt() ?? 0,
  upvotesReceivedCount: (json['upvotesReceivedCount'] as num?)?.toInt() ?? 0,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$AppUserToJson(_AppUser instance) => <String, dynamic>{
  'id': ?instance.id,
  'name': ?instance.name,
  'email': ?instance.email,
  'xpPoints': instance.xpPoints,
  'reliabilityScore': instance.reliabilityScore,
  'hazardsViewedCount': instance.hazardsViewedCount,
  'hazardsReportedCount': instance.hazardsReportedCount,
  'upvotesReceivedCount': instance.upvotesReceivedCount,
  'createdAt': ?instance.createdAt?.toIso8601String(),
};
