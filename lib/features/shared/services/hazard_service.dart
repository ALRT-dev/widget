import 'package:dio/dio.dart';
import 'package:flutter/material.dart' show ImageConfiguration, Size;
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hazard_app/features/search/models/hazard_search_params.dart';
import 'package:hazard_app/features/shared/enums/fire_status_types.dart';
import 'package:hazard_app/features/shared/enums/hazard_severity_band_types.dart';
import 'package:hazard_app/features/shared/enums/hazard_vote_types.dart';
import 'package:hazard_app/features/shared/models/alrt_media_model.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';
import 'package:hazard_app/features/shared/models/get_hazards_with_subscription_id_reponse.dart';
import 'package:hazard_app/features/shared/models/view_hazard_response_model.dart';
import 'package:hazard_app/features/shared/providers/repository_providers.dart';
import 'package:hazard_app/features/shared/providers/service_providers.dart';
import 'package:hazard_app/features/shared/repositories/hazard_repository.dart';
import 'package:hazard_app/features/shared/services/media_service.dart';
import 'package:hazard_app/features/shared/utils/either.dart';
import 'package:hazard_app/features/shared/utils/hazard_util.dart';

class HazardService {
  HazardService(final Ref ref) : _ref = ref;

  final Ref _ref;
  HazardRepository get _hazardRepository =>
      _ref.read(providerOfHazardRepository);
  MediaService get _mediaService => _ref.read(providerOfMediaService);

  /// Fetches the list of hazards from the server.
  Future<Either<List<Hazard>, AppError>> getHazards({
    required final HazardSearchParams searchParams,
    final CancelToken? cancelToken,
  }) async {
    final result = await _hazardRepository.getHazards(
      searchParams: searchParams,
      cancelToken: cancelToken,
    );

    final success = await result.whenSuccess(
      populateHazardsWithRequiredData,
    );

    return result.copyWith(
      success: (_) => success,
    );
  }

  /// Fetches all hazards from the server by making multiple parallel requests.
  Future<Either<List<Hazard>, AppError>> getAllHazards({
    final int numberOfParallelRequests = 10,
    required final HazardSearchParams searchParams,
    final bool allowEmptyCategoryIds = false,
    final bool allowAllSourceFiltersFalse = false,
    final CancelToken? cancelToken,
  }) async {
    // If no category IDs are provided, return an empty list immediately.
    if (searchParams.categoryIds.isEmpty && !allowEmptyCategoryIds) {
      return Success(<Hazard>[]);
    }

    // If all hazard source filters are false, return an empty list immediately.
    if (!searchParams.awsEmergency &&
        !searchParams.awsWatchAndAct &&
        !searchParams.awsAdvice &&
        !searchParams.officialNonAws &&
        !searchParams.userReported &&
        !allowAllSourceFiltersFalse) {
      return Success(<Hazard>[]);
    }

    final allHazards = <Hazard>[];
    final pageSize = searchParams.pageSize;
    int currentPage = searchParams.page;
    bool hasMoreData = true;

    while (hasMoreData) {
      final batchFutures = <Future<Either<List<Hazard>, AppError>>>[];

      // Create parallel requests for the current batch of pages
      for (int i = 0; i < numberOfParallelRequests; i++) {
        final pageSearchParams = searchParams.copyWith(
          page: currentPage + i,
        );

        batchFutures.add(
          getHazards(
            searchParams: pageSearchParams,
            cancelToken: cancelToken,
          ),
        );
      }

      // Wait for this batch to complete
      final batchResults = await Future.wait(batchFutures);

      // Process batch results
      bool hasDataInThisBatch = false;
      for (final result in batchResults) {
        final error = result.when(
          (hazards) {
            if (hazards.isNotEmpty) {
              allHazards.addAll(hazards);
              hasDataInThisBatch = true;

              // If this page has fewer items than page size, it's the last page
              if (hazards.length < pageSize) {
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

    // Return the combined list of all hazards
    return Success(
      HazardUtil.sortHazards(
        allHazards,
        searchParams.sortSettings,
      ),
    );
  }

  /// Fetches hazards along with subscription ID from the server.
  Future<Either<GetHazardsWithSubscriptionIdResponse, AppError>>
  getHazardsWithSubscriptionId({
    required final HazardSearchParams searchParams,
  }) async {
    final result = await _hazardRepository.getGetHazardsWithSubscriptionId(
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

  /// Fetches the list of hazard categories from the server including parent and sub-categories.
  Future<Either<List<HazardCategory>, AppError>> getAllHazardCategories() {
    return _hazardRepository.getAllHazardCategories();
  }

  /// Fetches the list of parent hazard categories from the server.
  Future<Either<List<HazardCategory>, AppError>>
  getAllParentHazardCategories() {
    return _hazardRepository.getAllParentHazardCategories();
  }

  /// Fetches the list of sub hazard categories from the server.
  Future<Either<List<HazardCategory>, AppError>> getAllSubHazardCategories() {
    return _hazardRepository.getAllSubHazardCategories();
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

  /// Generates marker bitmaps for all hazard categories and severities.
  Future<Either<Map<String, BitmapDescriptor>, AppError>>
  generateHazardMarkerBitmaps() async {
    final categoriesResult = await getAllSubHazardCategories();
    final categories = categoriesResult.whenSuccess((cats) => cats) ?? [];
    final severityBands = HazardSeverityBand.values;

    // Ensure the "other" category is included
    categories.add(HazardCategory(id: 'other'));

    final futures = <Future<Map<String, BitmapDescriptor>>>[];

    final parentCategories = categories
        .map((cat) => cat.parentId)
        .where((parentId) => parentId != null)
        .cast<String>()
        .toList();

    // Generate bitmaps for each category and severity combination
    for (final category in categories) {
      for (final severityBand in severityBands) {
        // Generate bitmaps for AWS compliant hazards
        final keyAws = '${category.id}_${severityBand.name}_aws';
        final futureAws = getBitmapDescriptorForHazard(
          categoryId: category.id,
          parentCategoryId: category.parentId,
          severityBand: severityBand,
          isAwsCompliant: true,
        ).then((bitmap) => {keyAws: bitmap});
        futures.add(futureAws);

        // Generate bitmaps for non-AWS compliant hazards
        final keyNonAws = '${category.id}_${severityBand.name}_non_aws';
        final futureNonAws = getBitmapDescriptorForHazard(
          categoryId: category.id,
          parentCategoryId: category.parentId,
          severityBand: severityBand,
          isAwsCompliant: false,
          size: category.id == 'powerOutage'
              ? const Size(32, 32)
              : const Size(40, 40),
        ).then((bitmap) => {keyNonAws: bitmap});
        futures.add(futureNonAws);
      }

      // Generate bitmaps for user reported hazards
      late String key;
      if (category.parentId != null) {
        key = '${category.parentId}_user';
      } else {
        key = '${category.id}_user';
      }
      final future = getBitmapDescriptorForAssetPath(
        assetPath: 'assets/images/hazards/non_aws/$key.png',
        fallbackAssetPath: 'assets/images/hazards/non_aws/other_user.png',
        size: const Size(40, 40),
      ).then((bitmap) => {key: bitmap});
      futures.add(future);
    }

    // Generate bitmaps for parent categories
    for (final parentCategoryId in parentCategories) {
      for (final severity in severityBands) {
        // Generate bitmaps for AWS compliant hazards for parent categories
        final keyAws = '${parentCategoryId}_${severity.name}_aws';
        final futureAws = getBitmapDescriptorForHazard(
          categoryId: parentCategoryId,
          parentCategoryId: null,
          severityBand: severity,
          isAwsCompliant: true,
        ).then((bitmap) => {keyAws: bitmap});
        futures.add(futureAws);

        // Generate bitmaps for non-AWS compliant hazards for parent categories
        final keyNonAws = '${parentCategoryId}_${severity.name}_non_aws';
        final futureNonAws = getBitmapDescriptorForHazard(
          categoryId: parentCategoryId,
          parentCategoryId: null,
          severityBand: severity,
          isAwsCompliant: false,
        ).then((bitmap) => {keyNonAws: bitmap});
        futures.add(futureNonAws);
      }
    }

    // Generate bitmaps for bushfire markers
    for (final fireStatus in FireStatus.values) {
      final key = 'fireStatus_${fireStatus.name}';
      final future = getBitmapDescriptorForAssetPath(
        assetPath: 'assets/images/hazards/non_aws/$key.png',
        fallbackAssetPath:
            'assets/images/hazards/non_aws/fireStatus_underControl.png',
      ).then((bitmap) => {key: bitmap});
      futures.add(future);
    }

    final markerBitmaps = await Future.wait(futures);
    return Success(
      markerBitmaps.fold<Map<String, BitmapDescriptor>>(
        {},
        (acc, map) {
          acc.addAll(map);
          return acc;
        },
      ),
    );
  }

  /// Gets a BitmapDescriptor for the given hazard category and severity.
  Future<BitmapDescriptor> getBitmapDescriptorForHazard({
    required final String categoryId,
    required final String? parentCategoryId,
    required final HazardSeverityBand severityBand,
    final bool isAwsCompliant = false,
    final Size size = const Size(40, 40),
  }) async {
    try {
      // Check for child category asset
      final key = '${categoryId}_${severityBand.name}';
      final assetPath =
          'assets/images/hazards/${isAwsCompliant ? 'aws/' : 'non_aws/'}$key.png';

      var exists = await assetExists(assetPath: assetPath);
      if (exists) {
        return BitmapDescriptor.asset(
          ImageConfiguration(size: size),
          assetPath,
        );
      }

      // If child category asset doesn't exist, check for parent category asset
      if (parentCategoryId != null) {
        final parentKey = '${parentCategoryId}_${severityBand.name}';
        final parentAssetPath =
            'assets/images/hazards/${isAwsCompliant ? 'aws/' : 'non_aws/'}$parentKey.png';
        exists = await assetExists(assetPath: parentAssetPath);
        if (exists) {
          return BitmapDescriptor.asset(
            ImageConfiguration(size: size),
            parentAssetPath,
          );
        }
      }

      // If neither exists, use the generic "other" asset for the severity
      exists = await assetExists(
        assetPath:
            'assets/images/hazards/${isAwsCompliant ? 'aws/' : 'non_aws/'}other_${severityBand.name}.png',
      );
      if (exists) {
        return BitmapDescriptor.asset(
          ImageConfiguration(size: size),
          'assets/images/hazards/${isAwsCompliant ? 'aws/' : 'non_aws/'}other_${severityBand.name}.png',
        );
      }

      return BitmapDescriptor.defaultMarker;
    } catch (e) {
      return BitmapDescriptor.defaultMarker;
    }
  }

  /// Gets a BitmapDescriptor for the given asset path, with a fallback option.
  Future<BitmapDescriptor> getBitmapDescriptorForAssetPath({
    required final String assetPath,
    final Size size = const Size(40, 40),
    final String fallbackAssetPath =
        'assets/images/hazards/non_aws/other_unknown.png',
  }) async {
    try {
      var exists = await assetExists(assetPath: assetPath);
      if (exists) {
        return BitmapDescriptor.asset(
          ImageConfiguration(size: size),
          assetPath,
        );
      }

      exists = await assetExists(assetPath: fallbackAssetPath);
      if (exists) {
        return BitmapDescriptor.asset(
          ImageConfiguration(size: size),
          fallbackAssetPath,
        );
      }

      return BitmapDescriptor.defaultMarker;
    } catch (e) {
      return BitmapDescriptor.defaultMarker;
    }
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

  /// Checks if an asset exists at the given path.
  Future<bool> assetExists({required final String assetPath}) async {
    try {
      await rootBundle.load(assetPath);
      return true;
    } catch (e) {
      return false;
    }
  }
}
