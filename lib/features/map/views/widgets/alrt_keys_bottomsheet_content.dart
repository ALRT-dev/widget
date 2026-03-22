import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/shared/extensions/color_extension.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/providers/main_categories_provider.dart';
import 'package:hazard_app/features/shared/views/widgets/base_bottomsheet_v2.dart';
import 'package:hazard_app/others/app_colors.dart';

class AlrtKeysBottomsheetContent extends ConsumerStatefulWidget {
  const AlrtKeysBottomsheetContent({super.key});

  @override
  ConsumerState<AlrtKeysBottomsheetContent> createState() =>
      _AlrtKeysBottomsheetContentState();
}

class _AlrtKeysBottomsheetContentState
    extends ConsumerState<AlrtKeysBottomsheetContent> {
  @override
  Widget build(BuildContext context) {
    return BaseBottomsheetV2(
      initialChildSize: 0.8,
      minChildSize: 0.3,
      maxChildSize: 0.92,
      safeAreaBottom: false,
      builder: (context, scrollController) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _headerBuilder(),
          Expanded(
            child: Container(
              color: AppColors.extraLightGrey,
              child: SingleChildScrollView(
                controller: scrollController,
                padding: EdgeInsets.symmetric(
                  horizontal: 16.spMin,
                ),
                child: Column(
                  children: [
                    20.hSizedBox,
                    _awsWarningsSection(),
                    16.hSizedBox,
                    _officialWarningsSection(),
                    16.hSizedBox,
                    _globalWarningsSection(),
                    16.hSizedBox,
                    _categoriesSection(),
                    SafeArea(child: 20.hSizedBox),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _headerBuilder() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.orange300,
            AppColors.red200,
          ],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.spMin),
          topRight: Radius.circular(20.spMin),
        ),
      ),
      padding: EdgeInsets.all(16.spMin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'ALRT Key',
            style: TextStyle(
              fontSize: 22.spMin,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
              height: 1.2,
            ),
          ),
          Container(
            width: 35.spMin,
            height: 35.spMin,
            decoration: BoxDecoration(
              color: AppColors.white.withValues(alpha: 0.2),
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.white.withValues(alpha: 0.3),
                width: 1.0,
              ),
            ),
            child: Icon(
              Icons.close_rounded,
              color: AppColors.white,
              size: 20.spMin,
            ),
          ).onPressed(() => Navigator.pop(context)),
        ],
      ),
    );
  }

  Widget _awsWarningsSection() {
    final divider = Divider(
      color: AppColors.extraLightGrey,
      height: 35.spMin,
    );
    return Consumer(
      builder: (context, ref, child) {
        return _sectionContainerBuilder(
          title: 'Australian Warning System'.toUpperCase(),
          subtitle:
              "Australia's standardized public warning system for natural hazards and emergencies.",
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _infoBuilder(
                icon: TriangleOutline(
                  color: AppColors.emergency,
                  size: Size(24.spMin, 24.spMin),
                  borderRadius: 1.0,
                ),
                color: AppColors.emergency,
                title: 'Emergency Warning',
                subtitle: 'Immediate threat to life and property',
                indicatorText: 'Red triangle',
              ),
              divider,
              _infoBuilder(
                icon: TriangleOutline(
                  color: AppColors.watchAndAct,
                  size: Size(24.spMin, 24.spMin),
                  borderRadius: 1.0,
                ),
                color: AppColors.watchAndAct,
                title: 'Watch & Act',
                subtitle: 'Conditions are changing, take actions now',
                indicatorText: 'Orange triangle',
              ),
              divider,
              _infoBuilder(
                icon: TriangleOutline(
                  color: AppColors.advice,
                  size: Size(24.spMin, 24.spMin),
                  borderRadius: 1.0,
                ),
                color: AppColors.advice,
                title: 'Advice',
                subtitle: 'Stay informed, monitor the situation',
                indicatorText: 'Yellow triangle',
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _officialWarningsSection() {
    final colors = [
      AppColors.black,
      AppColors.advice,
      AppColors.watchAndAct,
      AppColors.emergency,
    ];

    return Consumer(
      builder: (context, ref, child) {
        return _sectionContainerBuilder(
          title: 'Official Alerts'.toUpperCase(),
          subtitle:
              "Verified alerts from recognised public agencies and emergency services.",
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 10.spMin,
            children: colors.map((e) {
              return Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final width = constraints.maxWidth;
                    return Container(
                      height: width,
                      decoration: BoxDecoration(
                        color: AppColors.extraLightGrey,
                        borderRadius: BorderRadius.circular(12.spMin),
                      ),
                      padding: EdgeInsets.all(27.spMin),
                      child: Center(
                        child: Transform.rotate(
                          angle: math.pi / 4,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1.spMin),
                              border: Border.all(
                                color: e,
                                width: 3.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  Widget _globalWarningsSection() {
    final divider = Divider(
      color: AppColors.extraLightGrey,
      height: 35.spMin,
    );
    return Consumer(
      builder: (context, ref, child) {
        return _sectionContainerBuilder(
          title: 'Global Warnings'.toUpperCase(),
          subtitle:
              "Global disaster and humanitarian alerts sourced from international monitoring agencies.",
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _infoBuilder(
                icon: Container(
                  width: 25.spMin,
                  height: 25.spMin,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.spMin),
                    border: Border.all(
                      color: AppColors.green,
                      width: 2.0,
                    ),
                  ),
                ),
                color: AppColors.green,
                title: 'Low Impact',
                subtitle: 'International alert - low humanitarian impact',
                indicatorText: 'Green square',
              ),
              divider,
              _infoBuilder(
                icon: Container(
                  width: 25.spMin,
                  height: 25.spMin,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.spMin),
                    border: Border.all(
                      color: AppColors.orange,
                      width: 2.0,
                    ),
                  ),
                ),
                color: AppColors.orange,
                title: 'Medium Impact',
                subtitle: 'International alert - medium humanitarian impact',
                indicatorText: 'Orange square',
              ),
              divider,
              _infoBuilder(
                icon: Container(
                  width: 25.spMin,
                  height: 25.spMin,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.spMin),
                    border: Border.all(
                      color: AppColors.red,
                      width: 2.0,
                    ),
                  ),
                ),
                color: AppColors.red,
                title: 'High Impact',
                subtitle: 'International alert - high humanitarian impact',
                indicatorText: 'Red square',
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _categoriesSection() {
    return Consumer(
      builder: (context, ref, child) {
        final categories = ref.watch(
          providerOfMainCategories.select(
            (value) => value.mainCategories,
          ),
        );
        return _sectionContainerBuilder(
          title: 'Alrt Categories'.toUpperCase(),
          subtitle:
              'Every alert is assigned one of the following categories, shown as a colour label on all alert types.',
          child: Wrap(
            spacing: 10.spMin,
            runSpacing: 10.spMin,
            children: categories
                .map(
                  (category) => _chipBuilder(
                    title: category.name ?? 'Unknown Category',
                    color: category.id == 'utilitiesAndInfrastructure'
                        ? category.color?.darken(0.3) ?? AppColors.primary
                        : category.color?.darken(0.2) ?? AppColors.primary,
                    isSelected: true,
                    onToggle: (value) {},
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }

  Widget _sectionContainerBuilder({
    required final String title,
    required final String subtitle,
    required final Widget child,
    final double spacing = 20.0,
    final EdgeInsets? padding,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: padding ?? EdgeInsets.all(18.spMin),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.spMin),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          3.hSizedBox,
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 14.spMin,
              color: AppColors.grey,
            ),
          ),
          spacing.hSizedBox,
          child,
        ],
      ),
    );
  }

  Widget _infoBuilder({
    required final Widget icon,
    required final String title,
    required final String subtitle,
    required final Color color,
    required final String indicatorText,
  }) {
    return Row(
      children: [
        icon,
        16.wSizedBox,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.spMin,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14.spMin,
                  color: AppColors.grey.withValues(alpha: 0.8),
                  fontWeight: FontWeight.w500,
                ),
              ),
              5.hSizedBox,
              Row(
                children: [
                  Container(
                    width: 10.spMin,
                    height: 10.spMin,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: color.withValues(alpha: 0.5),
                          blurRadius: 7,
                          offset: const Offset(0.0, 0.0),
                        ),
                      ],
                    ),
                  ),
                  5.wSizedBox,
                  Text(
                    indicatorText,
                    style: TextStyle(
                      fontSize: 12.spMin,
                      color: AppColors.grey.withValues(alpha: 0.8),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _chipBuilder({
    required final String title,
    required final Color color,
    required final bool isSelected,
    required final ValueChanged<bool> onToggle,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.spMin,
        vertical: 7.spMin,
      ),
      decoration: BoxDecoration(
        color: isSelected ? color.withValues(alpha: 0.05) : Colors.transparent,
        borderRadius: BorderRadius.circular(20.spMin),
        border: Border.all(
          color: isSelected ? color : AppColors.lightGrey,
          width: 1.2.spMin,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 10.spMin,
            height: 10.spMin,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          7.wSizedBox,
          Text(
            title,
            style: TextStyle(
              fontSize: 14.spMin,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              color: isSelected ? color : AppColors.black,
            ),
          ),
        ],
      ),
    ).onPressed(() => onToggle(!isSelected));
  }
}

class TriangleOutline extends StatelessWidget {
  final Size size;
  final double borderRadius;
  final double strokeWidth;
  final Color color;

  const TriangleOutline({
    super.key,
    required this.size,
    this.borderRadius = 0,
    this.strokeWidth = 2,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: size,
      painter: TriangleOutlinePainter(
        borderRadius: borderRadius,
        strokeWidth: strokeWidth,
        color: color,
      ),
    );
  }
}

class TriangleOutlinePainter extends CustomPainter {
  final double borderRadius;
  final double strokeWidth;
  final Color color;

  TriangleOutlinePainter({
    required this.borderRadius,
    required this.strokeWidth,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final p1 = Offset(size.width / 2, 0);
    final p2 = Offset(0, size.height);
    final p3 = Offset(size.width, size.height);

    final path = _roundedTrianglePath(p1, p2, p3, borderRadius);

    canvas.drawPath(path, paint);
  }

  Path _roundedTrianglePath(
    Offset p1,
    Offset p2,
    Offset p3,
    double radius,
  ) {
    final points = [p1, p2, p3];
    final path = Path();

    for (int i = 0; i < points.length; i++) {
      final prev = points[(i - 1 + points.length) % points.length];
      final curr = points[i];
      final next = points[(i + 1) % points.length];

      final v1 = prev - curr;
      final v2 = next - curr;

      final len1 = v1.distance;
      final len2 = v2.distance;

      final r = math.min(radius, math.min(len1, len2) / 2);

      final dir1 = Offset(v1.dx / len1, v1.dy / len1);
      final dir2 = Offset(v2.dx / len2, v2.dy / len2);

      final pA = curr + dir1 * r;
      final pB = curr + dir2 * r;

      if (i == 0) {
        path.moveTo(pA.dx, pA.dy);
      } else {
        path.lineTo(pA.dx, pA.dy);
      }

      path.quadraticBezierTo(curr.dx, curr.dy, pB.dx, pB.dy);
    }

    path.close();

    return path;
  }

  @override
  bool shouldRepaint(covariant TriangleOutlinePainter oldDelegate) {
    return oldDelegate.borderRadius != borderRadius ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.color != color;
  }
}
