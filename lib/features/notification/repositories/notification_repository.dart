import 'package:hazard_app/api/rest_client.dart';
import 'package:hazard_app/features/search/models/hazard_search_params.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/models/get_hazards_with_categories_response_model.dart';
import 'package:hazard_app/features/shared/utils/async_call_helper.dart';
import 'package:hazard_app/features/shared/utils/either.dart';

abstract class NotificationRepository {
  Future<Either<GetHazardsWithCategoriesResponse, AppError>>
  getNotificationsFeed({final HazardSearchParams? searchParams});
}

class NotificationRepositoryImpl implements NotificationRepository {
  NotificationRepositoryImpl({
    required final RestClient restClient,
  }) : _restClient = restClient;

  final RestClient _restClient;

  @override
  Future<Either<GetHazardsWithCategoriesResponse, AppError>>
  getNotificationsFeed({
    final HazardSearchParams? searchParams,
  }) async {
    return runAsyncCall(
      name: 'getNotificationsFeed',
      future: () async {
        final result = await _restClient.getNotificationsFeed(
          searchParams: searchParams,
        );
        return Success(result);
      },
      onError: Failure.new,
    );
  }
}
