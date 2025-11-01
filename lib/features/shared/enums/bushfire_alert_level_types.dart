import 'dart:ui';

import 'package:hazard_app/others/app_colors.dart';

enum BushfireAlertLevel {
  notApplicable,
  responding,
  plannedBurn,
  advice;

  /// Returns the title of the bushfire alert level.
  String get title {
    switch (this) {
      case BushfireAlertLevel.notApplicable:
        return 'Not Applicable';
      case BushfireAlertLevel.responding:
        return 'Responding';
      case BushfireAlertLevel.plannedBurn:
        return 'Planned Burn';
      case BushfireAlertLevel.advice:
        return 'Advice';
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
