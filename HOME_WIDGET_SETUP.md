# Home-screen widget — ALRT "Nearby Alerts"

A home-screen widget (iOS WidgetKit + Android App Widget) that surfaces the
single highest-severity nearby hazard, an "All clear" green state when nothing
is active, and taps that deep-link back into the app. Built to the locked
product rules:

- **The two reds (rule 6):** the solid red gradient (`#FF5247 → #B80000`) is used
  ONLY for the `critical` band. Every other band uses its own colour; no
  needs-attention/dashed styling is rendered on the widget.
- **Severity never colour alone (rule 8):** every state shows an emoji glyph +
  a text severity label, so it reads with colour stripped.
- **SOS is never fired from a widget (rule 3):** a tap only navigates.

## What was added

**Flutter**
- `pubspec.yaml` — `home_widget: ^0.7.0`
- `lib/features/home_screen_widget/`
  - `home_widget_keys.dart` — the App Group + payload key + names (shared contract)
  - `models/home_widget_alert.dart` — payload value objects + `toJson`
  - `home_widget_mapper.dart` — maps `HazardSeverity` → widget band/label/emoji
  - `home_widget_service.dart` — writes the payload + triggers redraw
  - `home_widget_launch_handler.dart` — routes widget taps into the app
- `lib/others/app_bootstrap.dart` — calls `HomeWidgetService.initialize()` on start

**Android** (fully wired — no further steps)
- `AlrtAlertsWidgetProvider.kt`, `res/layout/alrt_widget.xml`,
  `res/xml/alrt_alerts_widget_info.xml`, `res/drawable/alrt_widget_*.xml`,
  and a `<receiver>` in `AndroidManifest.xml`.

**iOS** (needs one Xcode step)
- `ios/AlrtWidget/` — SwiftUI widget, `Info.plist`, entitlements.
- `ios/Runner/Runner.entitlements` — App Group added.
- **Follow `ios/AlrtWidget/SETUP.md`** to attach the WidgetKit target + App
  Group in Xcode.

## 1. Install
```bash
flutter pub get
cd ios && pod install && cd ..
```

## 2. Push data to the widget
Call this wherever the nearby-alerts list is known (e.g. after the map/alerts
provider refreshes). `nearby` must be ordered highest-severity first; pass an
empty list to show "All clear".

```dart
import 'package:hazard_app/features/home_screen_widget/home_widget_mapper.dart';
import 'package:hazard_app/features/home_screen_widget/home_widget_service.dart';

final nearby = hazards.map((h) => HomeWidgetMapper.alert(
  severity: h.severity,          // HazardSeverity
  title: h.title,
  area: h.area,                  // optional
  distance: h.distanceLabel,     // optional, already formatted e.g. "3.2 km"
  time: h.relativeTime,          // optional, already formatted e.g. "8 min ago"
)).toList();

await HomeWidgetService.update(
  HomeWidgetMapper.payload(
    nearby: nearby,
    updatedLabel: 'Updated ${TimeOfDay.now().format(context)}',
  ),
);
```

## 3. Handle taps (deep-link)
From a widget that lives for the app's lifetime (e.g. `MyApp` / `AppWrapper`),
after the router exists:

```dart
late final HomeWidgetLaunchHandler _widgetLaunch;

@override
void initState() {
  super.initState();
  _widgetLaunch = HomeWidgetLaunchHandler(ref)..attach();
}

@override
void dispose() {
  _widgetLaunch.dispose();
  super.dispose();
}
```
`attach()` handles both cold start (app launched from the widget) and warm taps.
The handler navigates to `/home` and selects the Alerts tab
(`HomeTab.notifications`) for `screen=alerts`, or the Map tab for `screen=map`.

## Verification status
- **Not yet compiled/built here** — this was authored on Windows without a
  Flutter/Gradle/Xcode toolchain. Before merging:
  - `flutter pub get` then `flutter analyze` (expect 0 errors).
  - Android: build & add the widget from the launcher.
  - iOS: complete `ios/AlrtWidget/SETUP.md`, then build on a device.
- The `home_widget` version (`^0.7.0`) should be reconciled against
  `pubspec.lock` on first `pub get`; bump if a newer minor is resolved.

## Extending
The payload already carries `more[]` and `activeCount`, so a `systemLarge` iOS
family or a taller Android layout can list several hazards without changing the
Dart contract. A separate **Family status** widget can reuse `HomeWidgetService`
with its own payload key + provider/kind.
