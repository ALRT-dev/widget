import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Provider of [Connectivity] instance.
final providerOfConnectivityInstance = Provider<Connectivity>(
  (ref) => Connectivity(),
);

/// Provider of [InternetConnectionChecker] instance.
final providerOfInternetConnectionCheckerInstance =
    Provider<InternetConnectionChecker>(
  (ref) => InternetConnectionChecker.instance,
);

/// Provider of [SharedPreferences] instance.
final providerOfSharedPreferencesInstance = StateProvider<SharedPreferences?>(
  (ref) => null,
);

/// Provider of [GoogleSignIn] instance.
final providerOfGoogleSignInInstance = Provider<GoogleSignIn>(
  (ref) => GoogleSignIn.instance,
);
