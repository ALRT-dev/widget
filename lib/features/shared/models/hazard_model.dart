import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hazard_app/features/shared/enums/ai_confidence_types.dart';
import 'package:hazard_app/features/shared/enums/hazard_severity_types.dart';
import 'package:hazard_app/features/shared/models/app_user_model.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';

part 'hazard_model.freezed.dart';
part 'hazard_model.g.dart';

@freezed
abstract class Hazard with _$Hazard {
  const factory Hazard({
    /// The id of the hazard.
    final String? id,

    /// The title of the hazard.
    final String? title,

    /// The detailed description of the hazard.
    final String? description,

    /// The short description of the hazard.
    final String? shortDescription,

    /// Whether the hazard is visible to others.
    @Default(true) final bool visibility,

    /// The severity level of the hazard as per user input or source.
    final HazardSeverity? severity,

    /// The source of the hazard report (e.g., user, system).
    final String? source,

    /// The latitude of the hazard location.
    final double? latitude,

    /// The longitude of the hazard location.
    final double? longitude,

    /// The id of the category the hazard belongs to.
    final String? categoryId,

    /// The category the hazard belongs to.
    final HazardCategory? category,

    /// The AI-generated summary of the hazard.
    final String? aiSummary,

    /// The AI-generated feedback on the hazard.
    final String? aiFeedback,

    /// The AI-determined severity of the hazard.
    final HazardSeverity? aiSeverity,

    /// The AI-determined confidence level of the hazard.
    final AIConfidence? aiConfidence,

    /// The user who reported the hazard.
    final AppUser? reportedBy,

    /// The date and time when the hazard occurred.
    final DateTime? occuredAt,

    /// The date and time when the hazard was reported.
    final DateTime? createdAt,

    /// The date and time when the hazard was last updated.
    final DateTime? updatedAt,

    /// The date and time when the hazard expires.
    final DateTime? expiresAt,
  }) = _Hazard;

  factory Hazard.fromJson(Map<String, dynamic> json) => _$HazardFromJson(json);
}
