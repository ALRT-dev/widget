import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hazard_app/features/map/models/alrt_location_model.dart';
import 'package:hazard_app/features/shared/enums/hazard_severity_types.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';

part 'hazard_model.freezed.dart';
part 'hazard_model.g.dart';

@freezed
abstract class Hazard with _$Hazard {
  const factory Hazard({
    required final String id,
    final String? title,
    final String? shortDescription,
    final HazardSeverity? severity,
    final String? source,
    final AlrtLocation? location,
    final HazardCategory? category,
    final DateTime? createdAt,
    final DateTime? updatedAt,
    final DateTime? expiresAt,
  }) = _Hazard;

  factory Hazard.fromJson(Map<String, dynamic> json) => _$HazardFromJson(json);
}
