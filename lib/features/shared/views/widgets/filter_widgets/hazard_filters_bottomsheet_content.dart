import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/shared/extensions/color_extension.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/providers/hazard_filters_provider.dart';
import 'package:hazard_app/features/shared/providers/main_categories_provider.dart';
import 'package:hazard_app/features/shared/views/widgets/base_bottomsheet_v2.dart';
import 'package:hazard_app/others/app_colors.dart';

class HazardFiltersBottomsheetContent extends ConsumerStatefulWidget {
  const HazardFiltersBottomsheetContent({
    super.key,
    required this.filtersKey,
    this.onFiltersUpdated,
  });

  /// The key to identify the specific hazard filters instance.
  final String filtersKey;

  /// Callback when any filter is updated.
  final void Function()? onFiltersUpdated;

  @override
  ConsumerState<HazardFiltersBottomsheetContent> createState() =>
      _HazardFiltersBottomsheetContentState();
}

class _HazardFiltersBottomsheetContentState
    extends ConsumerState<HazardFiltersBottomsheetContent> {
  late final _filtersProvider = providerOfHazardFilters(widget.filtersKey);

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
                    _alertTypesSection(),
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
            'ALRT Filters',
            style: TextStyle(
              fontSize: 22.spMin,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
              height: 1.2,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(20.spMin),
              border: Border.all(
                color: AppColors.white.withValues(alpha: 0.3),
                width: 1.0,
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 14.spMin,
              vertical: 5.spMin,
            ),
            child: Text(
              'Reset All',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
          ).onPressed(_handleResetAll),
        ],
      ),
    );
  }

  Widget _awsWarningsSection() {
    return Consumer(
      builder: (context, ref, child) {
        final awsEmergency = ref.watch(
          _filtersProvider.select((value) => value.awsEmergency),
        );
        final awsWatchAndAct = ref.watch(
          _filtersProvider.select((value) => value.awsWatchAndAct),
        );
        final awsAdvice = ref.watch(
          _filtersProvider.select((value) => value.awsAdvice),
        );

        return _sectionContainerBuilder(
          title: 'AWS Warnings'.toUpperCase(),
          subtitle: 'Official Australian Warning System alerts only',
          spacing: 5.0,
          padding: EdgeInsets.only(
            top: 18.spMin,
            bottom: 10.spMin,
            left: 18.spMin,
            right: 18.spMin,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _checkboxBuilder(
                title: 'Emergency Warning',
                isEnabled: awsEmergency,
                activeColor: AppColors.emergency,
                onToggle: (value) {
                  ref.read(_filtersProvider.notifier).updateAwsEmergency(value);
                  widget.onFiltersUpdated?.call();
                },
              ),
              Divider(
                color: AppColors.extraLightGrey,
                height: 0.0,
              ),
              _checkboxBuilder(
                title: 'Watch & Act',
                isEnabled: awsWatchAndAct,
                activeColor: AppColors.watchAndAct,
                onToggle: (value) {
                  ref
                      .read(_filtersProvider.notifier)
                      .updateAwsWatchAndAct(value);
                  widget.onFiltersUpdated?.call();
                },
              ),
              Divider(
                color: AppColors.extraLightGrey,
                height: 0.0,
              ),
              _checkboxBuilder(
                title: 'Advice',
                isEnabled: awsAdvice,
                activeColor: AppColors.advice.darken(0.01),
                onToggle: (value) {
                  ref.read(_filtersProvider.notifier).updateAwsAdvice(value);
                  widget.onFiltersUpdated?.call();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _alertTypesSection() {
    return Consumer(
      builder: (context, ref, child) {
        final officialAlerts = ref.watch(
          _filtersProvider.select((value) => value.officialNonAws),
        );
        final userAlerts = ref.watch(
          _filtersProvider.select((value) => value.userReported),
        );

        return _sectionContainerBuilder(
          title: 'Alrt Type'.toUpperCase(),
          subtitle: 'Select the alerts you want to see',
          child: Column(
            children: [
              _switchBuilder(
                title: 'Official Alerts',
                subtitle: 'Verified alerts from official agencies (non-AWS)',
                isEnabled: officialAlerts,
                onToggle: (value) {
                  ref
                      .read(_filtersProvider.notifier)
                      .updateOfficialNonAws(value);
                  widget.onFiltersUpdated?.call();
                },
              ),
              10.hSizedBox,
              _switchBuilder(
                title: 'User Alerts',
                subtitle: 'Community-reported alerts (unverified)',
                isEnabled: userAlerts,
                onToggle: (value) {
                  ref.read(_filtersProvider.notifier).updateUserReported(value);
                  widget.onFiltersUpdated?.call();
                },
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
        final selectedCategories = ref.watch(
          _filtersProvider.select((value) => value.selectedCategoryIds),
        );
        return _sectionContainerBuilder(
          title: 'Alrt Categories'.toUpperCase(),
          subtitle:
              'One category shown on every alert. Tap to toggle visibility.',
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
                    isSelected: selectedCategories.contains(category.id),
                    onToggle: (value) {
                      ref
                          .read(_filtersProvider.notifier)
                          .toggleCategory(category.id);
                      widget.onFiltersUpdated?.call();
                    },
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

  Widget _checkboxBuilder({
    required final String title,
    required final bool isEnabled,
    final Color activeColor = AppColors.primary,
    required final ValueChanged<bool> onToggle,
  }) {
    return Row(
      children: [
        Container(
          width: 22.spMin,
          height: 22.spMin,
          decoration: BoxDecoration(
            color: isEnabled ? activeColor : Colors.transparent,
            borderRadius: BorderRadius.circular(6.spMin),
            border: Border.all(
              color: isEnabled
                  ? activeColor
                  : AppColors.grey.withValues(alpha: 0.4),
              width: 1.2,
            ),
            boxShadow: [
              if (isEnabled)
                BoxShadow(
                  color: activeColor.withValues(alpha: 0.5),
                  blurRadius: 8,
                  offset: const Offset(0.0, 0.0),
                ),
            ],
          ),
          child: isEnabled
              ? Icon(
                  Icons.check_rounded,
                  color: AppColors.white,
                  size: 16.spMin,
                )
              : null,
        ),
        12.wSizedBox,
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16.spMin,
              color: AppColors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    ).pY(18.0).onPressed(() => onToggle(!isEnabled));
  }

  Widget _switchBuilder({
    required final String title,
    required final String subtitle,
    required final bool isEnabled,
    required final ValueChanged<bool> onToggle,
  }) {
    return Container(
      padding: EdgeInsets.all(16.spMin),
      decoration: BoxDecoration(
        color: isEnabled
            ? AppColors.orange.withValues(alpha: 0.06)
            : AppColors.transparent,
        borderRadius: BorderRadius.circular(16.spMin),
        border: Border.all(
          color: isEnabled
              ? AppColors.orange.withValues(alpha: 0.5)
              : AppColors.lightGrey,
          width: 1.0,
        ),
      ),
      child: Row(
        children: [
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
                2.hSizedBox,
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12.spMin,
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
          ),
          _togglerBuilder(
            isEnabled: isEnabled,
            onToggle: onToggle,
            activeColor: AppColors.orange,
          ),
        ],
      ),
    ).onPressed(() => onToggle(!isEnabled));
  }

  Widget _togglerBuilder({
    required bool isEnabled,
    required ValueChanged<bool> onToggle,
    required Color activeColor,
  }) {
    return GestureDetector(
      onTap: () => onToggle(!isEnabled),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 48.spMin,
        height: 26.spMin,
        decoration: BoxDecoration(
          color: isEnabled ? activeColor : Colors.grey.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(13.spMin),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              left: isEnabled ? 24.spMin : 2.spMin,
              top: 2.spMin,
              child: Container(
                width: 22.spMin,
                height: 22.spMin,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(11.spMin),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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
        vertical: 8.spMin,
      ),
      decoration: BoxDecoration(
        color: isSelected ? color.withValues(alpha: 0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(20.spMin),
        border: Border.all(
          color: isSelected ? color : AppColors.lightGrey,
          width: 1.2.spMin,
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14.spMin,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
          color: isSelected ? color : AppColors.black,
        ),
      ),
    ).onPressed(() => onToggle(!isSelected));
  }

  void _handleResetAll() {
    ref.read(_filtersProvider.notifier).resetAllFilters();
    widget.onFiltersUpdated?.call();
  }
}
