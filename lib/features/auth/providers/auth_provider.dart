import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

  /// Handles web sign-in after the user has authenticated via renderButton
  Future<void> handleWebSignIn({
    required GoogleSignInAccount googleUser,
  }) async {
    state = state.copyWith(
      signInWithGoogleState: const SignInWithGoogleState.loading(),
    );

    final result = await _authService.signInWithGoogleUser(
      googleUser: googleUser,
    );
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

  /// Signs in the user with Apple.
  Future<void> signInWithApple() async {
    state = state.copyWith(
      signInWithAppleState: const SignInWithAppleState.loading(),
    );

    final result = await _authService.signInWithApple();
    if (!ref.mounted) return;

    result.when(
      (data) {
        state = state.copyWith(
          signInWithAppleState: const SignInWithAppleState.success(),
        );
      },
      (error) {
        state = state.copyWith(
          signInWithAppleState: SignInWithAppleState.error(error),
        );
      },
    );
  }

  /// Signs in the user with Microsoft.
  Future<void> signInWithMicrosoft() async {
    state = state.copyWith(
      signInWithMicrosoftState: const SignInWithMicrosoftState.loading(),
    );

    final result = await _authService.signInWithMicrosoft();
    if (!ref.mounted) return;

    result.when(
      (data) {
        state = state.copyWith(
          signInWithMicrosoftState: const SignInWithMicrosoftState.success(),
        );
      },
      (error) {
        state = state.copyWith(
          signInWithMicrosoftState: SignInWithMicrosoftState.error(error),
        );
      },
    );
  }
}
