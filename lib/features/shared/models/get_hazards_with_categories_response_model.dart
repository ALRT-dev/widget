import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';
import 'package:hazard_app/features/shared/models/hazard_severity_with_count_model.dart';

part 'get_hazards_with_categories_response_model.freezed.dart';
part 'get_hazards_with_categories_response_model.g.dart';

@freezed
abstract class GetHazardsWithCategoriesResponse
    with _$GetHazardsWithCategoriesResponse {
  const factory GetHazardsWithCategoriesResponse({
    /// The list of hazards.
    @Default(<Hazard>[]) final List<Hazard> hazards,

    /// The list of hazard categories that can be used as filters.
    @Default(<HazardCategory>[]) final List<HazardCategory> categoryFilters,

    /// The list of hazard severities that can be used as filters.
    @Default(<HazardSeverityWithCount>[])
    final List<HazardSeverityWithCount> severityFilters,

    /// The subscription ID associated with the hazards retrieval.
    final String? subscriptionId,
  }) = _GetHazardsWithCategoriesResponse;

  factory GetHazardsWithCategoriesResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$GetHazardsWithCategoriesResponseFromJson(json);
}
