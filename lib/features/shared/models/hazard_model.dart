import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hazard_app/features/shared/enums/hazard_severity_types.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';

part 'hazard_model.freezed.dart';
part 'hazard_model.g.dart';

@freezed
abstract class Hazard with _$Hazard {
  const factory Hazard({
    final String? id,
    final String? title,
    final String? shortDescription,
    final String? description,
    final HazardSeverity? severity,
    final String? source,
    final double? latitude,
    final double? longitude,
    final String? categoryId,
    final HazardCategory? category,
    final DateTime? occuredAt,
    final DateTime? createdAt,
    final DateTime? updatedAt,
    final DateTime? expiresAt,
  }) = _Hazard;

  factory Hazard.fromJson(Map<String, dynamic> json) => _$HazardFromJson(json);
}
