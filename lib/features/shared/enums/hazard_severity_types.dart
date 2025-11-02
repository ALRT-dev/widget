import 'package:flutter/material.dart';
import 'package:hazard_app/others/app_colors.dart';

enum HazardSeverity {
  unknown, // Used only for user reported hazards
  info, // For AWS and Non-AWS: info
  low, // For AWS: <ignored> ------ For Non-AWS: low
  advice, // For AWS: advice ------ For Non-AWS: moderate
  watchAndAct, // For AWS: watchAndAct ------ For Non-AWS: high
  emergency; // For AWS: emergency ------ For Non-AWS: critical

  /// Returns the title string corresponding to the hazard severity following AWS standards.
  String get titleAws {
    return switch (this) {
      HazardSeverity.unknown => 'Unknown',
      HazardSeverity.info => 'Info',
      HazardSeverity.low => 'Low',
      HazardSeverity.advice => 'Advice',
      HazardSeverity.watchAndAct => 'Watch and Act',
      HazardSeverity.emergency => 'Emergency',
    };
  }

  /// Returns the title string corresponding to the hazard severity (not AWS standards).
  String get titleNonAWS {
    return switch (this) {
      HazardSeverity.unknown => 'Unknown',
      HazardSeverity.info => 'Info',
      HazardSeverity.low => 'Low',
      HazardSeverity.advice => 'Moderate',
      HazardSeverity.watchAndAct => 'High',
      HazardSeverity.emergency => 'Critical',
    };
  }

  /// Returns the color associated with the hazard severity following AWS standards.
  Color get colorAWS {
    return switch (this) {
      HazardSeverity.unknown => AppColors.grey,
      HazardSeverity.info => AppColors.info,
      HazardSeverity.advice => AppColors.advice,
      HazardSeverity.watchAndAct => AppColors.watchAndAct,
      HazardSeverity.emergency => AppColors.emergency,
      (_) => AppColors.grey,
    };
  }

  /// Returns the color associated with the hazard severity (not AWS standards).
  Color get colorNonAWS {
    return switch (this) {
      HazardSeverity.unknown => AppColors.grey,
      HazardSeverity.info => AppColors.blue,
      HazardSeverity.low => AppColors.yellow,
      HazardSeverity.advice => AppColors.orange,
      HazardSeverity.watchAndAct => AppColors.red,
      HazardSeverity.emergency => AppColors.darkRed,
    };
  }

  String get emoji {
    return switch (this) {
      HazardSeverity.unknown => '⚪',
      HazardSeverity.info => '🔵',
      HazardSeverity.low => '🟢',
      HazardSeverity.advice => '🟡',
      HazardSeverity.watchAndAct => '🟠',
      HazardSeverity.emergency => '🔴',
    };
  }
}
