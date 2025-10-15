import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';

part 'profile_provider_state.freezed.dart';

@freezed
abstract class ProfileProviderState with _$ProfileProviderState {
  const factory ProfileProviderState({
    /// The list of hazards reported by the logged-in user which were accepted.
    @Default(<Hazard>[]) final List<Hazard> myAcceptedHazards,

    /// The list of hazards reported by the logged-in user which were rejected.
    @Default(<Hazard>[]) final List<Hazard> myRejectedHazards,

    /// The state of fetching hazards reported by the logged-in user.
    @Default(GetMyHazardsState.initial())
    final GetMyHazardsState getMyAcceptedHazardsState,

    /// The state of fetching hazards reported by the logged-in user.
    @Default(GetMyHazardsState.initial())
    final GetMyHazardsState getMyRejectedHazardsState,

    /// The state of logging out the user.
    @Default(LogoutState.initial()) final LogoutState logoutState,
  }) = _ProfileProviderState;
}

@freezed
class GetMyHazardsState with _$GetMyHazardsState {
  const factory GetMyHazardsState.initial() = _GetMyHazardsStateInitial;
  const factory GetMyHazardsState.loading() = _GetMyHazardsStateLoading;
  const factory GetMyHazardsState.success(
    final List<Hazard> hazards,
  ) = _GetMyHazardsStateSuccess;
  const factory GetMyHazardsState.error(
    final AppError error,
  ) = _GetMyHazardsStateError;
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
