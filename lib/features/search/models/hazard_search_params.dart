import 'package:freezed_annotation/freezed_annotation.dart';

part 'hazard_search_params.freezed.dart';
part 'hazard_search_params.g.dart';

@freezed
abstract class HazardSearchParams with _$HazardSearchParams {
  const factory HazardSearchParams({
    /// The search string to filter hazards by their title or description.
    final String? searchString,

    /// The list of category IDs to filter hazards.
    @Default(<String>[]) final List<String> categoryIds,

    /// The latitude for location-based filtering.
    @JsonKey(name: 'lat') final double? latitude,

    /// The longitude for location-based filtering.
    @JsonKey(name: 'lng') final double? longitude,

    /// The bounds for location-based filtering.
    ///
    /// If provided, [latitude] and [longitude] will be ignored.
    final double? northeastLat,

    /// The bounds for location-based filtering.
    ///
    /// If provided, [latitude] and [longitude] will be ignored.
    final double? northeastLng,

    /// The bounds for location-based filtering.
    ///
    /// If provided, [latitude] and [longitude] will be ignored.
    final double? southwestLat,

    /// The bounds for location-based filtering.
    ///
    /// If provided, [latitude] and [longitude] will be ignored.
    final double? southwestLng,

    /// The page number for pagination.
    @Default(1) final int page,

    /// The number of items per page for pagination.
    @Default(20) final int pageSize,
  }) = _HazardSearchParams;

  factory HazardSearchParams.fromJson(Map<String, dynamic> json) =>
      _$HazardSearchParamsFromJson(json);
}
