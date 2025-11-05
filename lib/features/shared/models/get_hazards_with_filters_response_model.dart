import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';
import 'package:hazard_app/features/shared/models/get_available_filters_response.dart';

part 'get_hazards_with_filters_response_model.freezed.dart';
part 'get_hazards_with_filters_response_model.g.dart';

@freezed
abstract class GetHazardsWithFiltersResponse
    with _$GetHazardsWithFiltersResponse {
  const factory GetHazardsWithFiltersResponse({
    /// The list of hazards.
    @Default(<Hazard>[]) final List<Hazard> hazards,

    /// The subscription ID associated with the hazards retrieval.
    final String? subscriptionId,

    /// The available filters including categories and severities.
    @Default(GetAvailableFiltersResponse())
    final GetAvailableFiltersResponse availableFilters,
  }) = _GetHazardsWithFiltersResponse;

  factory GetHazardsWithFiltersResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$GetHazardsWithFiltersResponseFromJson(json);
}
