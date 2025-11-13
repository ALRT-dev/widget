import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';

class SplashScreen extends ConsumerStatefulWidget {
  /// Displays a loading spinner while the app is initializing.
  const SplashScreen({super.key});

  static const route = '/splash';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _master;
  late final List<_Particle> _particles;

  @override
  void initState() {
    super.initState();
    _master = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    )..repeat();
    final rng = math.Random();
    _particles = List.generate(
      20,
      (_) => _Particle(
        xPct: rng.nextDouble() * 100,
        yPct: rng.nextDouble() * 100,
        delay: rng.nextDouble(),
        duration: 3 + rng.nextDouble() * 2,
      ),
    );
  }

  @override
  void dispose() {
    _master.dispose();
    super.dispose();
  }

  double _phase(double t, double delay, double duration) =>
      (t / (duration / 4.0) + delay) % 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _master,
        builder: (context, _) {
          final t = _master.value;
          final size = MediaQuery.of(context).size;

          return Container(
            decoration: _buildBackgroundGradient(),
            child: Stack(
              children: [
                ..._buildFloatingParticles(t, size),
                ..._buildBlurredBlobs(t),
                _buildMainContent(t),
                ..._buildCornerAccents(t),
              ],
            ),
          );
        },
      ),
    );
  }

  /// Creates the background gradient decoration
  BoxDecoration _buildBackgroundGradient() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFF1F5F9),
          Color(0xFFFFF1E7),
          Color(0xFFFFEBEB),
        ],
      ),
    );
  }

  /// Creates floating particle widgets
  List<Widget> _buildFloatingParticles(double t, Size size) {
    return _particles.map((p) {
      final ph = _phase(t, p.delay, p.duration);
      final bob = math.sin(ph * math.pi) * -30.0;
      final op = (math.sin(ph * math.pi) * 0.6).clamp(0, 1).toDouble();
      final sc = (math.sin(ph * math.pi)).clamp(0, 1).toDouble();

      return Positioned(
        left: size.width * (p.xPct / 100),
        top: size.height * (p.yPct / 100) + bob,
        child: Opacity(
          opacity: op,
          child: Transform.scale(
            scale: sc,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: const Color(0xFFEF4444).withValues(alpha: 0.20),
                borderRadius: BorderRadius.circular(999),
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  /// Creates animated blurred blob widgets
  List<Widget> _buildBlurredBlobs(double t) {
    return [
      _Blob(
        alignment: Alignment.topLeft,
        diameter: 384,
        color: const Color(0xFFFECACA).withValues(alpha: 0.30),
        x: 50 * math.sin(t * 2 * math.pi),
        y: 30 * math.sin(t * 2 * math.pi),
        scale: 1 + 0.1 * (1 + math.sin(t * 2 * math.pi)),
      ),
      _Blob(
        alignment: Alignment.bottomRight,
        diameter: 384,
        color: const Color(0xFFFDE68A).withValues(alpha: 0.30),
        x: -50 * math.sin(t * 2 * math.pi * .8),
        y: -30 * math.sin(t * 2 * math.pi * .8),
        scale: 1 + 0.15 * (1 + math.sin(t * 2 * math.pi * .8)),
      ),
    ];
  }

  /// Creates the main content including logo, icons, and progress bar
  Widget _buildMainContent(double t) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildLogo(),
            _BouncyIcons(progress: t),
            30.hSizedBox,
            _buildProgressBar(),
            _buildTagline(),
          ],
        ),
      ),
    );
  }

  /// Creates the animated logo widget
  Widget _buildLogo() {
    return AnimatedOpacity(
      opacity: 1,
      duration: const Duration(milliseconds: 600),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 48),
        child: Hero(
          tag: 'app_logo',
          child: Image.asset(
            'assets/logos/alrt_logo_detailed.png',
            width: 320,
            filterQuality: FilterQuality.high,
          ),
        ),
      ),
    );
  }

  /// Creates the animated progress bar widget
  Widget _buildProgressBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: TweenAnimationBuilder<double>(
        key: const ValueKey('progress_bar'),
        tween: Tween(begin: 0, end: 1),
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOut,
        builder: (context, v, _) {
          return Container(
            width: 256,
            height: 6,
            decoration: BoxDecoration(
              color: const Color(0xFFD1D5DB).withValues(alpha: .5),
              borderRadius: BorderRadius.circular(999),
            ),
            clipBehavior: Clip.hardEdge,
            child: Align(
              alignment: Alignment.centerLeft,
              child: FractionallySizedBox(
                widthFactor: v,
                heightFactor: 1.0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFEF4444),
                        Color(0xFFF97316),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// Creates the tagline text widget
  Widget _buildTagline() {
    return const Padding(
      padding: EdgeInsets.only(top: 16.0),
      child: Text(
        'Stay alert. Stay ahead.',
        style: TextStyle(
          color: Color(0xFF475569),
          letterSpacing: 1.5,
        ),
      ),
    );
  }

  /// Creates the rotating corner accent widgets
  List<Widget> _buildCornerAccents(double t) {
    return [
      Positioned(
        top: 32,
        right: 32,
        child: Transform.rotate(
          angle: t * 2 * math.pi,
          child: const _CornerDots(
            size: 64,
            color: Color(0xFFFB7185),
            opacity: .4,
          ),
        ),
      ),
      Positioned(
        bottom: 32,
        left: 32,
        child: Transform.rotate(
          angle: -t * 2 * math.pi * (4000 / 3000),
          child: const _CornerDots(
            size: 48,
            color: Color(0xFFFBBF24),
            opacity: .4,
          ),
        ),
      ),
    ];
  }
}

class _Blob extends StatelessWidget {
  final Alignment alignment;
  final double diameter, x, y, scale;
  final Color color;
  const _Blob({
    required this.alignment,
    required this.diameter,
    required this.x,
    required this.y,
    required this.scale,
    required this.color,
  });
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Transform.translate(
        offset: Offset(x, y),
        child: Transform.scale(
          scale: scale,
          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
              child: Container(
                width: diameter,
                height: diameter,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Particle {
  final double xPct, yPct, delay, duration;
  _Particle({
    required this.xPct,
    required this.yPct,
    required this.delay,
    required this.duration,
  });
}

class _CornerDots extends StatelessWidget {
  final double size, opacity;
  final Color color;
  const _CornerDots({
    required this.size,
    required this.color,
    required this.opacity,
  });
  @override
  Widget build(BuildContext context) {
    Align dot(Alignment a) => Align(
      alignment: a,
      child: Container(
        width: size * .0625,
        height: size * .0625,
        decoration: BoxDecoration(
          color: color.withValues(alpha: opacity),
          borderRadius: BorderRadius.circular(999),
        ),
      ),
    );
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          dot(Alignment.topCenter),
          dot(Alignment.bottomCenter),
          dot(Alignment.centerLeft),
          dot(Alignment.centerRight),
        ],
      ),
    );
  }
}

class _BouncyIcons extends StatelessWidget {
  final double progress;
  const _BouncyIcons({required this.progress});
  double _bob(double t, double delay) =>
      math.sin(((t + delay) % 1.0) * 2 * math.pi) * 10;
  @override
  Widget build(BuildContext context) {
    final t = progress;
    Widget item(IconData icon, double d, Color c) => Transform.translate(
      offset: Offset(0, -_bob(t, d)),
      child: Icon(icon, size: 32, color: c),
    );
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          SizedBox.shrink(), // keeps const context happy below
        ],
      ),
    ).build(
      context,
      () => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          item(Icons.notifications, 0.00, const Color(0xFFE11D48)),
          const SizedBox(width: 32),
          item(Icons.location_pin, 0.075, const Color(0xFFEA580C)),
          const SizedBox(width: 32),
          item(Icons.radio, 0.15, const Color(0xFFE11D48)),
          const SizedBox(width: 32),
          item(Icons.flight, 0.225, const Color(0xFFEA580C)),
        ],
      ),
    );
  }
}

// small helper to allow building a Row after a const
extension on Widget {
  Widget build(BuildContext context, Widget Function() child) => child();
}
