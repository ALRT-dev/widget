import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hazard_app/features/notification/providers/repository_providers.dart';
import 'package:hazard_app/features/notification/repositories/notification_repository.dart';
import 'package:hazard_app/features/search/models/hazard_search_params.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';
import 'package:hazard_app/features/shared/providers/service_providers.dart';
import 'package:hazard_app/features/shared/services/hazard_service.dart';
import 'package:hazard_app/features/shared/utils/either.dart';

class NotificationService {
  NotificationService(final Ref ref) : _ref = ref;

  final Ref _ref;
  NotificationRepository get _notificationRepository =>
      _ref.read(providerOfNotificationRepository);
  HazardService get _hazardService => _ref.read(providerOfHazardService);

  StreamSubscription<RemoteMessage>? _remoteMessageStreamSub;

  /// Fetches the hazards that the user has subscribed to for notifications.
  Future<Either<List<Hazard>, AppError>> getNotificationsFeed({
    final HazardSearchParams? searchParams,
  }) async {
    final result = await _notificationRepository.getNotificationsFeed(
      searchParams: searchParams,
    );

    final success = await result.whenSuccess(
      _hazardService.populateHazardsWithRequiredData,
    );

    return result.copyWith(
      success: (_) => success,
    );
  }

  /// Gets the fcm token from Firebase Cloud Messaging.
  ///
  /// The [vapidKey] is the public key that is used for Web Push notifications.
  Future<Either<String, AppError>> getFCMToken({
    final String? vapidKey,
  }) {
    return _notificationRepository.getFCMToken(
      vapidKey: vapidKey,
    );
  }

  /// Sends the push notification [token] in the server.
  Future<Either<void, AppError>> sendPushNotificationToken({
    required final String token,
  }) {
    return _notificationRepository.sendPushNotificationToken(
      token: token,
    );
  }

  /// Calls [onMessageReceived] callback when the remote message is received from the push notification.
  Future<void> handlePushNotificationMessage({
    required final Function(RemoteMessage) onMessageReceived,
  }) async {
    final initialMessageResult = await _notificationRepository
        .getInitialPushNotificationMessage();

    initialMessageResult.whenSuccess((remoteMessage) {
      if (remoteMessage != null) {
        onMessageReceived(remoteMessage);
      }
    });

    _remoteMessageStreamSub = _notificationRepository
        .onPushNotificationMessageOpenedApp()
        .listen(onMessageReceived);
  }

  /// Disposes the stream.
  void disposePushNotificationMessageListener() {
    _remoteMessageStreamSub?.cancel();
    _remoteMessageStreamSub = null;
  }
}
