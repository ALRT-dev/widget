import 'package:flutter/material.dart';
import 'package:hazard_app/others/app_colors.dart';

enum HazardSeverity {
  info,
  advice,
  watchAndAct,
  emergency;

  /// Returns the title string corresponding to the hazard severity.
  String get title {
    return switch (this) {
      HazardSeverity.info => 'Info',
      HazardSeverity.advice => 'Advice',
      HazardSeverity.watchAndAct => 'Watch and Act',
      HazardSeverity.emergency => 'Emergency',
    };
  }

  /// Returns the asset path for the marker icon corresponding to the hazard severity.
  String get markerPath {
    return switch (this) {
      HazardSeverity.info => 'assets/pins/pin_blue.png',
      HazardSeverity.advice => 'assets/pins/pin_yellow.png',
      HazardSeverity.watchAndAct => 'assets/pins/pin_orange.png',
      HazardSeverity.emergency => 'assets/pins/pin_red.png',
    };
  }

  /// Returns the color associated with the hazard severity.
  Color get color {
    return switch (this) {
      HazardSeverity.info => AppColors.info,
      HazardSeverity.advice => AppColors.advice,
      HazardSeverity.watchAndAct => AppColors.watchAndAct,
      HazardSeverity.emergency => AppColors.emergency,
    };
  }

  String get emoji {
    return switch (this) {
      HazardSeverity.info => '🔵',
      HazardSeverity.advice => '🟡',
      HazardSeverity.watchAndAct => '🟠',
      HazardSeverity.emergency => '🔴',
    };
  }
}
