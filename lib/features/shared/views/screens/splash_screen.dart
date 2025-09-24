import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hazard_app/features/shared/views/widgets/spinner.dart';

class SplashScreen extends ConsumerStatefulWidget {
  /// Displays a loading spinner while the app is initializing.
  const SplashScreen({super.key});

  static const route = '/splash';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Spinner(),
    );
  }
}
