import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';

part 'profile_provider_state.freezed.dart';

@freezed
abstract class ProfileProviderState with _$ProfileProviderState {
  const factory ProfileProviderState({
    /// The state of logging out the user.
    @Default(LogoutState.initial()) final LogoutState logoutState,
  }) = _ProfileProviderState;
}

@freezed
class LogoutState with _$LogoutState {
  const factory LogoutState.initial() = _LogoutStateInitial;
  const factory LogoutState.loading() = _LogoutStateLoading;
  const factory LogoutState.success() = _LogoutStateSuccess;
  const factory LogoutState.error(
    final AppError error,
  ) = _LogoutStateError;
}
