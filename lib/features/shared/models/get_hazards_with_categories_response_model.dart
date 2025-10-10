import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';

part 'get_hazards_with_categories_response_model.freezed.dart';
part 'get_hazards_with_categories_response_model.g.dart';

@freezed
abstract class GetHazardsWithCategoriesResponse
    with _$GetHazardsWithCategoriesResponse {
  const factory GetHazardsWithCategoriesResponse({
    required List<Hazard> hazards,
    required List<HazardCategory> categories,
    final String? subscriptionId,
  }) = _GetHazardsWithCategoriesResponse;

  factory GetHazardsWithCategoriesResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$GetHazardsWithCategoriesResponseFromJson(json);
}
