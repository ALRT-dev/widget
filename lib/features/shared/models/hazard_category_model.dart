import 'package:freezed_annotation/freezed_annotation.dart';

part 'hazard_category_model.freezed.dart';
part 'hazard_category_model.g.dart';

@freezed
abstract class HazardCategory with _$HazardCategory {
  const factory HazardCategory({
    required String id,
    required String name,
  }) = _HazardCategory;

  factory HazardCategory.fromJson(Map<String, dynamic> json) =>
      _$HazardCategoryFromJson(json);
}
