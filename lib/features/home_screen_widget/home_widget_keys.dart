/// Shared constants for the ALRT home-screen widget (iOS WidgetKit +
/// Android App Widget), bridged through the `home_widget` plugin.
///
/// These MUST stay in sync with the native side:
///  - iOS: `ios/AlrtWidget/AlrtAlertsWidget.swift` (App Group + payload key)
///  - Android: `AlrtAlertsWidgetProvider.kt` (payload key)
class HomeWidgetKeys {
  const HomeWidgetKeys._();

  /// App Group used to share data between the Flutter app and the iOS widget
  /// extension. Must match the App Group added in Xcode to BOTH the Runner
  /// target and the AlrtWidget extension target.
  static const appGroupId = 'group.com.safetyalrt.alrt';

  /// The single JSON payload the widget renders from. One key keeps the
  /// Dart/Kotlin/Swift contract trivial to reason about.
  static const payloadKey = 'alrt_widget_payload';

  /// Android provider class name (as registered in AndroidManifest.xml).
  static const androidProviderName = 'AlrtAlertsWidgetProvider';

  /// iOS widget `kind` (must match the `kind:` in AlrtAlertsWidget.swift).
  static const iosWidgetName = 'AlrtAlertsWidget';

  /// Custom scheme used when the user taps the widget. Handled by the router.
  static const deeplinkScheme = 'alrtwidget';
}
