import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:hazard_app/features/home/providers/states/home_provider_state.dart';
import 'package:hazard_app/features/notification/providers/service_providers.dart';
import 'package:hazard_app/features/notification/services/notification_service.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/utils/either.dart';

final providerOfHome =
    StateNotifierProvider.autoDispose<HomeProvider, HomeProviderState>(
      (ref) => HomeProvider(
        ref: ref,
        state: HomeProviderState(),
      ),
    );

class HomeProvider extends StateNotifier<HomeProviderState> {
  HomeProvider({
    required final Ref ref,
    required final HomeProviderState state,
  }) : _ref = ref,
       super(state) {
    _sendPushNotificationToken();
  }

  final Ref _ref;
  NotificationService get _notificationService =>
      _ref.read(providerOfNotificationService);

  /// Sends the push notification token to the server.
  Future<void> _sendPushNotificationToken() async {
    state = state.copyWith(
      sendPushNotificationTokenState: SendPushNotificationTokenState.loading(),
    );

    final result = await _notificationService.getFCMToken().then(
      (data) => data.when<Future<Either<String, AppError>>>(
        (fcmToken) async {
          final result = await _notificationService.sendPushNotificationToken(
            token: fcmToken,
          );
          return result.when(
            (success) => Success(fcmToken),
            (failure) => Failure(failure),
          );
        },
        (failure) async => Failure(failure),
      ),
    );
    if (!mounted) return;

    result.when(
      (success) {
        state = state.copyWith(
          sendPushNotificationTokenState:
              SendPushNotificationTokenState.success(success),
        );
      },
      (failure) {
        state = state.copyWith(
          sendPushNotificationTokenState: SendPushNotificationTokenState.error(
            failure,
          ),
        );
      },
    );
  }
}
