import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppWrapper extends ConsumerStatefulWidget {
  /// A simple wrapper widget for the app's main content.
  ///
  /// If the user is not logged in, it shows the auth screen.
  /// If the user is logged in, it shows the home screen.
  const AppWrapper({super.key});

  static const route = '/';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppWrapperState();
}

class _AppWrapperState extends ConsumerState<AppWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Welcome to Hazard App Test',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
