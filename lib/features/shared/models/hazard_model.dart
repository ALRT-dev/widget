import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hazard_app/features/shared/converters/date_time_converter.dart';
import 'package:hazard_app/features/shared/enums/ai_confidence_types.dart';
import 'package:hazard_app/features/shared/enums/bushfire_alert_level_types.dart';
import 'package:hazard_app/features/shared/enums/hazard_review_status_types.dart';
import 'package:hazard_app/features/shared/enums/hazard_severity_types.dart';
import 'package:hazard_app/features/shared/enums/hazard_vote_types.dart';
import 'package:hazard_app/features/shared/models/alrt_media_model.dart';
import 'package:hazard_app/features/shared/models/app_user_model.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';
import 'package:hazard_app/features/shared/models/hazard_source_model.dart';
import 'package:hazard_app/features/shared/models/s3_media_model.dart';

part 'hazard_model.freezed.dart';
part 'hazard_model.g.dart';

@freezed
abstract class Hazard with _$Hazard {
  const Hazard._();

  const factory Hazard({
    /// The id of the hazard.
    final String? id,

    /// The title of the hazard.
    final String? title,

    /// The detailed description of the hazard.
    final String? description,

    /// The short description of the hazard.
    final String? shortDescription,

    /// The severity level of the hazard as per user input or source.
    final HazardSeverity? severity,

    /// The latitude of the hazard location.
    final double? latitude,

    /// The longitude of the hazard location.
    final double? longitude,

    /// The human-readable name of the hazard location.
    final String? locationName,

    /// The id of the category the hazard belongs to.
    final String? categoryId,

    /// The category the hazard belongs to.
    final HazardCategory? category,

    /// The source details of the hazard.
    final HazardSource? source,

    /// The AI-generated summary of the hazard.
    final String? aiSummary,

    /// The AI-determined severity of the hazard.
    final HazardSeverity? aiSeverity,

    /// The AI-determined confidence level of the hazard.
    final AIConfidence? aiConfidence,

    /// The things users can do to mitigate the hazard.
    final String? callToAction,

    /// Indicates whether the hazard follows AWS standards.
    final bool? isAwsCompliant,

    /// The user who reported the hazard.
    ///
    /// If source is provided, this may be null.
    final AppUser? reportedBy,

    /// The status of the hazard review.
    final HazardReviewStatus? reviewStatus,

    /// The feedback provided during the review of the hazard.
    final String? reviewFeedback,

    /// The id of the user who reviewed the hazard.
    ///
    /// If AI reviewed the hazard, this will be "ai",
    final String? reviewedById,

    /// The date and time when the hazard was reviewed.
    @DateTimeConverter() final DateTime? reviewedAt,

    /// The vote type (upvote or downvote) by the current user.
    final HazardVoteType? userVoteType,

    /// The total number of upvotes for the hazard.
    @Default(0) final int upvoteCount,

    /// The total number of downvotes for the hazard.
    @Default(0) final int downvoteCount,

    /// The confidence score of the hazard (from 0 to 100) to be used in the sorting order.
    final int? confidenceScore,

    /// The list of media files associated with the hazard.
    @Default(<S3Media>[]) final List<S3Media> medias,

    /// The list of medias that have been processed and are ready for displaying to the UI.
    ///
    /// This field is not included in JSON serialization/deserialization and is generated using [medias].
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(<AlrtMedia>[])
    final List<AlrtMedia> processedMedias,

    /// The date and time when the hazard occurred.
    @DateTimeConverter() final DateTime? occurredAt,

    /// The date and time when the hazard was reported.
    @DateTimeConverter() final DateTime? createdAt,

    /// The date and time when the hazard was last updated.
    @DateTimeConverter() final DateTime? updatedAt,

    /// The date and time when the hazard expires.
    @DateTimeConverter() final DateTime? expiresAt,
  }) = _Hazard;

  /// The net vote count (upvotes - downvotes) for the hazard.
  int get voteCount => upvoteCount - downvoteCount;

  /// Indicates whether the hazard has expired based on the current date and time.
  bool get isExpired {
    if (expiresAt == null) {
      return false;
    }
    return DateTime.now().isAfter(expiresAt!);
  }

  /// The file path for the hazard icon based on its category and severity.
  String get iconPath {
    if (bushFireAlertLevel != null &&
        bushFireAlertLevel != BushfireAlertLevel.advice) {
      final alertLevelName = bushFireAlertLevel!.name;
      return 'assets/images/hazards/aws/${categoryId}_$alertLevelName.png';
    }

    final severityName = severity?.name ?? HazardSeverity.info.name;
    return 'assets/images/hazards/${isAwsCompliant == true ? 'aws/' : 'non_aws/'}${categoryId}_$severityName.png';
  }

  /// The fallback file path for the hazard icon based on its severity.
  String get fallbackIconPath {
    final severityName = severity?.name ?? HazardSeverity.info.name;
    return 'assets/images/hazards/${isAwsCompliant == true ? 'aws/' : 'non_aws/'}other_$severityName.png';
  }

  /// Gets the appropriate BitmapDescriptor for the hazard marker.
  BitmapDescriptor? getMarkerBitmapDescriptor(
    Map<String, BitmapDescriptor> bitmapMap,
  ) {
    var key =
        '${categoryId}_${severity?.name ?? HazardSeverity.info.name}${isAwsCompliant == true ? '_aws' : '_non_aws'}';

    /// For bushfire hazards, use the bushfire alert level in the key
    if (bushFireAlertLevel != null &&
        bushFireAlertLevel != BushfireAlertLevel.advice) {
      key = '${categoryId}_${bushFireAlertLevel!.name}';
    }

    return bitmapMap[key];
  }

  /// Determines the bushfire alert level if the hazard is a bushfire.
  ///
  /// Returns null if the hazard is not a bushfire or if the description is empty.
  BushfireAlertLevel? get bushFireAlertLevel {
    if (!(category?.isBushfire ?? false) || (description?.isEmpty ?? true)) {
      return null;
    }
    return BushfireAlertLevel.values.firstWhere(
      (level) => level.keywords.any(
        (keyword) => description!.toLowerCase().contains(
          RegExp(r'\b' + keyword + r'\b'),
        ),
      ),
      orElse: () => BushfireAlertLevel.notApplicable,
    );
  }

  /// The color associated with the hazard's severity.
  Color get color {
    // If the hazard is a bushfire and has a specific alert level, use that color
    if (bushFireAlertLevel != null &&
        bushFireAlertLevel != BushfireAlertLevel.advice) {
      return bushFireAlertLevel!.color;
    }

    if (isAwsCompliant == true) {
      return severity?.colorAWS ?? HazardSeverity.info.colorAWS;
    }
    return severity?.colorNonAWS ?? HazardSeverity.info.colorNonAWS;
  }

  /// The title associated with the hazard's severity.
  String get severityTitle {
    if (isAwsCompliant == true) {
      return severity?.titleAws ?? HazardSeverity.info.titleAws;
    }
    return severity?.titleNonAWS ?? HazardSeverity.info.titleNonAWS;
  }

  factory Hazard.fromJson(Map<String, dynamic> json) => _$HazardFromJson(json);
}
