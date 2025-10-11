import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hazard_app/features/notification/repositories/notification_repository.dart';
import 'package:hazard_app/features/shared/providers/rest_client_provider.dart';

final providerOfNotificationRepository = Provider<NotificationRepository>(
  (ref) => NotificationRepositoryImpl(
    restClient: ref.read(providerOfRestClient),
  ),
);
