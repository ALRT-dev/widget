import 'dart:ui';

import 'package:hazard_app/others/app_colors.dart';

enum BushfireAlertLevel {
  plannedBurn, // Dotted border
  responding, // Solid border with black fill
  notApplicable, // Solid border with white fill
  advice;

  /// Returns the title of the bushfire alert level.
  String get title {
    switch (this) {
      case BushfireAlertLevel.plannedBurn:
        return 'Planned Burn';
      case BushfireAlertLevel.responding:
        return 'Responding';
      case BushfireAlertLevel.notApplicable:
        return 'Not Applicable';
      case BushfireAlertLevel.advice:
        return 'Advice';
    }
  }

  /// The list of keywords that can be used to identify the bushfire alert level from text.
  List<String> get keywords {
    switch (this) {
      case BushfireAlertLevel.plannedBurn:
        return [
          'burn off',
          'burnoff',
          'planned burn',
          'controlled burn',
          'prescribed burn',
          'hazard reduction',
          'hazard reduction burn',
          'fuel reduction',
          'fuel reduction burn',
          'back burn',
          'backburn',
          'cultural burn',
          'mitigation burn',
          'prevention burn',
          'scheduled burn',
          'management burn',
        ];
      case BushfireAlertLevel.responding:
        return [
          'responding',
          'controlled',
          'controlling',
          'contained',
          'emergency',
          'active',
          'going',
          'underway',
          'attend',
          'attending',
          'response',
          'crews responding',
          'firefighters responding',
          'units responding',
          'on scene',
          'in progress',
          'currently attending',
          'being attended',
          'suppression',
        ];
      case BushfireAlertLevel.notApplicable:
        return ['not applicable', 'n/a', 'na', 'none', 'nil'];
      case BushfireAlertLevel.advice:
        return [
          'advice',
          'watch and act',
          'emergency',
          'emergency warning',
          'prepare to leave',
          'prepare',
          'monitor',
          'stay informed',
          'be aware',
          'caution',
          'alert',
          'information',
          'update',
          'notification',
          'warning',
          'advisory',
        ];
    }
  }

  /// Returns the color associated with the bushfire alert level.
  Color get color {
    switch (this) {
      case BushfireAlertLevel.notApplicable:
        return Color(0xff424242);
      case BushfireAlertLevel.responding:
        return Color(0xff637075);
      case BushfireAlertLevel.plannedBurn:
        return Color(0xff637075);
      case BushfireAlertLevel.advice:
        return AppColors.advice;
    }
  }
}
