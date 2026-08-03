import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Design tokens for the ALRT+ subscription screens (gate sheet, welcome,
/// manage, billing banner). Taken from the "ALRT + supporting screens" design
/// board in `docs/design/alrt_plus_screens.html`.
///
/// Kept separate from [AppColors] so the subscription feature stays
/// self-contained, mirroring how [FamilyColors] works.
class AlrtPlusStyle {
  AlrtPlusStyle._();

  static const ink = Color(0xFF232326);
  static const inkSoft = Color(0xFF75757E);
  static const inkFaint = Color(0xFFABABB2);

  static const purpleDeep = Color(0xFF2A0E45);
  static const purpleBandTop = Color(0xFF42186C);
  static const magenta = Color(0xFFA63BD4);

  static const body = Color(0xFFF4F1F8);
  static const cardLine = Color(0xFFEDE8F2);

  static const lavText = Color(0xFF7B3FA0);
  static const label = Color(0xFF9B7BC0);

  static const goldBg = Color(0xFFFBF0D9);
  static const goldText = Color(0xFFB07D1E);
  static const warnTitle = Color(0xFF6E4E10);
  static const warnBody = Color(0xFF8A6A24);

  /// Magenta to violet CTA gradient.
  static const ctaGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFC13BD4), Color(0xFF8F2BBE)],
  );

  /// Green gradient used for occupied (non-host) seats.
  static const greenGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1FC97A), Color(0xFF0FA45C)],
  );

  /// Lavender info box background.
  static const lavGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFF6ECFC), Color(0xFFEFE3FA)],
  );

  /// Amber gradient for the billing issue banner.
  static const amberGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFF3DC), Color(0xFFFFE6C2)],
  );

  /// The deep purple header band: purple base with a warm orange glow in the
  /// top right corner and a magenta bloom in the bottom left, per the board's
  /// "blended colour, no flat blocks" rule.
  static BoxDecoration bandDecoration({final BorderRadius? borderRadius}) {
    return BoxDecoration(
      borderRadius: borderRadius,
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [purpleBandTop, purpleDeep],
      ),
    );
  }

  /// The corner glows layered over [bandDecoration]. Wrap band content in a
  /// [Stack] with this as a positioned fill.
  static Widget bandGlows() {
    return Positioned.fill(
      child: IgnorePointer(
        child: Stack(
          children: [
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(0.95, -1.0),
                    radius: 1.1,
                    colors: [
                      const Color(0xFFFF6B00).withValues(alpha: 0.20),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(-1.0, 1.0),
                    radius: 1.0,
                    colors: [
                      magenta.withValues(alpha: 0.35),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// White content card with the soft purple shadow used across the screens.
  static BoxDecoration cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16.spMin),
      boxShadow: [
        BoxShadow(
          color: const Color(0xFF3A1560).withValues(alpha: 0.07),
          blurRadius: 14.0,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }
}

/// The small "ALRT +" tier pill. [onBand] renders the translucent white
/// variant used on the purple band; otherwise the lavender-on-light variant.
class AlrtPlusPill extends StatelessWidget {
  const AlrtPlusPill({super.key, this.text = 'ALRT +', this.onBand = false});

  final String text;
  final bool onBand;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 11.spMin, vertical: 4.spMin),
      decoration: BoxDecoration(
        color: onBand ? Colors.white.withValues(alpha: 0.15) : null,
        gradient: onBand
            ? null
            : LinearGradient(
                colors: [
                  AlrtPlusStyle.magenta.withValues(alpha: 0.12),
                  const Color(0xFF8F2BBE).withValues(alpha: 0.10),
                ],
              ),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11.spMin,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.4,
          color: onBand ? Colors.white : AlrtPlusStyle.magenta,
        ),
      ),
    );
  }
}

/// The lavender "trust" note box ("You stay in control.", "No surprises.").
class AlrtPlusLavenderNote extends StatelessWidget {
  const AlrtPlusLavenderNote({
    super.key,
    required this.boldText,
    required this.text,
  });

  final String boldText;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 13.spMin, vertical: 10.spMin),
      decoration: BoxDecoration(
        gradient: AlrtPlusStyle.lavGradient,
        borderRadius: BorderRadius.circular(14.spMin),
      ),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '$boldText ',
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            TextSpan(text: text),
          ],
        ),
        style: TextStyle(
          fontSize: 11.5.spMin,
          height: 1.55,
          color: AlrtPlusStyle.lavText,
        ),
      ),
    );
  }
}

/// The pill-shaped gradient CTA button with the soft magenta glow.
class AlrtPlusCtaButton extends StatelessWidget {
  const AlrtPlusCtaButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.busy = false,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool busy;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: busy ? null : onPressed,
      child: Container(
        width: double.infinity,
        height: 50.spMin,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: AlrtPlusStyle.ctaGradient,
          borderRadius: BorderRadius.circular(999),
          boxShadow: [
            BoxShadow(
              color: AlrtPlusStyle.magenta.withValues(alpha: 0.30),
              blurRadius: 24.0,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: busy
            ? SizedBox(
                width: 22.spMin,
                height: 22.spMin,
                child: const CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2.5,
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  fontSize: 14.5.spMin,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}

/// The quiet secondary action under a CTA ("Maybe later").
class AlrtPlusGhostButton extends StatelessWidget {
  const AlrtPlusGhostButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12.5.spMin,
          fontWeight: FontWeight.w600,
          color: AlrtPlusStyle.inkSoft,
        ),
      ),
    );
  }
}
