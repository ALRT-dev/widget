import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';

part 'auth_provider_state.freezed.dart';

@freezed
abstract class AuthProviderState with _$AuthProviderState {
  const factory AuthProviderState({
    /// The state of signing in with Google.
    @Default(SignInWithGoogleState.initial())
    SignInWithGoogleState signInWithGoogleState,

    /// The state of signing in with Apple.
    @Default(SignInWithAppleState.initial())
    SignInWithAppleState signInWithAppleState,
  }) = _AuthProviderState;
}

@freezed
class SignInWithGoogleState with _$SignInWithGoogleState {
  const factory SignInWithGoogleState.initial() = SignInWithGoogleStateInitial;
  const factory SignInWithGoogleState.loading() = SignInWithGoogleStateLoading;
  const factory SignInWithGoogleState.success() = SignInWithGoogleStateSuccess;
  const factory SignInWithGoogleState.error(
    final AppError error,
  ) = SignInWithGoogleStateError;
}

@freezed
class SignInWithAppleState with _$SignInWithAppleState {
  const factory SignInWithAppleState.initial() = SignInWithAppleStateInitial;
  const factory SignInWithAppleState.loading() = SignInWithAppleStateLoading;
  const factory SignInWithAppleState.success() = SignInWithAppleStateSuccess;
  const factory SignInWithAppleState.error(
    final AppError error,
  ) = SignInWithAppleStateError;
}
