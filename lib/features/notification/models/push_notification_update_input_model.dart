import 'package:freezed_annotation/freezed_annotation.dart';

part 'push_notification_update_input_model.freezed.dart';
part 'push_notification_update_input_model.g.dart';

@freezed
abstract class PushNotificationUpdateInput with _$PushNotificationUpdateInput {
  const factory PushNotificationUpdateInput({
    required final String settingType,
    required final String settingKey,
    required final bool isEnabled,
  }) = _PushNotificationUpdateInput;

  factory PushNotificationUpdateInput.fromJson(Map<String, dynamic> json) =>
      _$PushNotificationUpdateInputFromJson(json);
}
