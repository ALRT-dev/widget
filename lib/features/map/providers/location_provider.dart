import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:hazard_app/features/map/models/alrt_location_model.dart';
import 'package:hazard_app/features/map/providers/service_providers.dart';
import 'package:hazard_app/features/map/providers/states/location_permission_provider_state.dart';
import 'package:hazard_app/features/map/services/location_service.dart';

final providerOfLocation =
    StateNotifierProvider<LocationProvider, LocationProviderState>(
  (ref) => LocationProvider(
    ref: ref,
    state: LocationProviderState(),
  ),
);

class LocationProvider extends StateNotifier<LocationProviderState> {
  LocationProvider({
    required final Ref ref,
    required final LocationProviderState state,
  })  : _ref = ref,
        super(state);

  final Ref _ref;
  LocationService get _locationService => _ref.read(providerOfLocationService);

  /// Gets the current location of the user.
  Future<void> getLocation() async {
    if (state.getLocationState == GetLocationState.loading()) {
      return;
    }

    state = state.copyWith(
      getLocationState: GetLocationState.loading(),
    );

    final result = await _locationService.getCurrentLocation();
    if (!mounted) return;

    result.when(
      (success) {
        state = state.copyWith(
          getLocationState: GetLocationState.success(success),
        );
        updateLocation(success);
      },
      (failure) {
        state = state.copyWith(
          getLocationState: GetLocationState.error(failure),
        );
      },
    );
  }

  /// Opens the location settings of the app.
  Future<void> openLocationSettings() {
    return _locationService.openLocationSettings();
  }

  /// Returns `true` if the location permission can be requested.
  Future<bool> canRequestLocationPermission() async {
    final result = await _locationService.canRequestLocationPermission();
    return result.when((success) => success, (_) => false);
  }

  /// Returns `true` if the location permission is granted.
  Future<bool> isLocationPermissionGranted() async {
    final result = await _locationService.isLocationPermissionGranted();
    return result.when((success) => success, (_) => false);
  }

  /// Updates [LocationProviderState.location] with the given [location].
  void updateLocation(final AlrtLocation location) {
    state = state.copyWith(
      location: location,
    );
  }
}
