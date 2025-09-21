import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hazard_app/features/shared/providers/instance_providers.dart';
import 'package:hazard_app/features/shared/repositories/shared_prefs_repository.dart';

/// Provides [SharedPreferencesRepository] instance.
final providerOfSharedPreferencesRepository =
    Provider<SharedPreferencesRepository>((ref) {
  return SharedPrefsRepositoryImpl(
    sharedPreferences: ref.watch(providerOfSharedPreferencesInstance)!,
  );
});
