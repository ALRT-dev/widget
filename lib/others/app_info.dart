import 'package:hazard_app/others/app_flavor_types.dart';

class AppInfo {
  /// The name of the app.
  final appName = 'Hazard';

  /// The package name of the app.
  final appId = 'com.gtg.hazard';

  /// The flavor that the app is running on.
  final flavor = AppFlavor.prod;
}

class DevAppInfo extends AppInfo {
  @override
  String get appName => '[DEV] Hazard';

  @override
  String get appId => '${super.appId}.dev';

  @override
  AppFlavor get flavor => AppFlavor.dev;
}
