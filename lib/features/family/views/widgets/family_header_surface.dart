import 'package:flutter/material.dart';
import 'package:hazard_app/features/family/views/widgets/family_colors.dart';

/// The family header band: one blend, one light source, used everywhere.
///
/// Wrapping it means the hub, the journey screen, the switcher and the
/// empty state cannot drift into three slightly different purples again,
/// which is what made the family section look assembled rather than
/// designed.
class FamilyHeaderSurface extends StatelessWidget {
  const FamilyHeaderSurface({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;

  /// Square by default: most family headers run full-bleed off the top.
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: FamilyColors.headerGradient,
        borderRadius: borderRadius,
      ),
      child: DecoratedBox(
        // The highlight rides on top of the blend rather than being mixed
        // into it, so the band keeps a light source at any height.
        decoration: BoxDecoration(
          gradient: FamilyColors.headerHighlight,
          borderRadius: borderRadius,
        ),
        child: Padding(
          padding: padding ?? EdgeInsets.zero,
          child: child,
        ),
      ),
    );
  }
}
