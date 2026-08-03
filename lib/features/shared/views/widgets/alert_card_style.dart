import 'package:flutter/material.dart';
import 'package:hazard_app/features/shared/enums/hazard_severity_band_types.dart';
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

  /// The severity shape: triangle for critical, diamond for advice-level,
  /// circle otherwise (mirrors the accessibility spec's shape language).
  static IconData shapeIcon(final HazardSeverityBand? band) {
    return switch (band) {
      HazardSeverityBand.critical => LucideIcons.triangleAlert,
      HazardSeverityBand.action => LucideIcons.triangleAlert,
      HazardSeverityBand.monitor => LucideIcons.diamond,
      HazardSeverityBand.info || null => LucideIcons.circle,
    };
  }
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
