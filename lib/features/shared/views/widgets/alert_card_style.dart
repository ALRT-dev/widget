import 'package:flutter/material.dart';
import 'package:hazard_app/features/shared/enums/hazard_severity_band_types.dart';
import 'package:hazard_app/features/shared/enums/hazard_severity_types.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// The locked alert-card treatments (product-rules §6/§31):
///
/// - SOLID red fill (gradient, white type, glow) = official CRITICAL only.
/// - DASHED red outline on white (no glow) = official needs-attention (ACTION).
/// - Community reports are never red-treated and always read UNVERIFIED.
/// - Severity is shown by shape as well as colour, never colour alone.
abstract final class AlertCardStyle {
  /// Solid red: official CRITICAL only.
  static const solidRedGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xFFFF5247), Color(0xFFB80000)],
  );

  /// Outer glow that accompanies the solid red treatment.
  static BoxShadow get criticalGlow => BoxShadow(
        color: const Color(0xFFE01B0F).withValues(alpha: 0.45),
        blurRadius: 18,
        offset: const Offset(0, 4),
      );

  /// Dashed needs-attention outline.
  static const dashedBorderColor = Color(0xFFE5928D);

  /// Dashed needs-attention type colour.
  static const dashedTextColor = Color(0xFFCC1010);

  /// The source-system shape (V3 alert rendering spec): shape says WHICH
  /// SYSTEM an alert came from, colour says how urgent it is.
  ///
  /// AWS = triangle, other official sources = diamond, community = circle.
  /// (GDACS square and ALRT Intel shield join when those feeds exist.)
  static IconData systemShapeIcon({
    required final bool isAws,
    required final bool isOfficial,
  }) {
    if (isAws) return LucideIcons.triangleAlert;
    if (isOfficial) return LucideIcons.diamond;
    return LucideIcons.circle;
  }

  // ── Pre-coloured severity sets (shape-severity/, locked hexes) ─────────
  // Diamond/shield render at the band hex; the shield carries colour only —
  // the band word is never written next to it. Community circles take the
  // category colour instead, never a band hex.

  static const bandInfo = Color(0xFF8A93A0);
  static const bandMonitor = Color(0xFFF5C518);
  static const bandAction = Color(0xFFF07E1B);
  static const bandCritical = Color(0xFFDA1F2D);

  /// The locked hex for an official severity shape.
  static Color bandShapeColor(final HazardSeverityBand? band) {
    return switch (band) {
      HazardSeverityBand.monitor => bandMonitor,
      HazardSeverityBand.action => bandAction,
      HazardSeverityBand.critical => bandCritical,
      HazardSeverityBand.info || null => bandInfo,
    };
  }

  /// "In plain terms" — one fixed sentence per official severity level, so
  /// anyone can read what the warning actually means. Deterministic copy,
  /// zero AI at render time; action wording is always attributed to the
  /// services, never spoken in ALRT's own voice. Community reports return
  /// null — unverified posts don't get an authority strip.
  static String? plainTermsOf({
    required final bool isOfficial,
    required final bool isAws,
    final HazardSeverity? severity,
    final HazardSeverityBand? band,
    final String? categoryName,
  }) {
    if (!isOfficial) return null;

    final category = categoryName?.toLowerCase() ?? '';

    // Air quality reads better with its own line at the serious end.
    final isAir = category.contains('air') || category.contains('health');
    final isSevere = isAws
        ? severity == HazardSeverity.emergency ||
              severity == HazardSeverity.watchAndAct
        : band == HazardSeverityBand.action ||
              band == HazardSeverityBand.critical;
    if (isAir && isSevere) {
      return 'the air outside is bad enough to affect anyone, '
          'not just people with health conditions.';
    }

    if (isAws) {
      return switch (severity) {
        HazardSeverity.emergency =>
          'this is as serious as official warnings get. Emergency services '
              'say act immediately.',
        HazardSeverity.watchAndAct =>
          'a hazard nearby is getting worse. The emergency services say '
              'start acting now, before it becomes an emergency.',
        HazardSeverity.advice =>
          'no immediate danger, but stay aware — conditions can change.',
        _ => null,
      };
    }

    return switch (band) {
      HazardSeverityBand.critical =>
        'officials consider this dangerous right now. Take it seriously.',
      HazardSeverityBand.action =>
        'officials say this needs your attention now.',
      HazardSeverityBand.monitor =>
        'worth keeping an eye on if you are nearby.',
      HazardSeverityBand.info || null =>
        'for your awareness — nothing to act on right now.',
    };
  }

  // ── V3 expanded-card treatments (alert detail screen) ──────────────────

  /// Official (AWS and non-AWS) expanded-card header band.
  static const officialHeaderGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFF8C00), Color(0xFFFF6B01)],
  );

  /// Official expanded-card header, coloured by severity — the top of the
  /// alert must designate the level: Advice/MONITOR yellow, Watch and
  /// Act/ACTION orange, Emergency/CRITICAL red, info grey.
  static LinearGradient officialHeaderGradientFor({
    required final bool isAws,
    final HazardSeverity? severity,
    final HazardSeverityBand? band,
  }) {
    final bool isCriticalTier = isAws
        ? severity == HazardSeverity.emergency
        : band == HazardSeverityBand.critical;
    final bool isActionTier = isAws
        ? severity == HazardSeverity.watchAndAct
        : band == HazardSeverityBand.action;
    final bool isMonitorTier = isAws
        ? severity == HazardSeverity.advice
        : band == HazardSeverityBand.monitor;

    if (isCriticalTier) {
      return const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFFDA1F2D), Color(0xFF9E1520)],
      );
    }
    if (isActionTier) return officialHeaderGradient;
    if (isMonitorTier) {
      return const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFFF5C518), Color(0xFFDCA900)],
      );
    }
    return const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFF8A93A0), Color(0xFF6E7683)],
    );
  }

  /// The dark "In plain terms" surface (cards and the expanded alert).
  static const plainTermsBackground = Color(0xFF23252B);

  /// Community/user-report expanded-card header band.
  static const communityHeaderGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF5AB0FF), Color(0xFF3A90E5)],
  );

  /// AWS severity-level pill (the ONLY system whose pill shows a level word).
  static const awsLevelPillBackground = Color(0xFFFFF6EF);
  static const awsLevelPillForeground = Color(0xFFB84500);
  static const awsLevelPillBorder = Color(0xFFFF6B01);

  /// Official non-AWS category pill (never a band/severity word).
  static const officialCategoryPillBackground = Color(0xFFE8FBF5);
  static const officialCategoryPillForeground = Color(0xFF146C43);
  static const officialCategoryPillBorder = Color(0xFF007A56);

  /// Community category pill (never a severity word).
  static const communityCategoryPillBackground = Color(0xFFE8F4FF);
  static const communityCategoryPillForeground = Color(0xFF1565B5);

  /// "Live · updated N ago" pill.
  static const livePillBackground = Color(0xFFE4F7EE);
  static const livePillForeground = Color(0xFF146C43);

  /// "In plain terms:" summary box tints.
  static const officialSummaryBackground = Color(0xFFFFF9F4);
  static const communitySummaryBackground = Color(0xFFF4F9FF);

  /// V3 section-header ink ("What we know" / "What to do").
  static const officialSectionHeaderColor = Color(0xFFB84500);
  static const communitySectionHeaderColor = Color(0xFF1565B5);

  /// V3 body copy colour.
  static const summaryTextColor = Color(0xFF44414C);
}

/// Paints a dashed rounded-rect outline (Flutter has no built-in dashed
/// border). Used for the official needs-attention card treatment.
class DashedRRectPainter extends CustomPainter {
  const DashedRRectPainter({
    required this.color,
    required this.radius,
    this.strokeWidth = 1.4,
    this.dashLength = 5,
    this.gapLength = 4,
  });

  final Color color;
  final double radius;
  final double strokeWidth;
  final double dashLength;
  final double gapLength;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    final rrect = RRect.fromRectAndRadius(
      Offset.zero & size,
      Radius.circular(radius),
    );
    final path = Path()..addRRect(rrect);
    for (final metric in path.computeMetrics()) {
      var distance = 0.0;
      while (distance < metric.length) {
        final end = (distance + dashLength).clamp(0.0, metric.length);
        canvas.drawPath(metric.extractPath(distance, end), paint);
        distance = end + gapLength;
      }
    }
  }

  @override
  bool shouldRepaint(covariant DashedRRectPainter oldDelegate) =>
      color != oldDelegate.color ||
      radius != oldDelegate.radius ||
      strokeWidth != oldDelegate.strokeWidth;
}
