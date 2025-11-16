import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hazard_app/features/onboarding/providers/onboarding_provider.dart';
import 'package:hazard_app/features/onboarding/views/widgets/gradient_button.dart';
import 'package:hazard_app/features/onboarding/views/widgets/progress_bar.dart';
import 'package:hazard_app/features/onboarding/views/widgets/logo.dart';
import 'package:hazard_app/features/shared/extensions/context_extension.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/others/app_colors.dart';

class OnboardingWelcomeScreen extends ConsumerStatefulWidget {
  const OnboardingWelcomeScreen({super.key});

  static const route = '/onboarding/welcome';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OnboardingWelcomeScreenState();
}

class _OnboardingWelcomeScreenState
    extends ConsumerState<OnboardingWelcomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _mainController;
  late AnimationController _handController;
  late AnimationController _shineController;

  late Animation<double> _fadeInAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _handBounceAnimation;
  late Animation<double> _shineAnimation;
  late Animation<double> _badgeRotateAnimation;
  late Animation<double> _badgeScaleAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _startAnimations();
  }

  void _setupAnimations() {
    _mainController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _handController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _shineController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );

    _fadeInAnimation =
        Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: _mainController,
            curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
          ),
        );

    _slideAnimation =
        Tween<Offset>(
          begin: const Offset(0, 20),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: _mainController,
            curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
          ),
        );

    _scaleAnimation =
        Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: _mainController,
            curve: const Interval(0.2, 0.8, curve: Curves.elasticOut),
          ),
        );

    _handBounceAnimation =
        Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: _handController,
            curve: Curves.easeInOut,
          ),
        );

    _shineAnimation =
        Tween<double>(
          begin: -1.0,
          end: 2.0,
        ).animate(
          CurvedAnimation(
            parent: _shineController,
            curve: Curves.linear,
          ),
        );

    _badgeRotateAnimation =
        Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: _handController,
            curve: Curves.easeInOut,
          ),
        );

    _badgeScaleAnimation =
        Tween<double>(
          begin: 1.0,
          end: 1.05,
        ).animate(
          CurvedAnimation(
            parent: _handController,
            curve: Curves.easeInOut,
          ),
        );
  }

  void _startAnimations() {
    Future.delayed(const Duration(milliseconds: 200), () {
      _mainController.forward();
    });

    Future.delayed(const Duration(milliseconds: 600), () {
      _handController.repeat(reverse: true);
    });

    Future.delayed(const Duration(milliseconds: 800), () {
      _shineController.repeat();
    });
  }

  @override
  void dispose() {
    _mainController.dispose();
    _handController.dispose();
    _shineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.orange.withValues(alpha: 0.1),
              AppColors.purple.withValues(alpha: 0.1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: AnimatedBuilder(
            animation: _mainController,
            builder: (context, child) {
              return Transform.translate(
                offset: _slideAnimation.value,
                child: Opacity(
                  opacity: _fadeInAnimation.value,
                  child: _buildContent(),
                ),
              );
            },
          ).pad(20.0),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30.spMin),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 15.spMin,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.spMin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Logo(),
              24.hSizedBox,
              ProgressBar(
                currentStep: 0,
                totalSteps: 5,
                label: '0 / 5 Steps Complete',
              ),
              40.hSizedBox,
              _buildWelcomeSection(),
              40.hSizedBox,
              _buildBadgeCard(),
              40.hSizedBox,
              _buildGetStartedButton(),
              20.hSizedBox,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeSection() {
    return Column(
      children: [
        AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: _buildFloatingHand(),
            );
          },
        ),
        24.hSizedBox,
        AnimatedBuilder(
          animation: _fadeInAnimation,
          builder: (context, child) {
            return Opacity(
              opacity: _fadeInAnimation.value,
              child: Column(
                children: [
                  Text(
                    'Welcome to ALRT',
                    style: TextStyle(
                      fontSize: 28.spMin,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  12.hSizedBox,
                  Text(
                    'Let\'s make safety a daily action. Every step you take helps protect your community.',
                    style: TextStyle(
                      fontSize: 16.spMin,
                      color: AppColors.grey,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildFloatingHand() {
    return AnimatedBuilder(
      animation: _handBounceAnimation,
      builder: (context, child) {
        final bounceValue = _handBounceAnimation.value;
        final offsetY = -10 * (0.5 - (0.5 * (1 + (bounceValue * 2 - 1).abs())));

        return Transform.translate(
          offset: Offset(0, offsetY),
          child: Text(
            '👋',
            style: TextStyle(fontSize: 72.spMin),
          ),
        );
      },
    );
  }

  Widget _buildBadgeCard() {
    return AnimatedBuilder(
      animation: _fadeInAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _fadeInAnimation.value,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF8B5CF6), // purple-500
                      Color(0xFFEC4899), // pink-500
                      Color(0xFF8B5CF6), // purple-600
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16.spMin),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadowColor,
                      blurRadius: 15.spMin,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(24.spMin),
                child: Column(
                  children: [
                    _buildBadgeHeader(),
                    16.hSizedBox,
                    _buildBadgeDescription(),
                  ],
                ),
              ),
              _buildShineEffect(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBadgeHeader() {
    return Row(
      children: [
        AnimatedBuilder(
          animation: _badgeRotateAnimation,
          builder: (context, child) {
            final rotation = _badgeRotateAnimation.value * 0.1 - 0.05;
            return Transform.rotate(
              angle: rotation,
              child: Transform.scale(
                scale: _badgeScaleAnimation.value,
                child: Container(
                  width: 64.spMin,
                  height: 64.spMin,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16.spMin),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadowColor,
                        blurRadius: 8.spMin,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.military_tech_outlined,
                    size: 32.spMin,
                    color: const Color(0xFF8B5CF6),
                  ),
                ),
              ),
            );
          },
        ),
        16.wSizedBox,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'UNLOCK YOUR FIRST BADGE',
                style: TextStyle(
                  color: const Color(0xFFE9D5FF), // purple-100
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ),
              4.hSizedBox,
              Text(
                'Safety Explorer Badge',
                style: TextStyle(
                  fontSize: 18.spMin,
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBadgeDescription() {
    return Container(
      padding: EdgeInsets.all(16.spMin),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12.spMin),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Text(
        'Complete the setup to earn your first achievement and start your safety journey!',
        style: TextStyle(
          fontSize: 14.spMin,
          color: AppColors.white,
          height: 1.3,
        ),
      ),
    );
  }

  Widget _buildShineEffect() {
    return AnimatedBuilder(
      animation: _shineAnimation,
      builder: (context, child) {
        return Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.spMin),
            child: Transform.translate(
              offset: Offset(_shineAnimation.value * 400, 0),
              child: Container(
                width: 100.spMin,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.white.withValues(alpha: 0.2),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildGetStartedButton() {
    return AnimatedBuilder(
      animation: _fadeInAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _fadeInAnimation.value,
          child: GestureDetector(
            onTapDown: (_) => setState(() {}),
            onTapUp: (_) => setState(() {}),
            onTapCancel: () => setState(() {}),
            child: AnimatedScale(
              scale: 1.0,
              duration: const Duration(milliseconds: 100),
              child: GradientButton(
                title: "Let's Get Started",
                icon: Icon(
                  Icons.arrow_forward,
                  size: 20.spMin,
                  color: AppColors.white,
                ),
                onPressed: _onGetStarted,
              ),
            ),
          ),
        );
      },
    );
  }

  void _onGetStarted() async {
    final result = await ref
        .read(providerOfOnboarding.notifier)
        .startOnboarding();
    if (!mounted) return;

    result.when(
      (onboardingResponse) {
        context.push(onboardingResponse.nextOnboardingStep.route);
      },
      (error) {
        context.showErrorToast(
          message: error.message,
        );
      },
    );
  }
}
