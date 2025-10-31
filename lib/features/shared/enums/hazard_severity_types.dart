import 'package:flutter/material.dart';
import 'package:hazard_app/others/app_colors.dart';

enum HazardSeverity {
  unknown,
  info,
  advice,
  watchAndAct,
  emergency;

  /// Returns the title string corresponding to the hazard severity.
  String get title {
    return switch (this) {
      HazardSeverity.unknown => 'Unknown',
      HazardSeverity.info => 'Info',
      HazardSeverity.advice => 'Advice',
      HazardSeverity.watchAndAct => 'Watch and Act',
      HazardSeverity.emergency => 'Emergency',
    };
  }

  /// Returns the color associated with the hazard severity.
  Color get color {
    return switch (this) {
      HazardSeverity.unknown => AppColors.grey,
      HazardSeverity.info => AppColors.info,
      HazardSeverity.advice => AppColors.advice,
      HazardSeverity.watchAndAct => AppColors.watchAndAct,
      HazardSeverity.emergency => AppColors.emergency,
    };
  }

  String get emoji {
    return switch (this) {
      HazardSeverity.unknown => '⚪',
      HazardSeverity.info => '🔵',
      HazardSeverity.advice => '🟡',
      HazardSeverity.watchAndAct => '🟠',
      HazardSeverity.emergency => '🔴',
    };
  }
}
