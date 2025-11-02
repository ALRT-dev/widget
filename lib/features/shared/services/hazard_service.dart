import 'package:flutter/material.dart' show ImageConfiguration, Size;
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hazard_app/features/search/models/hazard_search_params.dart';
import 'package:hazard_app/features/shared/enums/hazard_severity_types.dart';
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

  /// Fetches all hazards from the server by making multiple parallel requests.
  Future<Either<List<Hazard>, AppError>> getAllHazards({
    final int numberOfParallelRequests = 10,
    required final HazardSearchParams searchParams,
  }) async {
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
    return Success(allHazards);
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
    final allHazards = <Hazard>[];
    final pageSize = searchParams.pageSize;
    int currentPage = searchParams.page;
    bool hasMoreData = true;
    GetHazardsWithCategoriesResponse? firstResponse;

    while (hasMoreData) {
      final batchFutures =
          <Future<Either<GetHazardsWithCategoriesResponse, AppError>>>[];

      // Create parallel requests for the current batch of pages
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
            // Store the first response to preserve categories and metadata
            firstResponse ??= response;

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
      (firstResponse ?? const GetHazardsWithCategoriesResponse()).copyWith(
        hazards: allHazards,
      ),
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

  /// Generates marker bitmaps for all hazard categories and severities.
  Future<Either<Map<String, BitmapDescriptor>, AppError>>
  generateHazardMarkerBitmaps() async {
    final categoriesResult = await getHazardCategories();
    final categories = categoriesResult.whenSuccess((cats) => cats) ?? [];
    final severities = HazardSeverity.values;

    final futures = <Future<Map<String, BitmapDescriptor>>>[];

    // Generate bitmaps for each category and severity combination
    for (final category in categories) {
      for (final severity in severities) {
        final keyAws = '${category.id}_${severity.name}_aws';
        final futureAws = getBitmapDescriptorForHazard(
          categoryId: category.id,
          severity: severity,
          isAwsCompliant: true,
        ).then((bitmap) => {keyAws: bitmap});
        futures.add(futureAws);

        final keyNonAws = '${category.id}_${severity.name}';
        final futureNonAws = getBitmapDescriptorForHazard(
          categoryId: category.id,
          severity: severity,
          isAwsCompliant: false,
        ).then((bitmap) => {keyNonAws: bitmap});
        futures.add(futureNonAws);
      }
    }

    // Generate bitmaps for miscellaneous markers
    final miscellaneousMarkerKeys = [
      'bushfire_notApplicable',
      'bushfire_plannedBurn',
      'bushfire_responding',
    ];
    for (final key in miscellaneousMarkerKeys) {
      final future = getBitmapDescriptorForAssetPath(
        assetPath: 'assets/images/hazards/$key.png',
        fallbackAssetPath: 'assets/images/hazards/bushfire_advice.png',
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
    required final HazardSeverity severity,
    final bool isAwsCompliant = false,
    final Size size = const Size(40, 40),
  }) async {
    try {
      final key =
          '${categoryId}_${severity.name}${isAwsCompliant ? '_aws' : ''}';
      final assetPath = 'assets/images/hazards/$key.png';

      var exists = await assetExists(assetPath: assetPath);
      if (exists) {
        return BitmapDescriptor.asset(
          ImageConfiguration(size: size),
          assetPath,
        );
      }

      // If AWS compliant asset not found, try non-AWS version for AWS requests
      if (isAwsCompliant) {
        final keyNonAws = '${categoryId}_${severity.name}';
        final assetPathNonAws = 'assets/images/hazards/$keyNonAws.png';
        exists = await assetExists(assetPath: assetPathNonAws);
        if (exists) {
          return BitmapDescriptor.asset(
            ImageConfiguration(size: size),
            assetPathNonAws,
          );
        }
      }

      exists = await assetExists(
        assetPath:
            'assets/images/hazards/other_${severity.name}${isAwsCompliant ? '_aws' : ''}.png',
      );
      if (exists) {
        return BitmapDescriptor.asset(
          ImageConfiguration(size: size),
          'assets/images/hazards/other_${severity.name}${isAwsCompliant ? '_aws' : ''}.png',
        );
      }

      exists = await assetExists(
        assetPath: 'assets/images/hazards/other_info.png',
      );
      if (exists) {
        return BitmapDescriptor.asset(
          ImageConfiguration(size: size),
          'assets/images/hazards/other_info.png',
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
    final String fallbackAssetPath = 'assets/images/hazards/other_info.png',
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

      exists = await assetExists(
        assetPath: 'assets/images/hazards/other_info.png',
      );
      if (exists) {
        return BitmapDescriptor.asset(
          ImageConfiguration(size: size),
          'assets/images/hazards/other_info.png',
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
      callToAction:
          hazard.callToAction ??
          getFallbackCallToAction(hazard.severity ?? HazardSeverity.unknown),
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

  /// Gets a fallback call to action message based on hazard severity.
  String getFallbackCallToAction(final HazardSeverity severity) {
    return switch (severity) {
      HazardSeverity.info => 'Stay informed and follow any official guidance.',
      HazardSeverity.low => 'Be cautious and stay aware of your surroundings.',
      HazardSeverity.advice => 'Take necessary precautions and stay safe.',
      HazardSeverity.watchAndAct =>
        'Be prepared to take action if the situation escalates.',
      HazardSeverity.emergency =>
        'Follow emergency procedures and seek safety immediately.',
      HazardSeverity.unknown =>
        'Stay alert and follow local safety guidelines.',
    };
  }
}
