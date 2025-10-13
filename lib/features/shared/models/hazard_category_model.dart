import 'package:freezed_annotation/freezed_annotation.dart';

part 'hazard_category_model.freezed.dart';
part 'hazard_category_model.g.dart';

@freezed
abstract class HazardCategory with _$HazardCategory {
  const factory HazardCategory({
    /// The unique identifier for the hazard category.
    required final String id,

    /// The name of the hazard category.
    final String? name,

    /// The emoji representing the hazard category.
    final String? emoji,

    /// The number of hazards associated with this category.
    @Default(0) final int hazardsCount,
  }) = _HazardCategory;

  factory HazardCategory.fromJson(Map<String, dynamic> json) =>
      _$HazardCategoryFromJson(json);
}
