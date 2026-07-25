import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/profile/models/xp_breakdown_models.dart';
import 'package:hazard_app/features/profile/providers/xp_breakdown_provider.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Transparent, per-report view of where a user's points come from, plus
/// their community ranking. Reads GET /api/xp/breakdown.
class PointsBreakdownScreen extends ConsumerWidget {
  const PointsBreakdownScreen({super.key});

  static const route = '/points-breakdown';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final breakdown = ref.watch(providerOfXpBreakdown);

    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Your points',
          style: TextStyle(fontSize: 17.spMin, fontWeight: FontWeight.w700),
        ),
      ),
      body: breakdown.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Could not load your points.',
                style: TextStyle(
                  fontSize: 15.spMin,
                  color: const Color(0xFF5f5c66),
                ),
              ),
              SizedBox(height: 12.spMin),
              TextButton(
                onPressed: () => ref.refresh(providerOfXpBreakdown),
                child: const Text('Try again'),
              ),
            ],
          ),
        ),
        data: (data) => RefreshIndicator(
          onRefresh: () async => ref.refresh(providerOfXpBreakdown.future),
          child: ListView(
            padding: EdgeInsets.all(20.spMin),
            children: [
              _headerCardBuilder(data),
              SizedBox(height: 16.spMin),
              if (data.stats != null) _statsRowBuilder(data.stats!),
              SizedBox(height: 16.spMin),
              _sectionTitleBuilder('YOUR REPORTS'),
              if (data.hazardBreakdowns.isEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.spMin),
                  child: Text(
                    'No reports yet. Submitting an approved report earns points.',
                    style: TextStyle(
                      fontSize: 13.spMin,
                      color: const Color(0xFF5f5c66),
                    ),
                  ),
                )
              else
                ...data.hazardBreakdowns.map(_hazardRowBuilder),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerCardBuilder(XpBreakdown data) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.spMin),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.spMin),
        border: Border.all(color: const Color(0xFFECECEF)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TOTAL POINTS',
            style: TextStyle(
              fontSize: 11.spMin,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.6,
              color: const Color(0xFF5f5c66),
            ),
          ),
          SizedBox(height: 6.spMin),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(LucideIcons.star, size: 26.spMin, color: const Color(0xFFE1A500)),
              SizedBox(width: 8.spMin),
              Text(
                '${data.currentXpPoints}',
                style: TextStyle(
                  fontSize: 34.spMin,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.spMin),
          if (data.totalUsers > 0)
            Text(
              'Rank #${data.rank} of ${data.totalUsers}  ·  top ${100 - data.percentile}%',
              style: TextStyle(
                fontSize: 13.spMin,
                color: const Color(0xFF5f5c66),
              ),
            ),
        ],
      ),
    );
  }

  Widget _statsRowBuilder(XpBreakdownStats stats) {
    return Row(
      children: [
        _statTileBuilder('${stats.totalHazardsReported}', 'Reports'),
        SizedBox(width: 10.spMin),
        _statTileBuilder('${stats.totalVotesCast}', 'Votes'),
        SizedBox(width: 10.spMin),
        _statTileBuilder('${stats.totalHazardViews}', 'Views'),
      ],
    );
  }

  Widget _statTileBuilder(String value, String label) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.spMin),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.spMin),
          border: Border.all(color: const Color(0xFFECECEF)),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 18.spMin,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 2.spMin),
            Text(
              label,
              style: TextStyle(
                fontSize: 12.spMin,
                color: const Color(0xFF5f5c66),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitleBuilder(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.spMin, left: 2.spMin),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 11.spMin,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.6,
          color: const Color(0xFF5f5c66),
        ),
      ),
    );
  }

  Widget _hazardRowBuilder(XpHazardBreakdown h) {
    final (statusColor, statusLabel) = switch (h.reviewStatus) {
      'accepted' => (const Color(0xFF27AE60), 'Approved'),
      'rejected' => (const Color(0xFFCC1010), 'Rejected'),
      _ => (const Color(0xFF5f5c66), 'Pending'),
    };
    return Container(
      margin: EdgeInsets.only(bottom: 10.spMin),
      padding: EdgeInsets.all(14.spMin),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.spMin),
        border: Border.all(color: const Color(0xFFECECEF)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  h.title.isEmpty ? 'Untitled report' : h.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.spMin,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(width: 8.spMin),
              Text(
                '+${h.totalEstimatedXp}',
                style: TextStyle(
                  fontSize: 14.spMin,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF27AE60),
                ),
              ),
            ],
          ),
          SizedBox(height: 6.spMin),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.spMin,
                  vertical: 3.spMin,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(6.spMin),
                ),
                child: Text(
                  statusLabel,
                  style: TextStyle(
                    fontSize: 11.spMin,
                    fontWeight: FontWeight.w700,
                    color: statusColor,
                  ),
                ),
              ),
              SizedBox(width: 8.spMin),
              Text(
                'Base +${h.baseXpPoints} · Engagement +${h.engagementXpPoints}',
                style: TextStyle(
                  fontSize: 11.spMin,
                  color: const Color(0xFF5f5c66),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
