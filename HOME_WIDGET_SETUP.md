# Home-screen widgets — ALRT

Two home-screen widgets (iOS WidgetKit + Android App Widget):

1. **Nearby Alerts** — the single highest-severity nearby hazard, or an
   "All clear" green state. Auto-fed from the map provider's hazard fetches.
2. **Family status** — the user's circle at a glance: a live family SOS
   (solid red), "Everyone's safe" (green), an "N of M checked in" count, or
   "No family circle". Auto-fed from the family provider.

Both deep-link back into the app on tap. Built to the locked product rules:

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

## 2. Data push (already wired)
Both widgets update themselves — no extra call sites needed:

- **Nearby Alerts** — `MapProvider` calls `HomeWidgetSync.push(_ref, hazards)`
  right after each hazard-fetch success (`lib/features/map/providers/map_provider.dart`).
  It ranks by severity band then distance from the user (within 50 km), and
  renders "All clear" when nothing is nearby.
- **Family status** — `FamilyProvider` registers
  `addListener(FamilyWidgetSync.push)` in its constructor, so any circle / SOS /
  check-in change reflects on the widget. A signature guard suppresses
  redundant writes.

To push manually from elsewhere (e.g. a background handler), the low-level API
is still available:

```dart
import 'package:hazard_app/features/home_screen_widget/home_widget_mapper.dart';
import 'package:hazard_app/features/home_screen_widget/home_widget_service.dart';

await HomeWidgetService.update(
  HomeWidgetMapper.payload(
    nearby: hazards.map(HomeWidgetMapper.fromHazard).toList(), // highest-severity first
    updatedLabel: 'Updated 9:42 am',
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
