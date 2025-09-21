import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hazard_app/features/shared/providers/app_info_provider.dart';
import 'package:hazard_app/others/app_router.dart';
import 'package:hazard_app/others/app_theme.dart';

class MyApp extends ConsumerStatefulWidget {
  /// The root widget of the application.
  /// It sets up theming, routing, and other global configurations.
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  late GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = AppRouter.buildRouter(ref);
  }

  @override
  Widget build(BuildContext context) {
    final appName = ref.watch(
      providerOfAppInfo.select(
        (value) => value.appName,
      ),
    );

    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: appName,
          debugShowCheckedModeBanner: false,
          routerDelegate: _router.routerDelegate,
          routeInformationParser: _router.routeInformationParser,
          routeInformationProvider: _router.routeInformationProvider,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: AppTheme.lightPalette,
          darkTheme: AppTheme.darkPalette,
        );
      },
    );
  }
}
