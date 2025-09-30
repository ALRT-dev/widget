import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hazard_app/features/map/models/location_model.dart';
import 'package:hazard_app/features/map/providers/repository_providers.dart';
import 'package:hazard_app/features/map/repositories/location_repository.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/utils/either.dart';

class LocationService {
  LocationService(final Ref ref) : _ref = ref;

  final Ref _ref;
  LocationRepository get _locationRepository =>
      _ref.read(providerOfLocationRepository);

  /// Returns the current location of the user.
  Future<Either<AlrtLocation, AppError>> getCurrentLocation() {
    return _locationRepository.getCurrentLocation();
  }

  /// Returns the address from the latitude and longitude.
  Future<Either<String, AppError>> getAddressFromLatLng({
    required final double latitude,
    required final double longitude,
  }) {
    return _locationRepository.getAddressFromLatLng(
      latitude: latitude,
      longitude: longitude,
    );
  }

  /// Returns true if the location permission is granted.
  Future<Either<bool, AppError>> isLocationPermissionGranted() {
    return _locationRepository.isLocationPermissionGranted();
  }

  /// Returns true if the location permission can be requested.
  Future<Either<bool, AppError>> canRequestLocationPermission() {
    return _locationRepository.canRequestLocationPermission();
  }

  /// Opens the location settings.
  Future<Either<void, AppError>> openLocationSettings() {
    return _locationRepository.openLocationSettings();
  }
}
