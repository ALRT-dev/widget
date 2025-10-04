import 'package:freezed_annotation/freezed_annotation.dart';

part 'hazard_category_model.freezed.dart';
part 'hazard_category_model.g.dart';

@freezed
abstract class HazardCategory with _$HazardCategory {
  const factory HazardCategory({
    required final String id,
    final String? name,
    final String? emoji,
  }) = _HazardCategory;

  factory HazardCategory.fromJson(Map<String, dynamic> json) =>
      _$HazardCategoryFromJson(json);
}
