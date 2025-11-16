// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppUser _$AppUserFromJson(Map<String, dynamic> json) => _AppUser(
  id: json['id'] as String?,
  name: json['name'] as String?,
  email: json['email'] as String?,
  onboardingStep: $enumDecodeNullable(
    _$OnboardingStepEnumMap,
    json['onboardingStep'],
  ),
  profilePictureUrl: json['profilePicturePresignedUrl'] as String?,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  locationName: json['locationName'] as String?,
  xpPoints: (json['xpPoints'] as num?)?.toInt() ?? 0,
  reliabilityScore: (json['reliabilityScore'] as num?)?.toDouble() ?? 0.0,
  hazardsViewedCount: (json['hazardsViewedCount'] as num?)?.toInt() ?? 0,
  hazardsReportedCount: (json['hazardsReportedCount'] as num?)?.toInt() ?? 0,
  upvotesReceivedCount: (json['upvotesReceivedCount'] as num?)?.toInt() ?? 0,
  reportsStatus:
      $enumDecodeNullable(_$UserReportsStatusEnumMap, json['reportsStatus']) ??
      UserReportsStatus.unverified,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$AppUserToJson(_AppUser instance) => <String, dynamic>{
  'id': ?instance.id,
  'name': ?instance.name,
  'email': ?instance.email,
  'onboardingStep': ?_$OnboardingStepEnumMap[instance.onboardingStep],
  'profilePicturePresignedUrl': ?instance.profilePictureUrl,
  'latitude': ?instance.latitude,
  'longitude': ?instance.longitude,
  'locationName': ?instance.locationName,
  'xpPoints': instance.xpPoints,
  'reliabilityScore': instance.reliabilityScore,
  'hazardsViewedCount': instance.hazardsViewedCount,
  'hazardsReportedCount': instance.hazardsReportedCount,
  'upvotesReceivedCount': instance.upvotesReceivedCount,
  'reportsStatus': _$UserReportsStatusEnumMap[instance.reportsStatus]!,
  'createdAt': ?instance.createdAt?.toIso8601String(),
};

const _$OnboardingStepEnumMap = {
  OnboardingStep.welcome: 'welcome',
  OnboardingStep.location: 'location',
  OnboardingStep.radius: 'radius',
  OnboardingStep.pushNotification: 'pushNotification',
  OnboardingStep.tosAcceptance: 'tosAcceptance',
  OnboardingStep.completed: 'completed',
};

const _$UserReportsStatusEnumMap = {
  UserReportsStatus.unverified: 'unverified',
  UserReportsStatus.emerging: 'emerging',
  UserReportsStatus.verified: 'verified',
};
