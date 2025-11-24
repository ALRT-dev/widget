import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hazard_app/features/notification/providers/manage_notifications_provider.dart';
import 'package:hazard_app/features/shared/extensions/num_sized_box_extension.dart';
import 'package:hazard_app/features/shared/extensions/widget_extension.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';
import 'package:hazard_app/features/shared/providers/main_categories_provider.dart';
import 'package:hazard_app/features/shared/providers/states/main_categories_provider_state.dart';
import 'package:hazard_app/others/app_colors.dart';

class ManagePushNotificationsList extends ConsumerStatefulWidget {
  const ManagePushNotificationsList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ManagePushNotificationsListState();
}

class _ManagePushNotificationsListState
    extends ConsumerState<ManagePushNotificationsList> {
  @override
  Widget build(BuildContext context) {
    return _filtersContentBuilder();
  }

  Widget _filtersContentBuilder() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.hSizedBox,
          _alertTypesSection(),
          28.hSizedBox,
          _categoriesSection(),
          24.hSizedBox,
        ],
      ).pX(20.0),
    );
  }

  Widget _sectionTitleBuilder(
    String title, {
    required bool isEnabled,
    required VoidCallback onToggle,
  }) {
    return GestureDetector(
      onTap: onToggle,
      child: Row(
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
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16.spMin,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
          ),
          _customToggleSwitch(
            isEnabled: isEnabled,
            onToggle: (_) => onToggle(),
            activeColor: AppColors.green.withValues(alpha: 0.6),
          ),
        ],
      ),
    );
  }

  Widget _alertTypesSection() {
    return Consumer(
      builder: (context, ref, child) {
        final awsEmergency = ref.watch(
          providerOfManageNotifications.select(
            (s) => s.pushNotificationSettings.awsEmergency,
          ),
        );
        final awsWatchAndAct = ref.watch(
          providerOfManageNotifications.select(
            (s) => s.pushNotificationSettings.awsWatchAndAct,
          ),
        );
        final awsAdvice = ref.watch(
          providerOfManageNotifications.select(
            (s) => s.pushNotificationSettings.awsAdvice,
          ),
        );
        final officialNonAws = ref.watch(
          providerOfManageNotifications.select(
            (s) => s.pushNotificationSettings.officialNonAws,
          ),
        );
        final isUserReported = ref.watch(
          providerOfManageNotifications.select(
            (s) => s.pushNotificationSettings.userReported,
          ),
        );

        final isAnyAlertTypeEnabled =
            awsEmergency ||
            awsWatchAndAct ||
            awsAdvice ||
            officialNonAws ||
            isUserReported;

        final filterProvider = ref.read(
          providerOfManageNotifications.notifier,
        );

        return Column(
          children: [
            _sectionTitleBuilder(
              'Alert Types',
              isEnabled: isAnyAlertTypeEnabled,
              onToggle: () {
                if (isAnyAlertTypeEnabled) {
                  filterProvider.updateAwsEmergency(false);
                  filterProvider.updateAwsWatchAndAct(false);
                  filterProvider.updateAwsAdvice(false);
                  filterProvider.updateOfficialNonAws(false);
                  filterProvider.updateUserReported(false);
                } else {
                  filterProvider.updateAwsEmergency(true);
                  filterProvider.updateAwsWatchAndAct(true);
                  filterProvider.updateAwsAdvice(true);
                  filterProvider.updateOfficialNonAws(true);
                  filterProvider.updateUserReported(true);
                }
              },
            ),
            16.hSizedBox,
            _filterToggleCard(
              title: 'Emergency',
              description: 'Immediate threat to life and property',
              isEnabled: awsEmergency,
              onToggle: (value) {
                filterProvider.updateAwsEmergency(value);
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
              },
              color: Colors.amber,
              icon: Icons.info_outline_rounded,
            ),
            12.hSizedBox,
            _filterToggleCard(
              title: 'Official Non-AWS',
              description: 'Official sources other than AWS',
              isEnabled: officialNonAws,
              onToggle: (value) {
                filterProvider.updateOfficialNonAws(value);
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

        final isAnyCategoryEnabled = ref.watch(
          providerOfManageNotifications.select(
            (s) => s.pushNotificationSettings.subscribedCategoryIds.isNotEmpty,
          ),
        );

        return categoriesState.when(
          initial: () => const SizedBox.shrink(),
          loading: () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _sectionTitleBuilder(
                'Categories',
                isEnabled: isAnyCategoryEnabled,
                onToggle: () {},
              ),
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
            final filterProvider = ref.read(
              providerOfManageNotifications.notifier,
            );

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _sectionTitleBuilder(
                  'Categories',
                  isEnabled: isAnyCategoryEnabled,
                  onToggle: () {
                    if (isAnyCategoryEnabled) {
                      filterProvider.updateSelectedCategories({});
                    } else {
                      filterProvider.updateSelectedCategories(
                        cats.map((e) => e.id).toSet(),
                      );
                    }
                  },
                ),
                16.hSizedBox,
                ...cats.map((category) => _categoryToggleCard(category)),
              ],
            );
          },
          error: (error) => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _categoryToggleCard(final HazardCategory category) {
    return Consumer(
      builder: (context, ref, child) {
        final isSelected = ref.watch(
          providerOfManageNotifications.select(
            (s) => s.pushNotificationSettings.subscribedCategoryIds.contains(
              category.id,
            ),
          ),
        );
        final categoryColor = category.color ?? Colors.blue;

        return Padding(
          padding: EdgeInsets.only(bottom: 12.spMin),
          child: _filterToggleCard(
            title: category.name ?? 'Unknown Category',
            description: category.description ?? 'Hazard category',
            isEnabled: isSelected,
            onToggle: (value) {
              ref
                  .read(providerOfManageNotifications.notifier)
                  .toggleCategory(category.id);
            },
            color: categoryColor,
          ),
        );
      },
    );
  }
}
