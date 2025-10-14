import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hazard_app/features/shared/enums/hazard_review_status_types.dart';

part 'hazard_search_params.freezed.dart';
part 'hazard_search_params.g.dart';

@freezed
abstract class HazardSearchParams with _$HazardSearchParams {
  const factory HazardSearchParams({
    /// The search string to filter hazards by their title or description.
    final String? searchString,

    /// The list of category IDs to filter hazards.
    @Default(<String>[]) final List<String> categoryIds,

    /// The id of the user who reported the hazard to filter hazards.
    final String? reportedById,

    /// The review status to filter hazards.
    ///
    /// Defaults to [HazardReviewStatus.accepted] to show only accepted hazards.
    @Default(HazardReviewStatus.accepted) final HazardReviewStatus reviewStatus,

    /// The bounds for location-based filtering.
    final double? northeastLat,

    /// The bounds for location-based filtering.
    final double? northeastLng,

    /// The bounds for location-based filtering.
    final double? southwestLat,

    /// The bounds for location-based filtering.
    final double? southwestLng,

    /// The page number for pagination.
    @Default(1) final int page,

    /// The number of items per page for pagination.
    @Default(20) final int pageSize,
  }) = _HazardSearchParams;

  factory HazardSearchParams.fromJson(Map<String, dynamic> json) =>
      _$HazardSearchParamsFromJson(json);
}
