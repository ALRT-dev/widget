import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:hazard_app/features/notification/models/push_notification_settings_model.dart';
import 'package:hazard_app/features/notification/providers/states/manage_notifications_provider_state.dart';
import 'package:hazard_app/features/shared/providers/service_providers.dart';
import 'package:hazard_app/features/shared/services/user_service.dart';

final providerOfManageNotifications =
    StateNotifierProvider<
      ManageNotificationsProvider,
      ManageNotificationsProviderState
    >(
      (final ref) => ManageNotificationsProvider(
        ref: ref,
        state: ManageNotificationsProviderState(),
      ),
    );

class ManageNotificationsProvider
    extends StateNotifier<ManageNotificationsProviderState> {
  ManageNotificationsProvider({
    required final Ref ref,
    required ManageNotificationsProviderState state,
  }) : _ref = ref,
       super(state) {
    getPushNotificationSettings();
  }

  final Ref _ref;
  UserService get _userService => _ref.read(providerOfUserService);

  /// Fetches the push notification settings for the current user.
  Future<void> getPushNotificationSettings() async {
    state = state.copyWith(
      getPushNotificationSettingsState:
          const GetPushNotificationSettingsState.loading(),
    );

    final result = await _userService.getPushNotificationSettings();
    if (!mounted) return;

    result.when(
      (settings) {
        state = state.copyWith(
          pushNotificationSettings: settings,
          getPushNotificationSettingsState:
              GetPushNotificationSettingsState.success(settings),
        );
      },
      (error) {
        state = state.copyWith(
          getPushNotificationSettingsState:
              GetPushNotificationSettingsState.error(error),
        );
      },
    );
  }

  /// Updates the push notification settings for the current user.
  Future<void> updatePushNotificationSettingsInTheServer() async {
    state = state.copyWith(
      updatePushNotificationSettingsState:
          const UpdatePushNotificationSettingsState.loading(),
    );

    final result = await _userService.updatePushNotificationSettings(
      settings: state.pushNotificationSettings,
    );
    if (!mounted) return;

    result.when(
      (settings) {
        state = state.copyWith(
          updatePushNotificationSettingsState:
              UpdatePushNotificationSettingsState.success(),
        );
      },
      (error) {
        state = state.copyWith(
          updatePushNotificationSettingsState:
              UpdatePushNotificationSettingsState.error(error),
        );
      },
    );
  }

  /// Updates [ManageNotificationsProviderState.pushNotificationSettings] with the given [settings].
  void updatePushNotificationSettings(final PushNotificationSettings settings) {
    state = state.copyWith(
      pushNotificationSettings: settings,
    );

    updatePushNotificationSettingsInTheServer();
  }

  /// Updates the emergency enabled status in [ManageNotificationsProviderState.pushNotificationSettings].
  void updateIsEmergencyEnabled(final bool isEnabled) {
    final currentSettings = state.pushNotificationSettings;
    final updatedSettings = currentSettings.copyWith(
      severity: currentSettings.severity.copyWith(
        emergency: isEnabled,
      ),
    );
    updatePushNotificationSettings(updatedSettings);
  }

  /// Updates the watchAndAct enabled status in [ManageNotificationsProviderState.pushNotificationSettings].
  void updateIsWatchAndActEnabled(final bool isEnabled) {
    final currentSettings = state.pushNotificationSettings;
    final updatedSettings = currentSettings.copyWith(
      severity: currentSettings.severity.copyWith(
        watchAndAct: isEnabled,
      ),
    );
    updatePushNotificationSettings(updatedSettings);
  }

  /// Updates the advice enabled status in [ManageNotificationsProviderState.pushNotificationSettings].
  void updateIsAdviceEnabled(final bool isEnabled) {
    final currentSettings = state.pushNotificationSettings;
    final updatedSettings = currentSettings.copyWith(
      severity: currentSettings.severity.copyWith(
        advice: isEnabled,
      ),
    );
    updatePushNotificationSettings(updatedSettings);
  }

  /// Updates the info enabled status in [ManageNotificationsProviderState.pushNotificationSettings].
  void updateIsInfoEnabled(final bool isEnabled) {
    final currentSettings = state.pushNotificationSettings;
    final updatedSettings = currentSettings.copyWith(
      severity: currentSettings.severity.copyWith(
        info: isEnabled,
      ),
    );
    updatePushNotificationSettings(updatedSettings);
  }
}
