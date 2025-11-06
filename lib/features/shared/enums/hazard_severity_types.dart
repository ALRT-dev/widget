import 'package:flutter/material.dart';
import 'package:hazard_app/others/app_colors.dart';

enum HazardSeverity {
  unknown, // Used only for user reported hazards
  info, // For AWS and Non-AWS: info
  advice, // For AWS: advice ------ For Non-AWS: low
  watchAndAct, // For AWS: watchAndAct ------ For Non-AWS: moderate
  emergency; // For AWS: emergency ------ For Non-AWS: high

  /// Returns the title string corresponding to the hazard severity following AWS standards.
  String get titleAws {
    return switch (this) {
      HazardSeverity.unknown => 'Unknown',
      HazardSeverity.info => 'Info',
      HazardSeverity.advice => 'Advice',
      HazardSeverity.watchAndAct => 'Watch and Act',
      HazardSeverity.emergency => 'Emergency',
    };
  }

  /// Returns the title string corresponding to the hazard severity (not AWS standards).
  String get titleNonAws {
    return switch (this) {
      HazardSeverity.unknown => 'Unknown',
      HazardSeverity.info => 'Info',
      HazardSeverity.advice => 'Low',
      HazardSeverity.watchAndAct => 'Moderate',
      HazardSeverity.emergency => 'High',
    };
  }

  /// Returns the color associated with the hazard severity following AWS standards.
  Color get colorAws {
    return switch (this) {
      HazardSeverity.unknown => AppColors.transparent,
      HazardSeverity.info => AppColors.info,
      HazardSeverity.advice => AppColors.advice,
      HazardSeverity.watchAndAct => AppColors.watchAndAct,
      HazardSeverity.emergency => AppColors.emergency,
    };
  }

  /// Returns the color associated with the hazard severity (not AWS standards).
  Color get colorNonAws {
    return switch (this) {
      HazardSeverity.unknown => AppColors.transparent,
      HazardSeverity.info => AppColors.blue,
      HazardSeverity.advice => AppColors.advice,
      HazardSeverity.watchAndAct => AppColors.watchAndAct,
      HazardSeverity.emergency => AppColors.emergency,
    };
  }

  /// Returns the emoji associated with the hazard severity following AWS standards.
  String get emojiAws {
    return switch (this) {
      HazardSeverity.unknown => '⚪',
      HazardSeverity.info => '🔵',
      HazardSeverity.advice => '🟡',
      HazardSeverity.watchAndAct => '🟠',
      HazardSeverity.emergency => '🔴',
    };
  }

  /// Returns the emoji associated with the hazard severity (not AWS standards).
  String get emojiNonAws {
    return switch (this) {
      HazardSeverity.unknown => '⚪',
      HazardSeverity.info => '🔵',
      HazardSeverity.advice => '🟡',
      HazardSeverity.watchAndAct => '🟠',
      HazardSeverity.emergency => '🔴',
    };
  }
}
