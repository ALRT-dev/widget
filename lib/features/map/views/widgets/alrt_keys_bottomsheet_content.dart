import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/providers/main_categories_provider.dart';
import 'package:hazard_app/features/shared/views/widgets/base_bottomsheet_v2.dart';
import 'package:hazard_app/features/shared/views/widgets/category_filter_chip.dart';
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
                    _shapeKeySection(),
                    16.hSizedBox,
                    _bandColourSection(),
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

  /// The same key as the Map details sheet, word for word: shape says
  /// which system, colour says how urgent, community wears its category.
  /// Two sheets explaining the same pins differently is how the key
  /// stopped being trusted (QA 2026-08-07).
  Widget _shapeKeySection() {
    final divider = Divider(
      color: AppColors.extraLightGrey,
      height: 28.spMin,
    );
    const ink = AppColors.mediumGrey;
    final size = 26.spMin;

    return _sectionContainerBuilder(
      title: 'Key · shape says who',
      subtitle:
          'The shape tells you who the alert came from. The colour tells '
          'you how serious it is.',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _shapeKeyRowBuilder(
            shape: TriangleOutline(
              color: ink,
              size: Size(size, size),
              borderRadius: 1.0,
            ),
            name: 'Triangle · AWS warning',
            meaning: 'The only source that states a severity level',
          ),
          divider,
          _shapeKeyRowBuilder(
            shape: SizedBox(
              width: size,
              height: size,
              child: Center(
                child: Transform.rotate(
                  angle: math.pi / 4,
                  child: Container(
                    width: size * 0.72,
                    height: size * 0.72,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1.spMin),
                      border: Border.all(color: ink, width: 2.0),
                    ),
                  ),
                ),
              ),
            ),
            name: 'Diamond · official source',
            meaning: 'State agencies and services',
          ),
          divider,
          _shapeKeyRowBuilder(
            shape: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.spMin),
                border: Border.all(color: ink, width: 2.0),
              ),
            ),
            name: 'Rounded square · global humanitarian',
            meaning: "Carries the source's own scale, not an AWS level",
          ),
          divider,
          _shapeKeyRowBuilder(
            shape: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: ink, width: 2.0),
              ),
            ),
            name: 'Circle · community report',
            meaning: 'Unverified, from someone nearby',
          ),
          divider,
          _shapeKeyRowBuilder(
            shape: SvgPicture.asset(
              'assets/icons/shield.svg',
              width: size,
              height: size,
              colorFilter: const ColorFilter.mode(ink, BlendMode.srcIn),
            ),
            name: "Shield · ALRT's own assessment",
            meaning: 'Never restates or overrides an official warning',
          ),
        ],
      ),
    );
  }

  Widget _shapeKeyRowBuilder({
    required final Widget shape,
    required final String name,
    required final String meaning,
  }) {
    return Row(
      children: [
        SizedBox(width: 30.spMin, child: Center(child: shape)),
        16.wSizedBox,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 15.spMin,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),
              ),
              Text(
                meaning,
                style: TextStyle(
                  fontSize: 13.5.spMin,
                  color: AppColors.grey.withValues(alpha: 0.9),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// The four locked bands, lowest first — the same bar as Map details.
  Widget _bandColourSection() {
    const bands = [
      (AppColors.info, 'Info'),
      (AppColors.advice, 'Monitor'),
      (AppColors.watchAndAct, 'Action'),
      (AppColors.emergency, 'Critical'),
    ];

    return _sectionContainerBuilder(
      title: 'Colour says how urgent',
      subtitle:
          'Every shape takes the same four colours, so urgency reads the '
          'same whoever sent the alert.',
      child: Row(
        children: [
          for (final (index, (color, label)) in bands.indexed) ...[
            if (index > 0) 10.wSizedBox,
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 10.spMin,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                  6.hSizedBox,
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 12.spMin,
                      fontWeight: FontWeight.w600,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
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
          title: 'Community reports wear their category',
          subtitle:
              'Every alert carries one of these categories; community pins '
              'take the category colour, never a severity colour.',
          child: Wrap(
            spacing: 10.spMin,
            runSpacing: 10.spMin,
            children: categories
                .map(
                  (category) => CategoryFilterChip(
                    category: category,
                    isSelected: true,
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
          // The V3 section label: rust, uppercase, letter-spaced, the
          // same one every other section header in the app wears. These
          // two sheets were drawing plain black body type instead, which
          // is what made them read as a different app.
          Text(
            title.toUpperCase(),
            style: TextStyle(
              fontSize: 10.5.spMin,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.1,
              color: const Color(0xFFB84500),
            ),
          ),
          5.hSizedBox,
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 13.spMin,
              height: 1.45,
              color: AppColors.grey,
            ),
          ),
          spacing.hSizedBox,
          child,
        ],
      ),
    );
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
