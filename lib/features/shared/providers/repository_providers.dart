import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hazard_app/features/shared/providers/instance_providers.dart';
import 'package:hazard_app/features/shared/providers/rest_client_provider.dart';
import 'package:hazard_app/features/shared/repositories/shared_prefs_repository.dart';
import 'package:hazard_app/features/shared/repositories/user_repository.dart';

/// Provides [SharedPreferencesRepository].
final providerOfSharedPreferencesRepository =
    Provider<SharedPreferencesRepository>((ref) {
  return SharedPrefsRepositoryImpl(
    sharedPreferences: ref.watch(providerOfSharedPreferencesInstance)!,
  );
});

/// Provides [UserRepository].
final providerOfUserRepository = Provider<UserRepository>((ref) {
  return UserRepositoryImpl(
    restClient: ref.watch(providerOfRestClient),
  );
});
