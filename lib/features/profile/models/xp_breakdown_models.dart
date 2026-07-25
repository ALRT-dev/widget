import 'package:freezed_annotation/freezed_annotation.dart';

part 'xp_breakdown_models.freezed.dart';
part 'xp_breakdown_models.g.dart';

/// Payload from GET /api/xp/breakdown — the transparent, per-report view of
/// where a user's points come from, plus their ranking.
@freezed
abstract class XpBreakdown with _$XpBreakdown {
  const factory XpBreakdown({
    @Default(0) final int currentXpPoints,
    @Default(0.0) final double reliabilityScore,
    @Default(0) final int expectedXpFromCalculation,
    @Default(0) final int rank,
    @Default(0) final int totalUsers,
    @Default(0) final int percentile,
    final XpBreakdownStats? stats,
    @Default(<XpHazardBreakdown>[])
    final List<XpHazardBreakdown> hazardBreakdowns,
  }) = _XpBreakdown;

  factory XpBreakdown.fromJson(Map<String, dynamic> json) =>
      _$XpBreakdownFromJson(json);
}

@freezed
abstract class XpBreakdownStats with _$XpBreakdownStats {
  const factory XpBreakdownStats({
    @Default(0) final int totalHazardsReported,
    @Default(0) final int totalVotesCast,
    @Default(0) final int totalHazardViews,
  }) = _XpBreakdownStats;

  factory XpBreakdownStats.fromJson(Map<String, dynamic> json) =>
      _$XpBreakdownStatsFromJson(json);
}

/// Per-report XP estimate, shown so users can see exactly how each report
/// contributed to their total.
@freezed
abstract class XpHazardBreakdown with _$XpHazardBreakdown {
  const factory XpHazardBreakdown({
    required final String hazardId,
    @Default('') final String title,
    @Default('pending') final String reviewStatus,
    @Default(0) final int baseXpPoints,
    @Default(0) final int engagementXpPoints,
    @Default(0) final int totalEstimatedXp,
    final DateTime? createdAt,
  }) = _XpHazardBreakdown;

  factory XpHazardBreakdown.fromJson(Map<String, dynamic> json) =>
      _$XpHazardBreakdownFromJson(json);
}
