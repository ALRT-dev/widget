import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hazard_app/features/auth/providers/auth_provider.dart';
import 'package:hazard_app/features/auth/providers/states/auth_provider_state.dart';
import 'package:hazard_app/features/auth/views/widgets/google_signin_button.dart';
import 'package:hazard_app/features/shared/extensions/context_extension.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/others/app_wrapper.dart';

class AuthScreen extends ConsumerStatefulWidget {
  /// The authentication screen where users can sign in or sign up.
  const AuthScreen({super.key});

  static const route = '/auth';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    // register this provider to the lifecycle of this screen
    ref.watch(providerOfAuth.select((value) => null));

    _listenToAuthStateChanges();

    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final isLoading = ref.watch(
              providerOfAuth.select(
                (state) =>
                    state.signInWithGoogleState is SignInWithGoogleStateLoading,
              ),
            );
            return GoogleSignInButton(
              isLoading: isLoading,
              onPressed: isLoading ? null : _signInWithGoogle,
            );
          },
        ),
      ),
    );
  }

  /// Listens to the auth state changes and navigates to the appropriate screen.
  void _listenToAuthStateChanges() {
    ref.listen<SignInWithGoogleState>(
      providerOfAuth.select(
        (value) => value.signInWithGoogleState,
      ),
      (previous, next) {
        next.maybeWhen(
          success: _gotoWrapper,
          error: _handleError,
          orElse: () {},
        );
      },
    );
  }

  /// Handles errors by showing an error toast.
  void _handleError(final AppError error) {
    context.showErrorToast(message: error.message);
  }

  /// Signs in the user with Google.
  void _signInWithGoogle() {
    ref.read(providerOfAuth.notifier).signInWithGoogle();
  }

  /// Navigates to the app wrapper screen.
  void _gotoWrapper() {
    context.go(AppWrapper.route);
  }
}
