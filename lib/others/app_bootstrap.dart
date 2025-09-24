import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hazard_app/features/shared/providers/app_info_provider.dart';
import 'package:hazard_app/features/shared/providers/base_url_provider.dart';
import 'package:hazard_app/others/app.dart';
import 'package:hazard_app/others/app_flavor_types.dart';

class AppBootstrap {
  /// Initializes the app with the given [flavor].
  AppBootstrap({required this.flavor}) {
    _onInit();
  }

  final AppFlavor flavor;

  void _onInit() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Future.wait([
      EasyLocalization.ensureInitialized(),
      dotenv.load(fileName: '.env'),
    ]);

    return runApp(
      EasyLocalization(
        supportedLocales: [
          Locale('en'),
        ],
        path: 'assets/translations',
        fallbackLocale: Locale('en'),
        child: ProviderScope(
          overrides: [
            // override the app info provider with dev app info provider if the current flavor is dev
            if (flavor == AppFlavor.dev)
              providerOfAppInfo.overrideWith(
                (ref) => ref.watch(providerOfDevAppInfo),
              ),
            // override the baseUrl with baseUrlDev if the current flavor is dev
            if (flavor == AppFlavor.dev)
              providerOfBaseUrl.overrideWith(
                (ref) => ref.watch(providerOfBaseUrlDev),
              ),
          ],
          child: const MyApp(),
        ),
      ),
    );
  }
}
