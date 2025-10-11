import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hazard_app/features/notification/providers/repository_providers.dart';
import 'package:hazard_app/features/notification/repositories/notification_repository.dart';
import 'package:hazard_app/features/search/models/hazard_search_params.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/models/get_hazards_with_categories_response_model.dart';
import 'package:hazard_app/features/shared/utils/either.dart';

class NotificationService {
  NotificationService(final Ref ref) : _ref = ref;

  final Ref _ref;
  NotificationRepository get _notificationRepository =>
      _ref.read(providerOfNotificationRepository);

  /// Fetches the hazards that the user has subscribed to for notifications.
  Future<Either<GetHazardsWithCategoriesResponse, AppError>>
  getNotificationsFeed({
    final HazardSearchParams? searchParams,
  }) {
    return _notificationRepository.getNotificationsFeed(
      searchParams: searchParams,
    );
  }
}
