import 'dart:ui';

import 'package:hazard_app/others/app_colors.dart';

enum HazardSeverityBand {
  info,
  monitor,
  action,
  critical;

  /// Returns the color associated with the hazard severity band following AWS standards.
  Color get colorAws {
    return switch (this) {
      HazardSeverityBand.info => AppColors.yellow,
      HazardSeverityBand.monitor => AppColors.yellow,
      HazardSeverityBand.action => AppColors.orange,
      HazardSeverityBand.critical => AppColors.red,
    };
  }

  /// Returns the color associated with the hazard severity band (not AWS standards).
  Color get colorNonAws {
    return switch (this) {
      HazardSeverityBand.info => AppColors.transparent,
      HazardSeverityBand.monitor => AppColors.yellow,
      HazardSeverityBand.action => AppColors.orange,
      HazardSeverityBand.critical => AppColors.red,
    };
  }
}
