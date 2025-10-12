import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';

part 'home_provider_state.freezed.dart';

@freezed
abstract class HomeProviderState with _$HomeProviderState {
  const factory HomeProviderState({
    /// The state of sending push notification token to the server
    @Default(SendPushNotificationTokenState.initial())
    final SendPushNotificationTokenState sendPushNotificationTokenState,
  }) = _HomeProviderState;
}

@freezed
class SendPushNotificationTokenState with _$SendPushNotificationTokenState {
  const factory SendPushNotificationTokenState.initial() =
      _SendPushNotificationTokenStateInitial;
  const factory SendPushNotificationTokenState.loading() =
      _SendPushNotificationTokenStateLoading;
  const factory SendPushNotificationTokenState.success(
    final String token,
  ) = _SendPushNotificationTokenStateSuccess;
  const factory SendPushNotificationTokenState.error(
    final AppError error,
  ) = _SendPushNotificationTokenStateError;
}
