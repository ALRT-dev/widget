import 'package:flutter/material.dart';
import 'package:hazard_app/features/shared/enums/hazard_source_shape_types.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';

/// Shared "One Glance" drawing primitives.
///
/// Both the [AlertIcon] widget and the map-marker bitmap generator
/// (`hazard_marker_bitmap.dart`) render from these, so a hazard looks identical
/// whether it's a Flutter widget on a card or a `BitmapDescriptor` pin on the
/// map: shape = source system · colour = severity · glyph = hazard category.

/// The dark ink used for the composed glyph (V3 §6: glyph is `#141414`).
const Color kHazardGlyphInk = Color(0xFF141414);

/// The band-grey fallback stroke (V3 §3 Info token). Used whenever the resolved
/// colour is transparent — the Info non-AWS band is transparent in the app
/// palette, but the frame stroke must stay visible.
const Color kHazardInfoStroke = Color(0xFF8A93A0);

/// The stroke width as a fraction of the icon's shortest side.
const double kHazardStrokeFraction = 0.12;

/// The glyph size as a fraction of the icon's side.
const double kHazardGlyphFraction = 0.44;

/// Builds the frame [Path] for [shape] inscribed in [rect].
Path hazardShapePath(HazardSourceShape shape, Rect rect) {
  switch (shape) {
    case HazardSourceShape.circle:
      return Path()..addOval(rect);

    case HazardSourceShape.square:
      return Path()
        ..addRRect(
          RRect.fromRectAndRadius(rect, Radius.circular(rect.width * 0.18)),
        );

    case HazardSourceShape.diamond:
      return Path()
        ..moveTo(rect.center.dx, rect.top)
        ..lineTo(rect.right, rect.center.dy)
        ..lineTo(rect.center.dx, rect.bottom)
        ..lineTo(rect.left, rect.center.dy)
        ..close();

    case HazardSourceShape.triangle:
      return Path()
        ..moveTo(rect.center.dx, rect.top)
        ..lineTo(rect.right, rect.bottom)
        ..lineTo(rect.left, rect.bottom)
        ..close();

    case HazardSourceShape.shield:
      final h = rect.height;
      final shoulder = rect.top + h * 0.62;
      return Path()
        ..moveTo(rect.left, rect.top)
        ..lineTo(rect.right, rect.top)
        ..lineTo(rect.right, shoulder)
        ..quadraticBezierTo(
          rect.right,
          rect.bottom - h * 0.08,
          rect.center.dx,
          rect.bottom,
        )
        ..quadraticBezierTo(
          rect.left,
          rect.bottom - h * 0.08,
          rect.left,
          shoulder,
        )
        ..lineTo(rect.left, rect.top)
        ..close();
  }
}

/// Paints a "One Glance" frame — white interior, [strokeColor] stroke — filling
/// [size] on [canvas]. The glyph is composed separately by the caller.
void paintHazardShapeFrame(
  Canvas canvas,
  Size size, {
  required HazardSourceShape shape,
  required Color strokeColor,
}) {
  final strokeWidth = size.shortestSide * kHazardStrokeFraction;
  final half = strokeWidth / 2;
  // Inset so the stroke is never clipped by the bounds.
  final rect = Rect.fromLTRB(
    half,
    half,
    size.width - half,
    size.height - half,
  );

  final path = hazardShapePath(shape, rect);

  final fill = Paint()
    ..style = PaintingStyle.fill
    ..color = Colors.white;
  final border = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = strokeWidth
    ..strokeJoin = StrokeJoin.round
    ..strokeCap = StrokeCap.round
    ..color = strokeColor;

  canvas.drawPath(path, fill);
  canvas.drawPath(path, border);
}

/// The vertical glyph offset (as a fraction of side) for [shape].
///
/// A triangle's visual centre of mass sits below its geometric centre, so its
/// glyph is nudged down; every other shape is centred.
double hazardGlyphDyFraction(HazardSourceShape shape) =>
    shape == HazardSourceShape.triangle ? 0.14 : 0.0;

/// The frame stroke colour for [hazard].
///
/// Community (user-reported) alerts are coloured by their category, never by
/// severity (V3 §1); everything else uses the hazard's band colour. A
/// transparent result (the Info non-AWS band) falls back to [kHazardInfoStroke]
/// so the frame is never invisible.
Color hazardStrokeColor(Hazard hazard) {
  final resolved = hazard.isUserReported
      ? (hazard.category?.effectiveColor ?? hazard.color)
      : hazard.color;
  // ignore: deprecated_member_use
  return resolved.alpha == 0 ? kHazardInfoStroke : resolved;
}

/// Resolves the category glyph for [hazard].
///
/// A handful of high-recognition hazards get a specific glyph; everything else
/// resolves by its main (parent) category, matching the V3 §3 icon sheet
/// (weather → cloud, transport → bus, health → cross, security → lock,
/// utilities → bolt, community → people, other → exclamation).
IconData hazardGlyph(Hazard hazard) {
  final categoryId = hazard.categoryId ?? '';

  const specific = <String, IconData>{
    'bushfire': Icons.local_fire_department,
    'otherFire': Icons.local_fire_department,
    'fireWeather': Icons.local_fire_department,
    'flood': Icons.water,
    'cyclone': Icons.cyclone,
    'storm': Icons.thunderstorm,
    'earthquake': Icons.terrain,
    'tsunami': Icons.waves,
    'heat': Icons.thermostat,
    'extremeHeat': Icons.thermostat,
  };
  final direct = specific[categoryId];
  if (direct != null) return direct;

  final mainCategoryId = hazard.category?.parentId ?? categoryId;
  switch (mainCategoryId) {
    case 'securityAndCrime':
      return Icons.lock;
    case 'healthAndAir':
      return Icons.local_hospital;
    case 'weatherAndEnvironment':
      return Icons.cloud;
    case 'trafficAndTransport':
      return Icons.directions_bus;
    case 'utilitiesAndInfrastructure':
      return Icons.bolt;
    case 'communityInfo':
      return Icons.groups;
    default:
      return Icons.warning_amber_rounded;
  }
}

/// A [CustomPainter] that paints the "One Glance" frame for [shape].
class HazardShapePainter extends CustomPainter {
  const HazardShapePainter({
    required this.shape,
    required this.strokeColor,
  });

  final HazardSourceShape shape;
  final Color strokeColor;

  @override
  void paint(Canvas canvas, Size size) {
    paintHazardShapeFrame(
      canvas,
      size,
      shape: shape,
      strokeColor: strokeColor,
    );
  }

  @override
  bool shouldRepaint(HazardShapePainter oldDelegate) {
    return oldDelegate.shape != shape || oldDelegate.strokeColor != strokeColor;
  }
}
