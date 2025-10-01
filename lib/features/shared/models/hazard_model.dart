import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hazard_app/features/map/models/alrt_location_model.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';

part 'hazard_model.freezed.dart';
part 'hazard_model.g.dart';

@freezed
abstract class Hazard with _$Hazard {
  const factory Hazard({
    required final String id,
    final String? title,
    final String? description,
    final AlrtLocation? location,
    final HazardCategory? category,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _Hazard;

  factory Hazard.fromJson(Map<String, dynamic> json) => _$HazardFromJson(json);
}
