import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';
import 'package:hazard_app/features/shared/views/widgets/hazard_one_glance.dart';

/// The standard render sizes for an [AlertIcon].
///
/// These are the three sizes from the V2 "One Glance" spec. Use [dimension] on
/// [AlertIcon] for a one-off size outside these.
enum AlertIconSize {
  /// 16 logical px — dense contexts (inline chips, tight rows, the smallest
  /// legible marker).
  small(16),

  /// 24 logical px — the default (list rows, callouts).
  medium(24),

  /// 40 logical px — prominent (map markers, the full alert card header).
  large(40);

  const AlertIconSize(this.value);

  /// The side length in logical pixels (before screen-util scaling).
  final double value;
}

/// A single, consistent hazard icon — the app's "One Glance" alert glyph.
///
/// One icon encodes three things at once, per the V3 source-registry model:
///   - **shape**  — the alert's source system (triangle AWS · diamond official ·
///     circle community · square GDACS · shield ALRT Intel),
///   - **colour** — the severity band (community uses its category colour),
///   - **glyph**  — the hazard category.
///
/// The shape frame is drawn at runtime by [HazardShapePainter] — a white
/// interior with a system/band-coloured stroke — and the dark category glyph is
/// composed on top. Nothing is baked into an image asset, so the same icon
/// renders at any size and a new category needs no new artwork. The same
/// primitives paint the map-marker pins, so widget and pin always match.
///
/// Shape is resolved via [Hazard.resolvedShape] (`reportedBy → circle, else
/// source.shape ?? diamond`); colour via [hazardStrokeColor]; glyph via
/// [hazardGlyph].
class AlertIcon extends StatelessWidget {
  /// Creates an alert icon for [hazard] at a standard [size].
  const AlertIcon({
    super.key,
    required this.hazard,
    this.size = AlertIconSize.medium,
    this.dimension,
  });

  /// The hazard whose source · band · category the icon represents.
  final Hazard hazard;

  /// The standard render size. Ignored when [dimension] is provided.
  final AlertIconSize size;

  /// An explicit side length (logical px) overriding [size], for the rare call
  /// site that needs a non-standard size.
  final double? dimension;

  @override
  Widget build(BuildContext context) {
    final side = (dimension ?? size.value).spMin;
    final shape = hazard.resolvedShape;

    return SizedBox(
      width: side,
      height: side,
      child: CustomPaint(
        size: Size.square(side),
        painter: HazardShapePainter(
          shape: shape,
          strokeColor: hazardStrokeColor(hazard),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: side * hazardGlyphDyFraction(shape)),
            child: Icon(
              hazardGlyph(hazard),
              size: side * kHazardGlyphFraction,
              color: kHazardGlyphInk,
            ),
          ),
        ),
      ),
    );
  }
}
