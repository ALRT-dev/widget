import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'hazard_category_model.freezed.dart';
part 'hazard_category_model.g.dart';

@freezed
abstract class HazardCategory with _$HazardCategory {
  const HazardCategory._();

  const factory HazardCategory({
    /// The unique identifier for the hazard category.
    required final String id,

    /// The name of the hazard category.
    final String? name,

    /// The description of the hazard category.
    final String? description,

    /// The color associated with the hazard category.
    @ColorConverter() final Color? color,

    /// The ID of the parent category, if any.
    final String? parentId,

    /// The parent category of this hazard category, if any.
    final HazardCategory? parent,

    /// The number of hazards associated with this category.
    @Default(0) final int hazardsCount,
  }) = _HazardCategory;

  /// Checks if the hazard category is bushfire.
  bool get isBushfire => id == 'bushfire';

  /// Gets the effective color of the hazard category, falling back to the parent's color if not set.
  Color? get effectiveColor => color ?? parent?.color;

  factory HazardCategory.fromJson(Map<String, dynamic> json) =>
      _$HazardCategoryFromJson(json);
}

class ColorConverter implements JsonConverter<Color?, String?> {
  const ColorConverter();

  @override
  Color? fromJson(String? json) {
    if (json == null) return null;
    final hexColor = json.replaceFirst('#', '');
    if (hexColor.length == 6) {
      return Color(int.parse('FF$hexColor', radix: 16));
    } else if (hexColor.length == 8) {
      return Color(int.parse(hexColor, radix: 16));
    }
    return null;
  }

  @override
  String? toJson(Color? object) {
    if (object == null) return null;
    // ignore: deprecated_member_use
    return '#${object.value.toRadixString(16).substring(2).toUpperCase()}';
  }
}
