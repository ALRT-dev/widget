import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hazard_app/features/notification/models/push_notification_update_input_model.dart';

part 'push_notification_settings_model.freezed.dart';
part 'push_notification_settings_model.g.dart';

@freezed
abstract class PushNotificationSettings with _$PushNotificationSettings {
  const PushNotificationSettings._();

  const factory PushNotificationSettings({
    /// Push notifications settings by severity level.
    @Default(PushNotificationSettingsBySeverity())
    final PushNotificationSettingsBySeverity severity,
  }) = _PushNotificationSettings;

  /// Converts the current settings into a list of updates suitable for sending to the server.
  List<PushNotificationUpdateInput> toUpdates() {
    return [
      PushNotificationUpdateInput(
        settingType: 'severity',
        settingKey: 'info',
        isEnabled: severity.info,
      ),
      PushNotificationUpdateInput(
        settingType: 'severity',
        settingKey: 'advice',
        isEnabled: severity.advice,
      ),
      PushNotificationUpdateInput(
        settingType: 'severity',
        settingKey: 'watchAndAct',
        isEnabled: severity.watchAndAct,
      ),
      PushNotificationUpdateInput(
        settingType: 'severity',
        settingKey: 'emergency',
        isEnabled: severity.emergency,
      ),
    ];
  }

  factory PushNotificationSettings.fromJson(Map<String, dynamic> json) =>
      _$PushNotificationSettingsFromJson(json);
}

@freezed
abstract class PushNotificationSettingsBySeverity
    with _$PushNotificationSettingsBySeverity {
  const factory PushNotificationSettingsBySeverity({
    @Default(true) final bool info,
    @Default(true) final bool advice,
    @Default(true) final bool watchAndAct,
    @Default(true) final bool emergency,
  }) = _PushNotificationSettingsBySeverity;

  factory PushNotificationSettingsBySeverity.fromJson(
    Map<String, dynamic> json,
  ) => _$PushNotificationSettingsBySeverityFromJson(json);
}
