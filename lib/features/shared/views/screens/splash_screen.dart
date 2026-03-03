import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

/// Splash screen matching the HTML design: orbital rings, corner dots,
/// logo bars, and ALRT wordmark.
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  static const route = '/splash';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with TickerProviderStateMixin {
  static const double _splashSize = 340;
  static const Duration _ringDuration = Duration(milliseconds: 3000);

  late final AnimationController _controller;
  late final Animation<double> _animation;

  // HTML colors
  static const Color _ring1 = Color(0xFFFFB347);
  static const Color _ring2 = Color(0xFFFF6B01);
  static const Color _ring3 = Color(0xFFFF0004);
  static const Color _dotColor = Color(0xFFFF6B01);
  static const Color _pillRed = Color(0xFFFF0004);
  static const Color _pillOrange = Color(0xFFFF6B01);
  static const Color _taglineGray = Color(0xFF787878);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: _ringDuration,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Ring grows out from center and vanishes: scale 0 → 1.15, opacity fades in then out as it expands.
  (double scale, double opacity) _ringGrowAndVanish(double t) {
    const curve = Curves.easeOut;
    // Grow from center: scale 0 → 1.15 over full cycle
    final scale = curve.transform(t) * 1.15;
    // Appear quickly when small, then vanish as it grows (so it's "growing out and fading away")
    final opacity = t < 0.12
        ? curve.transform(t / 0.12)
        : 1.0 - curve.transform((t - 0.12) / 0.88);
    return (scale, opacity.clamp(0.0, 1.0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: _splashSize,
          height: _splashSize,
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, _) {
              final t = _animation.value;
              return Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  _buildRings(t),
                  _buildCornerDots(t),
                  _buildGlow(),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildLogoIcon(),
                      _buildWordmark(),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildRings(double t) {
    final ringSpecs = [
      (size: _splashSize, color: _ring1),
      (size: 260.0, color: _ring2),
      (size: 180.0, color: _ring3),
    ];

    // All rings use the same phase: they grow together from the center and vanish together (no overlap).
    final phase = t % 1.0;
    final (scale, opacity) = _ringGrowAndVanish(phase);

    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: ringSpecs.map((spec) {
        return Center(
          child: Transform.scale(
            scale: scale,
            alignment: Alignment.center,
            child: Opacity(
              opacity: opacity,
              child: Container(
                width: spec.size,
                height: spec.size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: spec.color,
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCornerDots(double t) {
    final positions = [
      (Alignment.topLeft, Offset(10, 10), 14.0, 0.1),
      (Alignment.topRight, Offset(-10, 10), 12.0, 0.5),
      (Alignment.bottomLeft, Offset(10, -10), 16.0, 0.8),
      (Alignment.bottomRight, Offset(-10, -10), 14.0, 0.3),
    ];

    return Positioned.fill(
      child: Stack(
        children: positions.map((p) {
          final phase = (t + p.$4) % 1.0;
          final dotScale = 1.0 + 0.5 * math.sin(phase * 2 * math.pi);
          final opacity = (0.7 + 0.3 * math.sin(phase * 2 * math.pi)).clamp(
            0.0,
            1.0,
          );
          return Align(
            alignment: p.$1,
            child: Transform.translate(
              offset: p.$2,
              child: Transform.scale(
                scale: dotScale,
                child: Container(
                  width: p.$3,
                  height: p.$3,
                  decoration: BoxDecoration(
                    color: _dotColor.withValues(alpha: opacity),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildGlow() {
    return IgnorePointer(
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              _ring2.withValues(alpha: 0.18),
              _ring3.withValues(alpha: 0.08),
              Colors.transparent,
            ],
            stops: const [0.0, 0.5, 0.7],
          ),
        ),
      ),
    );
  }

  Widget _buildLogoIcon() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildBarRow1(),
          const SizedBox(height: 9),
          _buildBarRow2(),
          const SizedBox(height: 9),
          _buildBarRow3(),
        ],
      ),
    );
  }

  Widget _buildBarRow1() {
    return SizedBox(
      width: 130 + 18,
      height: 26,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            top: 2,
            child: Container(
              width: 130,
              height: 22,
              decoration: BoxDecoration(
                color: _pillRed,
                borderRadius: BorderRadius.circular(11),
              ),
            ),
          ),
          Positioned(
            right: -8,
            top: 0,
            child: Container(
              width: 26,
              height: 26,
              decoration: const BoxDecoration(
                color: _pillOrange,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBarRow2() {
    return SizedBox(
      width: 95 + 22 + 8,
      height: 22,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 22,
            height: 22,
            decoration: const BoxDecoration(
              color: _pillOrange,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 95,
            height: 22,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [_pillOrange, Color(0xFFFF3300)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(11),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBarRow3() {
    return _buildBarRow1();
  }

  Widget _buildWordmark() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()..scale(1.3, 1.0),
          child: Text(
            'ALRT',
            style: GoogleFonts.bebasNeue(
              fontSize: 44,
              fontWeight: FontWeight.w400,
              color: _pillRed,
              letterSpacing: 10,
              height: 0.75,
            ),
          ),
        ),
        const SizedBox(height: 7),
        Text(
          'Alert. Location. Real-Time. Travel'.toUpperCase(),
          style: TextStyle(
            fontSize: 10.5,
            fontWeight: FontWeight.w400,
            letterSpacing: 2.0,
            color: _taglineGray,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
