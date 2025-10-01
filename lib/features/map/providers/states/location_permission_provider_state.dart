import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hazard_app/features/map/models/alrt_location_model.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';

part 'location_permission_provider_state.freezed.dart';

@freezed
abstract class LocationProviderState with _$LocationProviderState {
  const factory LocationProviderState({
    /// Current user's location.
    final AlrtLocation? location,

    /// The state of getting the current user's location.
    @Default(GetLocationState.initial())
    final GetLocationState getLocationState,

    /// The state of getting the location permission of the device.
    @Default(GetLocationPremissionState.initial())
    final GetLocationPremissionState getLocationPremissionState,
  }) = _LocationProviderState;
}

@freezed
class GetLocationState with _$GetLocationState {
  const factory GetLocationState.initial() = GetLocationStateInitial;
  const factory GetLocationState.loading() = GetLocationStateLoading;
  const factory GetLocationState.success(
    final AlrtLocation location,
  ) = GetLocationStateSuccess;
  const factory GetLocationState.error(
    final AppError error,
  ) = GetLocationStateError;
}

@freezed
class GetLocationPremissionState with _$GetLocationPremissionState {
  const factory GetLocationPremissionState.initial() =
      GetLocationPremissionStateInitial;
  const factory GetLocationPremissionState.loading() =
      GetLocationPremissionStateLoading;
  const factory GetLocationPremissionState.success() =
      GetLocationPremissionStateSuccess;
  const factory GetLocationPremissionState.error(
    final AppError error,
  ) = GetLocationPremissionStateError;
}
