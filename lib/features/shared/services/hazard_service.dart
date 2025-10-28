import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hazard_app/features/search/models/hazard_search_params.dart';
import 'package:hazard_app/features/shared/enums/hazard_vote_types.dart';
import 'package:hazard_app/features/shared/models/alrt_media_model.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';
import 'package:hazard_app/features/shared/models/get_hazards_with_categories_response_model.dart';
import 'package:hazard_app/features/shared/models/view_hazard_response_model.dart';
import 'package:hazard_app/features/shared/providers/repository_providers.dart';
import 'package:hazard_app/features/shared/providers/service_providers.dart';
import 'package:hazard_app/features/shared/repositories/hazard_repository.dart';
import 'package:hazard_app/features/shared/services/media_service.dart';
import 'package:hazard_app/features/shared/utils/either.dart';

class HazardService {
  HazardService(final Ref ref) : _ref = ref;

  final Ref _ref;
  HazardRepository get _hazardRepository =>
      _ref.read(providerOfHazardRepository);
  MediaService get _mediaService => _ref.read(providerOfMediaService);

  /// Fetches the list of hazards from the server.
  Future<Either<List<Hazard>, AppError>> getHazards({
    required final HazardSearchParams searchParams,
  }) async {
    final result = await _hazardRepository.getHazards(
      searchParams: searchParams,
    );

    final success = await result.whenSuccess(
      populateHazardsWithRequiredData,
    );

    return result.copyWith(
      success: (_) => success,
    );
  }

  /// Fetches hazards along with categories from the server.
  Future<Either<GetHazardsWithCategoriesResponse, AppError>>
  getHazardsWithCategories({
    required final HazardSearchParams searchParams,
  }) async {
    final result = await _hazardRepository.getGetHazardsWithCategories(
      searchParams: searchParams,
    );

    final success = await result.whenSuccess((response) async {
      final populatedHazards = await populateHazardsWithRequiredData(
        response.hazards,
      );
      return response.copyWith(
        hazards: populatedHazards,
      );
    });

    return result.copyWith(
      success: (_) => success,
    );
  }

  /// Fetches all hazards along with categories from the server.
  Future<Either<GetHazardsWithCategoriesResponse, AppError>>
  getAllHazardsWithCategories({
    final int numberOfParallelRequests = 10,
    required final HazardSearchParams searchParams,
  }) async {
    // First request to get the initial batch and categories
    final initialResult = await getHazardsWithCategories(
      searchParams: searchParams,
    );

    return initialResult.when(
      (initialResponse) async {
        final allHazards = <Hazard>[...initialResponse.hazards];
        final pageSize = searchParams.pageSize;

        // If the initial response has fewer items than page size, we have all data
        if (initialResponse.hazards.length < pageSize) {
          return Success(initialResponse);
        }

        // Keep fetching until we get all hazards
        int currentPage = searchParams.page + 1;
        bool hasMoreData = true;

        while (hasMoreData) {
          final batchFutures =
              <Future<Either<GetHazardsWithCategoriesResponse, AppError>>>[];

          // Create parallel requests for the next batch of pages
          for (int i = 0; i < numberOfParallelRequests; i++) {
            final pageSearchParams = searchParams.copyWith(
              page: currentPage + i,
            );

            batchFutures.add(
              getHazardsWithCategories(
                searchParams: pageSearchParams,
              ),
            );
          }

          // Wait for this batch to complete
          final batchResults = await Future.wait(batchFutures);

          // Process batch results
          bool hasDataInThisBatch = false;
          for (final result in batchResults) {
            final error = result.when(
              (response) {
                if (response.hazards.isNotEmpty) {
                  allHazards.addAll(response.hazards);
                  hasDataInThisBatch = true;

                  // If this page has fewer items than page size, it's the last page
                  if (response.hazards.length < pageSize) {
                    hasMoreData = false;
                  }
                }
                return null; // Success case
              },
              (error) => error, // Return error
            );

            // If any request fails, return the error
            if (error != null) {
              return Failure(error);
            }
          }

          // If no data was found in any of the parallel requests, we're done
          if (!hasDataInThisBatch) {
            hasMoreData = false;
          }

          // Move to the next batch of pages
          currentPage += numberOfParallelRequests;
        }

        // Return the combined response with all hazards
        return Success(
          initialResponse.copyWith(
            hazards: allHazards,
          ),
        );
      },
      (error) async => Failure(error),
    );
  }

  /// Fetches the list of hazard categories from the server.
  Future<Either<List<HazardCategory>, AppError>> getHazardCategories() {
    return _hazardRepository.getHazardCategories();
  }

  /// Creates a new hazard report on the server.
  Future<Either<Hazard, AppError>> createHazardReport({
    required final Hazard hazard,
    final List<AlrtMedia>? mediaFiles,
  }) async {
    final result = await _hazardRepository.createHazardReport(
      hazard: hazard,
      mediaFiles: mediaFiles,
    );

    final success = await result.whenSuccess(
      populateHazardWithRequiredData,
    );

    return result.copyWith(
      success: (_) => success,
    );
  }

  /// Updates an existing hazard report on the server.
  ///
  /// The [hazard] must have a valid [id] to identify which report to update.
  ///
  /// The [removedMediaIds] is a list of media IDs that should be removed from the hazard report.
  Future<Either<Hazard, AppError>> updateHazardReport({
    required final Hazard hazard,
    final List<AlrtMedia>? mediaFiles,
    final List<String>? removedMediaIds,
  }) async {
    if (hazard.id == null) {
      return Failure(
        AppError(
          message: 'Hazard ID is required for updating a hazard report.',
        ),
      );
    }

    final result = await _hazardRepository.updateHazardReport(
      hazard: hazard,
      mediaFiles: mediaFiles,
      removedMediaIds: removedMediaIds,
    );

    final success = await result.whenSuccess(
      populateHazardWithRequiredData,
    );

    return result.copyWith(
      success: (_) => success,
    );
  }

  /// Deletes a hazard report from the server.
  Future<Either<void, AppError>> deleteHazard({
    required final String hazardId,
  }) {
    return _hazardRepository.deleteHazard(
      hazardId: hazardId,
    );
  }

  /// Votes on a hazard report.
  Future<Either<void, AppError>> voteHazard({
    required final String hazardId,
    required final HazardVoteType voteType,
  }) {
    return _hazardRepository.voteHazard(
      hazardId: hazardId,
      voteType: voteType,
    );
  }

  /// Views a hazard report.
  Future<Either<ViewHazardResponse, AppError>> viewHazard({
    required final String hazardId,
  }) {
    return _hazardRepository.viewHazard(
      hazardId: hazardId,
    );
  }

  /// Populates a hazard with any required data before processing.
  Future<Hazard> populateHazardWithRequiredData(final Hazard hazard) async {
    return hazard.copyWith(
      processedMedias: await _mediaService.convertS3MediaToAlrtMedia(
        s3Medias: hazard.medias,
      ),
    );
  }

  /// Populates a list of hazards with any required data before processing.
  Future<List<Hazard>> populateHazardsWithRequiredData(
    final List<Hazard> hazards,
  ) async {
    final futures = hazards.map(populateHazardWithRequiredData).toList();
    return Future.wait(futures);
  }
}
