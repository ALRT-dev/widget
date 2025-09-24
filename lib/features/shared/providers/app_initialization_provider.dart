import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hazard_app/features/auth/providers/service_providers.dart';
import 'package:hazard_app/features/shared/providers/instance_providers.dart';
import 'package:hazard_app/features/shared/providers/logged_in_user_provider.dart';
import 'package:hazard_app/features/shared/utils/async_call_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

final providerOfAppInitialization =
    NotifierProvider.autoDispose<AppInitializationProvider, bool>(
  AppInitializationProvider.new,
);

class AppInitializationProvider extends Notifier<bool> {
  @override
  bool build() {
    return false;
  }

  /// Initializes the app by performing necessary setup tasks.
  Future<void> initialize() async {
    state = false;

    await _initializeSharedPreferences();
    if (!ref.mounted) return;

    // initialize these things after shared preference is initialized but before logged in user is initialized
    await Future.wait([
      _initializeLoggedInUser(),
      _initializeGoogleSignIn(),
    ]);
    if (!ref.mounted) return;

    // initialize these things after logged in user is initialized
    await Future.wait([]);
    if (!ref.mounted) return;

    state = true;
  }

  /// Initializes the shared preferences instance.
  Future<void> _initializeSharedPreferences() {
    return runAsyncCall(
      name: 'initializeSharedPreferences',
      future: () async {
        final sharedPrefs = await SharedPreferences.getInstance();
        ref.read(providerOfSharedPreferencesInstance.notifier).state =
            sharedPrefs;
      },
      onError: (_) {},
    );
  }

  /// Initialize google sign-in.
  Future<void> _initializeGoogleSignIn() {
    return runAsyncCall(
      name: 'initializeGoogleSignIn',
      future: () {
        return ref.read(providerOfAuthService).initializeGoogleSignIn();
      },
      onError: (_) {},
    );
  }

  /// Initializes the current logged in user.
  Future<void> _initializeLoggedInUser() {
    return runAsyncCall(
      name: 'initializeLoggedInUser',
      future: () {
        return ref.refresh(providerOfLoggedInUserFetcher.future);
      },
      onError: (_) {},
    );
  }
}
