import 'package:hazard_app/api/rest_client.dart';
import 'package:hazard_app/features/search/models/hazard_search_params.dart';
import 'package:hazard_app/features/shared/enums/hazard_vote_types.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';
import 'package:hazard_app/features/shared/models/get_hazards_with_categories_response_model.dart';
import 'package:hazard_app/features/shared/models/view_hazard_response_model.dart';
import 'package:hazard_app/features/shared/utils/async_call_helper.dart';
import 'package:hazard_app/features/shared/utils/dummy_data.dart';
import 'package:hazard_app/features/shared/utils/either.dart';

abstract class HazardRepository {
  Future<Either<List<Hazard>, AppError>> getHazards({
    required final HazardSearchParams searchParams,
  });

  Future<Either<Hazard, AppError>> createHazardReport({
    required final Hazard hazard,
  });

  Future<Either<GetHazardsWithCategoriesResponse, AppError>>
  getGetHazardsWithCategories({
    required final HazardSearchParams searchParams,
  });

  Future<Either<List<HazardCategory>, AppError>> getHazardCategories();

  Future<Either<void, AppError>> voteHazard({
    required final String hazardId,
    required final HazardVoteType voteType,
  });

  Future<Either<ViewHazardResponse, AppError>> viewHazard({
    required final String hazardId,
  });
}

class HazardRepositoryImpl extends HazardRepository {
  HazardRepositoryImpl({
    required final RestClient restClient,
  }) : _restClient = restClient;

  final RestClient _restClient;

  @override
  Future<Either<List<Hazard>, AppError>> getHazards({
    required final HazardSearchParams searchParams,
  }) {
    return runAsyncCall(
      name: 'getHazards',
      future: () async {
        final result = await _restClient.getHazards(
          searchParams: searchParams,
        );
        return Success(result);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<GetHazardsWithCategoriesResponse, AppError>>
  getGetHazardsWithCategories({
    required HazardSearchParams searchParams,
  }) {
    return runAsyncCall(
      name: 'getGetHazardsWithCategories',
      future: () async {
        final result = await _restClient.getGetHazardsWithCategories(
          searchParams: searchParams,
        );
        return Success(result);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<List<HazardCategory>, AppError>> getHazardCategories() {
    return runAsyncCall(
      name: 'getHazardCategories',
      future: () async {
        final result = await _restClient.getHazardCategories();
        return Success(result);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<Hazard, AppError>> createHazardReport({
    required Hazard hazard,
  }) {
    return runAsyncCall(
      name: 'createHazardReport',
      future: () async {
        final result = await _restClient.createHazardReport(hazard: hazard);
        return Success(result);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<void, AppError>> voteHazard({
    required String hazardId,
    required HazardVoteType voteType,
  }) {
    return runAsyncCall(
      name: 'voteHazard',
      future: () async {
        await _restClient.voteHazard(
          hazardId: hazardId,
          voteType: voteType.name,
        );
        return Success(null);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<ViewHazardResponse, AppError>> viewHazard({
    required String hazardId,
  }) {
    return runAsyncCall(
      name: 'viewHazard',
      future: () async {
        final result = await _restClient.viewHazard(
          hazardId: hazardId,
        );
        return Success(result);
      },
      onError: Failure.new,
    );
  }
}

class MockHazardRepositoryImpl extends HazardRepositoryImpl {
  MockHazardRepositoryImpl({required super.restClient});

  @override
  Future<Either<List<Hazard>, AppError>> getHazards({
    required HazardSearchParams searchParams,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return Success(kDummyHazards as List<Hazard>);
  }
}
