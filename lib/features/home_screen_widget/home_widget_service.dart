import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:home_widget/home_widget.dart';
import 'package:hazard_app/features/home_screen_widget/home_widget_keys.dart';
import 'package:hazard_app/features/home_screen_widget/models/home_widget_alert.dart';

/// Bridges app state to the native home-screen widgets (iOS WidgetKit +
/// Android App Widget) via the `home_widget` plugin.
///
/// Contract with the native side:
///  - one JSON payload is written under [HomeWidgetKeys.payloadKey]
///  - [refresh] triggers a redraw on both platforms
///  - taps arrive as a [HomeWidgetKeys.deeplinkScheme] URI, surfaced through
///    [initiallyLaunchedUri] (cold start) and [clicks] (warm)
class HomeWidgetService {
  const HomeWidgetService._();

  /// Call once during app bootstrap, before pushing any data.
  static Future<void> initialize() async {
    // Required for the iOS App Group; a no-op on Android.
    await HomeWidget.setAppGroupId(HomeWidgetKeys.appGroupId);
  }

  /// Serializes [payload] and asks both platforms to redraw.
  static Future<void> update(final HomeWidgetPayload payload) async {
    try {
      await HomeWidget.saveWidgetData<String>(
        HomeWidgetKeys.payloadKey,
        jsonEncode(payload.toJson()),
      );
      await refresh();
    } catch (e, s) {
      // Never let a widget failure crash the host app.
      debugPrint('HomeWidgetService.update failed: $e\n$s');
    }
  }

  /// Forces a redraw without changing data (e.g. after a locale change).
  static Future<void> refresh() async {
    await HomeWidget.updateWidget(
      name: HomeWidgetKeys.androidProviderName,
      androidName: HomeWidgetKeys.androidProviderName,
      iOSName: HomeWidgetKeys.iosWidgetName,
      qualifiedAndroidName:
          'com.safetyalrt.alrt.${HomeWidgetKeys.androidProviderName}',
    );
  }

  /// The URI the app was cold-launched from, if the launch came from a widget
  /// tap. Null otherwise.
  static Future<Uri?> initiallyLaunchedUri() =>
      HomeWidget.initiallyLaunchedFromHomeWidget();

  /// Stream of widget-tap URIs while the app is already running.
  static Stream<Uri?> get clicks => HomeWidget.widgetClicked;
}
