// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'xp_breakdown_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_XpBreakdown _$XpBreakdownFromJson(Map<String, dynamic> json) => _XpBreakdown(
  currentXpPoints: (json['currentXpPoints'] as num?)?.toInt() ?? 0,
  reliabilityScore: (json['reliabilityScore'] as num?)?.toDouble() ?? 0.0,
  expectedXpFromCalculation:
      (json['expectedXpFromCalculation'] as num?)?.toInt() ?? 0,
  rank: (json['rank'] as num?)?.toInt() ?? 0,
  totalUsers: (json['totalUsers'] as num?)?.toInt() ?? 0,
  percentile: (json['percentile'] as num?)?.toInt() ?? 0,
  stats: json['stats'] == null
      ? null
      : XpBreakdownStats.fromJson(json['stats'] as Map<String, dynamic>),
  hazardBreakdowns:
      (json['hazardBreakdowns'] as List<dynamic>?)
          ?.map((e) => XpHazardBreakdown.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <XpHazardBreakdown>[],
);

Map<String, dynamic> _$XpBreakdownToJson(
  _XpBreakdown instance,
) => <String, dynamic>{
  'currentXpPoints': instance.currentXpPoints,
  'reliabilityScore': instance.reliabilityScore,
  'expectedXpFromCalculation': instance.expectedXpFromCalculation,
  'rank': instance.rank,
  'totalUsers': instance.totalUsers,
  'percentile': instance.percentile,
  'stats': ?instance.stats?.toJson(),
  'hazardBreakdowns': instance.hazardBreakdowns.map((e) => e.toJson()).toList(),
};

_XpBreakdownStats _$XpBreakdownStatsFromJson(Map<String, dynamic> json) =>
    _XpBreakdownStats(
      totalHazardsReported:
          (json['totalHazardsReported'] as num?)?.toInt() ?? 0,
      totalVotesCast: (json['totalVotesCast'] as num?)?.toInt() ?? 0,
      totalHazardViews: (json['totalHazardViews'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$XpBreakdownStatsToJson(_XpBreakdownStats instance) =>
    <String, dynamic>{
      'totalHazardsReported': instance.totalHazardsReported,
      'totalVotesCast': instance.totalVotesCast,
      'totalHazardViews': instance.totalHazardViews,
    };

_XpHazardBreakdown _$XpHazardBreakdownFromJson(Map<String, dynamic> json) =>
    _XpHazardBreakdown(
      hazardId: json['hazardId'] as String,
      title: json['title'] as String? ?? '',
      reviewStatus: json['reviewStatus'] as String? ?? 'pending',
      baseXpPoints: (json['baseXpPoints'] as num?)?.toInt() ?? 0,
      engagementXpPoints: (json['engagementXpPoints'] as num?)?.toInt() ?? 0,
      totalEstimatedXp: (json['totalEstimatedXp'] as num?)?.toInt() ?? 0,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$XpHazardBreakdownToJson(_XpHazardBreakdown instance) =>
    <String, dynamic>{
      'hazardId': instance.hazardId,
      'title': instance.title,
      'reviewStatus': instance.reviewStatus,
      'baseXpPoints': instance.baseXpPoints,
      'engagementXpPoints': instance.engagementXpPoints,
      'totalEstimatedXp': instance.totalEstimatedXp,
      'createdAt': ?instance.createdAt?.toIso8601String(),
    };
