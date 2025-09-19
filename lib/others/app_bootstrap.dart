import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

    return runApp(
      ProviderScope(
        child: const MyApp(),
      ),
    );
  }
}
