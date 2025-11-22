import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';
import 'package:hazard_app/features/shared/providers/hazard_filters_provider.dart';
import 'package:hazard_app/features/shared/providers/main_categories_provider.dart';
import 'package:hazard_app/features/shared/providers/states/main_categories_provider_state.dart';
import 'package:hazard_app/features/shared/views/widgets/base_bottomsheet.dart';
import 'package:hazard_app/features/shared/views/widgets/round_button.dart';
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
  @override
  Widget build(BuildContext context) {
    return BaseBottomsheet(
      safeAreaBottom: false,
      child: SizedBox(
        height: 0.85.sh,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _headerBuilder().pX(20.0),
            16.hSizedBox,
            _dividerBuilder(),
            Expanded(
              child: _filtersContentBuilder(),
            ),
          ],
        ).pY(16.0),
      ),
    );
  }

  Widget _headerBuilder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _titleBuilder(),
        RoundButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.close_rounded,
            color: AppColors.black,
            size: 20.sp,
          ),
        ),
      ],
    );
  }

  Widget _titleBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Alrt Filters',
          style: TextStyle(
            fontSize: 22.spMin,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
            height: 1.2,
          ),
        ),
        2.hSizedBox,
        Text(
          'Customize your filter visibility',
          style: TextStyle(
            fontSize: 13.spMin,
            fontWeight: FontWeight.w400,
            color: AppColors.grey,
          ),
        ),
      ],
    );
  }

  Widget _dividerBuilder() {
    return Container(
      height: 1,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            AppColors.grey.withValues(alpha: 0.3),
            Colors.transparent,
          ],
        ),
      ),
    );
  }

  Widget _filtersContentBuilder() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.hSizedBox,
          _awsEmergencySection(),
          12.hSizedBox,
          _otherSourcesSection(),
          24.hSizedBox,
          _categoriesSection(),
          24.hSizedBox,
        ],
      ).pX(20.0),
    );
  }

  Widget _sectionTitleBuilder(String title) {
    return Row(
      children: [
        Container(
          width: 3,
          height: 16.spMin,
          decoration: BoxDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        8.wSizedBox,
        Text(
          title,
          style: TextStyle(
            fontSize: 16.spMin,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }

  Widget _awsEmergencySection() {
    return Consumer(
      builder: (context, ref, child) {
        final awsEmergency = ref.watch(
          providerOfHazardFilters(
            widget.filtersKey,
          ).select((s) => s.awsEmergency),
        );
        final awsWatchAndAct = ref.watch(
          providerOfHazardFilters(
            widget.filtersKey,
          ).select((s) => s.awsWatchAndAct),
        );
        final awsAdvice = ref.watch(
          providerOfHazardFilters(
            widget.filtersKey,
          ).select((s) => s.awsAdvice),
        );
        final filterProvider = ref.read(
          providerOfHazardFilters(widget.filtersKey).notifier,
        );

        return Column(
          children: [
            _filterToggleCard(
              title: 'Emergency',
              description: 'Immediate threat to life and property',
              isEnabled: awsEmergency,
              onToggle: (value) {
                filterProvider.updateAwsEmergency(value);
                widget.onFiltersUpdated?.call();
              },
              color: Colors.red,
              icon: Icons.warning_rounded,
            ),
            12.hSizedBox,
            _filterToggleCard(
              title: 'Watch and Act',
              description: 'Conditions are changing - prepare now',
              isEnabled: awsWatchAndAct,
              onToggle: (value) {
                filterProvider.updateAwsWatchAndAct(value);
                widget.onFiltersUpdated?.call();
              },
              color: Colors.orange,
              icon: Icons.visibility_rounded,
            ),
            12.hSizedBox,
            _filterToggleCard(
              title: 'Advice',
              description: 'Stay informed and monitor conditions',
              isEnabled: awsAdvice,
              onToggle: (value) {
                filterProvider.updateAwsAdvice(value);
                widget.onFiltersUpdated?.call();
              },
              color: Colors.amber,
              icon: Icons.info_outline_rounded,
            ),
          ],
        );
      },
    );
  }

  Widget _otherSourcesSection() {
    return Consumer(
      builder: (context, ref, child) {
        final officialNonAws = ref.watch(
          providerOfHazardFilters(
            widget.filtersKey,
          ).select((s) => s.officialNonAws),
        );
        final isUserReported = ref.watch(
          providerOfHazardFilters(
            widget.filtersKey,
          ).select((s) => s.userReported),
        );
        final filterProvider = ref.read(
          providerOfHazardFilters(widget.filtersKey).notifier,
        );

        return Column(
          children: [
            _filterToggleCard(
              title: 'Official Non-AWS',
              description: 'Official sources other than AWS',
              isEnabled: officialNonAws,
              onToggle: (value) {
                filterProvider.updateOfficialNonAws(value);
                widget.onFiltersUpdated?.call();
              },
              color: Colors.blue,
              icon: Icons.account_balance_rounded,
            ),
            12.hSizedBox,
            _filterToggleCard(
              title: 'User Reported',
              description: 'Community and user submissions',
              isEnabled: isUserReported,
              onToggle: (value) {
                filterProvider.updateUserReported(value);
                widget.onFiltersUpdated?.call();
              },
              color: Colors.green,
              icon: Icons.group_rounded,
            ),
          ],
        );
      },
    );
  }

  Widget _filterToggleCard({
    required final String title,
    required final String description,
    required final bool isEnabled,
    required final ValueChanged<bool> onToggle,
    required final Color color,
    final IconData? icon,
  }) {
    return GestureDetector(
      onTap: () => onToggle(!isEnabled),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.all(18.spMin),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 8,
              offset: const Offset(0, 2),
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 16,
              offset: const Offset(0, 4),
              spreadRadius: 2,
            ),
          ],
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
                      height: 1.2,
                    ),
                  ),
                  4.hSizedBox,
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 13.spMin,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
            _customToggleSwitch(
              isEnabled: isEnabled,
              onToggle: onToggle,
              activeColor: AppColors.green.withValues(alpha: 0.6),
            ),
          ],
        ),
      ),
    );
  }

  Widget _customToggleSwitch({
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
          borderRadius: BorderRadius.circular(13.r),
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
                  borderRadius: BorderRadius.circular(11.r),
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

  Widget _categoriesSection() {
    return Consumer(
      builder: (context, ref, child) {
        final categoriesState = ref.watch(
          providerOfMainCategories.select(
            (value) => value.getMainCategoriesState,
          ),
        );

        return categoriesState.when(
          initial: () => const SizedBox.shrink(),
          loading: () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _sectionTitleBuilder('Categories'),
              16.hSizedBox,
              SizedBox(
                height: 50.spMin,
                child: Center(
                  child: SizedBox(
                    width: 20.spMin,
                    height: 20.spMin,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          success: (cats) {
            if (cats.isEmpty) return const SizedBox.shrink();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _sectionTitleBuilder('Categories'),
                12.hSizedBox,
                ...cats.map((category) => _categoryToggleCard(category)),
              ],
            );
          },
          error: (error) => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _categoryToggleCard(HazardCategory category) {
    return Consumer(
      builder: (context, ref, child) {
        final isSelected = ref.watch(
          providerOfHazardFilters(
            widget.filtersKey,
          ).select((s) => s.selectedCategoryIds.contains(category.id)),
        );
        final filterProvider = ref.read(
          providerOfHazardFilters(widget.filtersKey).notifier,
        );
        final categoryColor = category.color ?? Colors.blue;

        return Padding(
          padding: EdgeInsets.only(bottom: 12.spMin),
          child: _filterToggleCard(
            title: category.name ?? 'Unknown Category',
            description: category.description ?? 'Hazard category',
            isEnabled: isSelected,
            onToggle: (value) {
              filterProvider.toggleCategory(category.id);
              widget.onFiltersUpdated?.call();
            },
            color: categoryColor,
          ),
        );
      },
    );
  }
}
