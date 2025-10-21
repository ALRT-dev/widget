import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hazard_app/features/notification/providers/manage_notifications_provider.dart';
import 'package:hazard_app/features/notification/providers/states/manage_notifications_provider_state.dart';
import 'package:hazard_app/features/notification/views/widgets/manage_push_notifications_list_item.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/views/widgets/spinner.dart';
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
    final getPushNotificationSettingsState = ref.watch(
      providerOfManageNotifications.select(
        (value) => value.getPushNotificationSettingsState,
      ),
    );

    return getPushNotificationSettingsState.maybeWhen(
      loading: _loadingBuilder,
      error: _errorBuilder,
      success: (_) => _dataBuilder(),
      orElse: () => const SizedBox.shrink(),
    );
  }

  Widget _loadingBuilder() {
    return Spinner();
  }

  Widget _errorBuilder(final AppError error) {
    return Center(
      child: Text(
        'An error occurred. Please try again later.',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }

  Widget _dataBuilder() {
    return Consumer(
      builder: (context, ref, child) {
        final serverityPushNotificationSettings = ref.watch(
          providerOfManageNotifications.select(
            (value) => value.pushNotificationSettings.severity,
          ),
        );
        return ListView(
          children: [
            ManagePushNotificationsListItem(
              title: 'Emergency Warning',
              subtitle: 'Immediate life-threatening situations',
              color: AppColors.red,
              emoji: '🔴',
              isEnabled: serverityPushNotificationSettings.emergency,
              onToggle: ref
                  .read(providerOfManageNotifications.notifier)
                  .updateIsEmergencyEnabled,
            ),
            ManagePushNotificationsListItem(
              title: 'Watch & Act',
              subtitle: 'Conditions are changing, stay alert',
              color: AppColors.orange,
              emoji: '🟠',
              isEnabled: serverityPushNotificationSettings.watchAndAct,
              onToggle: ref
                  .read(providerOfManageNotifications.notifier)
                  .updateIsWatchAndActEnabled,
            ),
            ManagePushNotificationsListItem(
              title: 'Advice',
              subtitle: 'General information and updates',
              color: AppColors.yellow,
              isEnabled: serverityPushNotificationSettings.advice,
              emoji: '🟡',
              onToggle: ref
                  .read(providerOfManageNotifications.notifier)
                  .updateIsAdviceEnabled,
            ),
            ManagePushNotificationsListItem(
              title: 'Information',
              subtitle: 'Non-urgent informational updates',
              color: AppColors.blue,
              emoji: '🔵',
              isEnabled: serverityPushNotificationSettings.info,
              onToggle: ref
                  .read(providerOfManageNotifications.notifier)
                  .updateIsInfoEnabled,
            ),
            // ManagePushNotificationsListItem(
            //   title: 'Crowd Alert (Unconfirmed)',
            //   subtitle: 'User-reported incidents awaiting verification',
            //   color: AppColors.grey,
            //   emoji: '⚪',
            // ),
            // ManagePushNotificationsListItem(
            //   title: 'Crowd Alert (Emerging)',
            //   subtitle: 'Reports under investigation',
            //   color: Colors.brown,
            //   emoji: '🟤',
            // ),
            // ManagePushNotificationsListItem(
            //   title: 'Crowd Alert (Verified)',
            //   subtitle: 'Confirmed community-reported incidents',
            //   color: AppColors.green,
            //   emoji: '🟢',
            // ),
          ],
        );
      },
    );
  }
}
