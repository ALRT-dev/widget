import 'package:hazard_app/features/home_screen_widget/home_widget_keys.dart';
import 'package:hazard_app/features/home_screen_widget/models/home_widget_alert.dart';
import 'package:hazard_app/features/shared/enums/hazard_severity_band_types.dart';
import 'package:hazard_app/features/shared/enums/hazard_severity_types.dart';

/// Maps app hazard concepts onto the [HomeWidgetPayload] the native widgets
/// render. Keeping this in one place means wiring the widget to real hazard
/// data is a single call from wherever the nearby-alerts list already lives.
extension HazardSeverityWidgetBand on HazardSeverity {
  /// Collapses the 5-value app severity onto the 4 widget bands. The `critical`
  /// band is the only one that earns the solid red gradient on the widget
  /// (locked rule 6: "the two reds").
  HazardSeverityBand get widgetBand => switch (this) {
        HazardSeverity.unknown => HazardSeverityBand.info,
        HazardSeverity.info => HazardSeverityBand.info,
        HazardSeverity.advice => HazardSeverityBand.monitor,
        HazardSeverity.watchAndAct => HazardSeverityBand.action,
        HazardSeverity.emergency => HazardSeverityBand.critical,
      };
}

class HomeWidgetMapper {
  const HomeWidgetMapper._();

  /// Builds a single widget row from the fields a hazard already carries.
  /// Severity label + emoji are always populated so the row reads without
  /// colour (locked rule 8).
  static HomeWidgetAlert alert({
    required final HazardSeverity severity,
    required final String title,
    final String? area,
    final String? distance,
    final String? time,
  }) {
    return HomeWidgetAlert(
      band: severity.widgetBand,
      severityLabel: severity.titleAws,
      title: title,
      emoji: severity.emojiAws,
      area: area,
      distance: distance,
      time: time,
    );
  }

  /// Builds the full payload from an ordered (highest-severity-first) list of
  /// nearby alerts. Pass an empty list to render the green "All clear" state.
  static HomeWidgetPayload payload({
    required final List<HomeWidgetAlert> nearby,
    required final String updatedLabel,
    final String deeplink = '${HomeWidgetKeys.deeplinkScheme}://open?screen=alerts',
  }) {
    if (nearby.isEmpty) {
      return HomeWidgetPayload.allClear(
        updatedLabel: updatedLabel,
        deeplink: deeplink,
      );
    }
    return HomeWidgetPayload(
      updatedLabel: updatedLabel,
      deeplink: deeplink,
      primary: nearby.first,
      more: nearby.skip(1).take(3).toList(),
      activeCount: nearby.length,
    );
  }
}
