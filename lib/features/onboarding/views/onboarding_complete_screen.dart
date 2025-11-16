import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hazard_app/features/home/enums/home_tab_types.dart';
import 'package:hazard_app/features/home/views/screens/home_screen.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/others/app_colors.dart';
import 'package:hazard_app/others/app_wrapper.dart';

class OnboardingCompleteScreen extends ConsumerStatefulWidget {
  const OnboardingCompleteScreen({super.key});

  static const route = '/onboarding/complete';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OnboardingCompleteScreenState();
}

class _OnboardingCompleteScreenState
    extends ConsumerState<OnboardingCompleteScreen>
    with TickerProviderStateMixin {
  late AnimationController _mainController;
  late AnimationController _checkController;
  late AnimationController _pulseController;
  late AnimationController _progressController;
  late AnimationController _badgeController;
  late AnimationController _shineController;
  late List<AnimationController> _cardControllers;
  late List<AnimationController> _backgroundControllers;

  late Animation<double> _scaleAnimation;
  late Animation<double> _checkScaleAnimation;
  late Animation<double> _checkRotateAnimation;
  late Animation<double> _pulseOpacityAnimation;
  late Animation<double> _pulseScaleAnimation;
  late Animation<double> _progressAnimation;
  late Animation<double> _badgeRotateAnimation;
  late Animation<double> _badgeScaleAnimation;
  late Animation<double> _shineAnimation;

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

    _checkController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _progressController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _badgeController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _shineController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    // Initialize card controllers for staggered animations
    _cardControllers = List.generate(
      3,
      (index) => AnimationController(
        duration: const Duration(milliseconds: 600),
        vsync: this,
      ),
    );

    // Initialize background line controllers
    _backgroundControllers = List.generate(
      6,
      (index) => AnimationController(
        duration: const Duration(milliseconds: 3000),
        vsync: this,
      ),
    );

    _scaleAnimation =
        Tween<double>(
          begin: 0.9,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: _mainController,
            curve: Curves.easeOut,
          ),
        );

    _checkScaleAnimation =
        Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: _checkController,
            curve: const Interval(0.0, 0.7, curve: Curves.elasticOut),
          ),
        );

    _checkRotateAnimation =
        Tween<double>(
          begin: -math.pi,
          end: 0.0,
        ).animate(
          CurvedAnimation(
            parent: _checkController,
            curve: const Interval(0.0, 0.7, curve: Curves.easeOut),
          ),
        );

    _pulseScaleAnimation =
        Tween<double>(
          begin: 1.0,
          end: 1.8,
        ).animate(
          CurvedAnimation(
            parent: _pulseController,
            curve: Curves.easeOut,
          ),
        );

    _pulseOpacityAnimation =
        Tween<double>(
          begin: 0.5,
          end: 0.0,
        ).animate(
          CurvedAnimation(
            parent: _pulseController,
            curve: Curves.easeOut,
          ),
        );

    _progressAnimation =
        Tween<double>(
          begin: 0.0,
          end: 0.4,
        ).animate(
          CurvedAnimation(
            parent: _progressController,
            curve: Curves.easeOut,
          ),
        );

    _badgeRotateAnimation =
        Tween<double>(
          begin: 0.0,
          end: 0.1,
        ).animate(
          CurvedAnimation(
            parent: _badgeController,
            curve: Curves.easeInOut,
          ),
        );

    _badgeScaleAnimation =
        Tween<double>(
          begin: 1.0,
          end: 1.1,
        ).animate(
          CurvedAnimation(
            parent: _badgeController,
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
  }

  void _startAnimations() {
    _mainController.forward();

    Future.delayed(const Duration(milliseconds: 300), () {
      _checkController.forward();
    });

    Future.delayed(const Duration(milliseconds: 800), () {
      _pulseController.repeat();
    });

    // Start card animations with stagger
    for (int i = 0; i < _cardControllers.length; i++) {
      Future.delayed(Duration(milliseconds: 1000 + (i * 100)), () {
        _cardControllers[i].forward();
      });
    }

    Future.delayed(const Duration(milliseconds: 1500), () {
      _progressController.forward();
    });

    Future.delayed(const Duration(milliseconds: 1200), () {
      _badgeController.repeat(reverse: true);
      _shineController.repeat();
    });

    // Start background animations with stagger
    for (int i = 0; i < _backgroundControllers.length; i++) {
      Future.delayed(Duration(milliseconds: 500 + (i * 300)), () {
        _backgroundControllers[i].repeat(reverse: true);
      });
    }
  }

  @override
  void dispose() {
    _mainController.dispose();
    _checkController.dispose();
    _pulseController.dispose();
    _progressController.dispose();
    _badgeController.dispose();
    _shineController.dispose();
    for (var controller in _cardControllers) {
      controller.dispose();
    }
    for (var controller in _backgroundControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _gotoMapScreen() {
    context.go(
      AppWrapper.route,
      extra: AppWrapperArgs(
        homeScreenArgs: HomeScreenArgs(
          initialTab: HomeTab.map,
        ),
      ),
    );
  }

  void _gotoProfileScreen() {
    context.go(
      AppWrapper.route,
      extra: AppWrapperArgs(
        homeScreenArgs: HomeScreenArgs(
          initialTab: HomeTab.profile,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _mainController,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.spMin),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF10b981), // green-400
                    Color(0xFF059669), // emerald-500
                    Color(0xFF047857), // green-600
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: SafeArea(
                child: _buildContent(),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(32.spMin),
        child: Column(
          children: [
            30.hSizedBox,
            _buildSuccessIcon(),
            40.hSizedBox,
            _buildHeader(),
            40.hSizedBox,
            _buildAchievementCards(),
            40.hSizedBox,
            _buildActionButtons(),
            20.hSizedBox,
            _buildTagline(),
          ],
        ),
      ),
    );
  }

  Widget _buildSuccessIcon() {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Pulse rings
        AnimatedBuilder(
          animation: _pulseController,
          builder: (context, child) {
            return Transform.scale(
              scale: _pulseScaleAnimation.value,
              child: Opacity(
                opacity: _pulseOpacityAnimation.value,
                child: Container(
                  width: 96.spMin,
                  height: 96.spMin,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.white,
                      width: 4,
                    ),
                  ),
                ),
              ),
            );
          },
        ),

        // Main check circle
        AnimatedBuilder(
          animation: _checkController,
          builder: (context, child) {
            return Transform.scale(
              scale: _checkScaleAnimation.value,
              child: Transform.rotate(
                angle: _checkRotateAnimation.value,
                child: Container(
                  width: 96.spMin,
                  height: 96.spMin,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.white.withValues(alpha: 0.4),
                        blurRadius: 20.spMin,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: AnimatedBuilder(
                    animation: _checkController,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _checkScaleAnimation.value,
                        child: Icon(
                          Icons.check_rounded,
                          size: 56.spMin,
                          color: Colors.green.shade500,
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 800),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, opacity, child) {
        return TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 600),
          tween: Tween<double>(begin: 10, end: 0),
          builder: (context, offset, child) {
            return Transform.translate(
              offset: Offset(0, offset),
              child: Opacity(
                opacity: opacity,
                child: Column(
                  children: [
                    Text(
                      'Setup Complete!',
                      style: TextStyle(
                        fontSize: 32.spMin,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    12.hSizedBox,
                    Text(
                      'Your ALRT setup will help keep your community safe',
                      style: TextStyle(
                        fontSize: 16.spMin,
                        color: Colors.green.shade50,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildAchievementCards() {
    return Column(
      children: [
        _buildXPCard(),
        12.hSizedBox,
        _buildLevelCard(),
        12.hSizedBox,
        _buildBadgeCard(),
      ],
    );
  }

  Widget _buildXPCard() {
    return AnimatedBuilder(
      animation: _cardControllers[0],
      builder: (context, child) {
        final slideAnimation =
            Tween<Offset>(
              begin: const Offset(-20, 0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: _cardControllers[0],
                curve: Curves.easeOut,
              ),
            );

        final opacityAnimation =
            Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: _cardControllers[0],
                curve: Curves.easeOut,
              ),
            );

        return Transform.translate(
          offset: slideAnimation.value,
          child: Opacity(
            opacity: opacityAnimation.value,
            child: Container(
              padding: EdgeInsets.all(16.spMin),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16.spMin),
                border: Border.all(
                  color: AppColors.orange500,
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowColor,
                    blurRadius: 10.spMin,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 48.spMin,
                        height: 48.spMin,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.orange500,
                              AppColors.orange500.withValues(alpha: 0.8),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(12.spMin),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.orange.withValues(alpha: 0.3),
                              blurRadius: 8.spMin,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.auto_awesome,
                          size: 24.spMin,
                          color: AppColors.white,
                        ),
                      ),
                      16.wSizedBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'XP Earned',
                            style: TextStyle(
                              fontSize: 12.spMin,
                              color: AppColors.grey,
                            ),
                          ),
                          Text(
                            'You\'re on a streak!',
                            style: TextStyle(
                              fontSize: 16.spMin,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  TweenAnimationBuilder<double>(
                    duration: const Duration(milliseconds: 1500),
                    tween: Tween<double>(begin: 1, end: 1.1),
                    builder: (context, scale, child) {
                      return Transform.scale(
                        scale: scale,
                        child: Text(
                          '+50',
                          style: TextStyle(
                            fontSize: 24.spMin,
                            fontWeight: FontWeight.w700,
                            color: AppColors.orange500,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLevelCard() {
    return AnimatedBuilder(
      animation: _cardControllers[1],
      builder: (context, child) {
        final slideAnimation =
            Tween<Offset>(
              begin: const Offset(-20, 0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: _cardControllers[1],
                curve: Curves.easeOut,
              ),
            );

        final opacityAnimation =
            Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: _cardControllers[1],
                curve: Curves.easeOut,
              ),
            );

        return Transform.translate(
          offset: slideAnimation.value,
          child: Opacity(
            opacity: opacityAnimation.value,
            child: Container(
              padding: EdgeInsets.all(16.spMin),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16.spMin),
                border: Border.all(
                  color: AppColors.purple,
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowColor,
                    blurRadius: 10.spMin,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 48.spMin,
                    height: 48.spMin,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColors.purple.withValues(alpha: 0.7),
                          AppColors.pink.withValues(alpha: 0.7),
                          AppColors.purple.withValues(alpha: 0.7),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(12.spMin),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.purple.withValues(alpha: 0.3),
                          blurRadius: 8.spMin,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.emoji_events,
                      size: 24.spMin,
                      color: AppColors.white,
                    ),
                  ),
                  16.wSizedBox,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Level Progress',
                          style: TextStyle(
                            fontSize: 12.spMin,
                            color: AppColors.grey,
                          ),
                        ),
                        4.hSizedBox,
                        Text(
                          '75 XP to Level 2',
                          style: TextStyle(
                            fontSize: 16.spMin,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                        ),
                        8.hSizedBox,
                        Container(
                          height: 8.spMin,
                          decoration: BoxDecoration(
                            color: AppColors.extraLightGrey,
                            borderRadius: BorderRadius.circular(4.spMin),
                          ),
                          child: AnimatedBuilder(
                            animation: _progressController,
                            builder: (context, child) {
                              return FractionallySizedBox(
                                alignment: Alignment.centerLeft,
                                widthFactor: _progressAnimation.value,
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        AppColors.purple.withValues(alpha: 0.6),
                                        AppColors.pink.withValues(alpha: 0.8),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      4.spMin,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBadgeCard() {
    return AnimatedBuilder(
      animation: _cardControllers[2],
      builder: (context, child) {
        final slideAnimation =
            Tween<Offset>(
              begin: const Offset(-20, 0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: _cardControllers[2],
                curve: Curves.easeOut,
              ),
            );

        final opacityAnimation =
            Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: _cardControllers[2],
                curve: Curves.easeOut,
              ),
            );

        return Transform.translate(
          offset: slideAnimation.value,
          child: Opacity(
            opacity: opacityAnimation.value,
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(16.spMin),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.orange500.withValues(alpha: 0.8),
                        AppColors.orange500,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16.spMin),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.orange500.withValues(alpha: 0.3),
                        blurRadius: 15.spMin,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      AnimatedBuilder(
                        animation: _badgeController,
                        builder: (context, child) {
                          return Transform.rotate(
                            angle: _badgeRotateAnimation.value,
                            child: Transform.scale(
                              scale: _badgeScaleAnimation.value,
                              child: Container(
                                width: 48.spMin,
                                height: 48.spMin,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(12.spMin),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.shadowColor,
                                      blurRadius: 8.spMin,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    '🏅',
                                    style: TextStyle(fontSize: 24.spMin),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      16.wSizedBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'New Achievement',
                            style: TextStyle(
                              fontSize: 12.spMin,
                              color: AppColors.white,
                            ),
                          ),
                          Text(
                            'Safety Explorer unlocked',
                            style: TextStyle(
                              fontSize: 16.spMin,
                              fontWeight: FontWeight.w600,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Shine effect
                AnimatedBuilder(
                  animation: _shineController,
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
                                  Colors.white.withValues(alpha: 0.3),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildActionButtons() {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 800),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, opacity, child) {
        return TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 600),
          tween: Tween<double>(begin: 10, end: 0),
          builder: (context, offset, child) {
            return Transform.translate(
              offset: Offset(0, offset),
              child: Opacity(
                opacity: opacity,
                child: Column(
                  children: [
                    _buildActionButton(
                      'Explore Map',
                      _gotoMapScreen,
                    ),
                    12.hSizedBox,
                    _buildActionButton(
                      'View Profile',
                      _gotoProfileScreen,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildActionButton(String title, VoidCallback onPressed) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(100.spMin),
        boxShadow: [
          BoxShadow(
            color: AppColors.white.withValues(alpha: 0.3),
            blurRadius: 15.spMin,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(100.spMin),
          onTap: onPressed,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15.spMin),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16.spMin,
                fontWeight: FontWeight.w600,
                color: Colors.green.shade600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTagline() {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 1000),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, opacity, child) {
        return Opacity(
          opacity: opacity,
          child: Text(
            'Stay alert, stay connected.',
            style: TextStyle(
              fontSize: 14.spMin,
              color: Colors.green.shade50,
            ),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
