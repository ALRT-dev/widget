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

    /// The page number for pagination.
    @Default(1) final int page,

    /// The number of items per page for pagination.
    @Default(20) final int pageSize,
  }) = _HazardSearchParams;

  factory HazardSearchParams.fromJson(Map<String, dynamic> json) =>
      _$HazardSearchParamsFromJson(json);
}
