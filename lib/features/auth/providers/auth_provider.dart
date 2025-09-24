import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hazard_app/features/auth/providers/service_providers.dart';
import 'package:hazard_app/features/auth/providers/states/auth_provider_state.dart';
import 'package:hazard_app/features/auth/services/auth_service.dart';

final providerOfAuth =
    NotifierProvider.autoDispose<AuthProvider, AuthProviderState>(
  AuthProvider.new,
);

class AuthProvider extends Notifier<AuthProviderState> {
  @override
  AuthProviderState build() {
    return AuthProviderState();
  }

  AuthService get _authService => ref.read(providerOfAuthService);

  /// Signs in the user with Google.
  Future<void> signInWithGoogle() async {
    state = state.copyWith(
      signInWithGoogleState: const SignInWithGoogleState.loading(),
    );

    final result = await _authService.signInWithGoogle();
    if (!ref.mounted) return;

    result.when(
      (data) {
        state = state.copyWith(
          signInWithGoogleState: const SignInWithGoogleState.success(),
        );
      },
      (error) {
        state = state.copyWith(
          signInWithGoogleState: SignInWithGoogleState.error(error),
        );
      },
    );
  }
}
