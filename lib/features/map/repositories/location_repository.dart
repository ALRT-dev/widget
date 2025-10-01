import 'package:app_settings/app_settings.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hazard_app/features/map/models/alrt_location_model.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/utils/async_call_helper.dart';
import 'package:hazard_app/features/shared/utils/either.dart';
import 'package:hazard_app/features/shared/utils/error_codes.dart';

abstract class LocationRepository {
  /// Returns the current location of the user.
  Future<Either<AlrtLocation, AppError>> getCurrentLocation();

  /// Returns the address from the latitude and longitude.
  Future<Either<String, AppError>> getAddressFromLatLng({
    required final double latitude,
    required final double longitude,
  });

  /// Returns true if the location permission is granted.
  Future<Either<bool, AppError>> isLocationPermissionGranted();

  /// Returns true if the location permission can be requested.
  Future<Either<bool, AppError>> canRequestLocationPermission();

  /// Opens the location settings.
  Future<Either<void, AppError>> openLocationSettings();
}

class LocationRepositoryImpl extends LocationRepository {
  @override
  Future<Either<AlrtLocation, AppError>> getCurrentLocation() {
    return runAsyncCall(
      name: 'getCurrentLocation',
      future: () async {
        // check if location services are enabled
        final isLocationServiceEnabled =
            await Geolocator.isLocationServiceEnabled();
        if (!isLocationServiceEnabled) {
          throw AppError(
            code: ksLocationErrorServiceDisabled,
            message: 'Location services are disabled.',
          );
        }

        // check if location permission is granted
        var locationPermission = await Geolocator.checkPermission();

        if (locationPermission == LocationPermission.denied) {
          locationPermission = await Geolocator.requestPermission();
          if (locationPermission == LocationPermission.denied) {
            throw AppError(
              code: ksLocationErrorPermissionDenied,
              message: 'Location permissions are denied.',
            );
          }
        }
        if (locationPermission == LocationPermission.deniedForever) {
          throw AppError(
            code: ksLocationErrorPermissionDeniedForever,
            message:
                'Location permissions are permanently denied, we cannot request permissions.',
          );
        }

        // get current location
        final position = await Geolocator.getCurrentPosition(
          locationSettings: LocationSettings(
            timeLimit: const Duration(milliseconds: 5000),
          ),
        );

        final placemarks = await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        );

        String? address;
        if (placemarks.isNotEmpty) {
          final place = placemarks.first;
          final addresses = [
            if (place.street?.isNotEmpty ?? false) place.street,
            if (place.locality?.isNotEmpty ?? false) place.locality,
            if (place.administrativeArea?.isNotEmpty ?? false)
              place.administrativeArea,
            if (place.country?.isNotEmpty ?? false) place.country,
          ];
          address = addresses.join(', ');
        }

        final alpLocation = AlrtLocation(
          latitude: position.latitude,
          longitude: position.longitude,
          address: address,
        );

        return Success(alpLocation);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<bool, AppError>> isLocationPermissionGranted() {
    return runAsyncCall(
      name: 'isLocationPermissionGranted',
      future: () async {
        final locationPermission = await Geolocator.checkPermission();
        final isGranted = locationPermission == LocationPermission.always ||
            locationPermission == LocationPermission.whileInUse;

        return Success(isGranted);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<bool, AppError>> canRequestLocationPermission() {
    return runAsyncCall(
      name: 'canRequestPermission',
      future: () async {
        final locationPermission = await Geolocator.checkPermission();
        final canRequest =
            locationPermission == LocationPermission.unableToDetermine ||
                locationPermission == LocationPermission.denied;

        return Success(canRequest);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<void, AppError>> openLocationSettings() {
    return runAsyncCall(
      name: 'openLocationSettings',
      future: () async {
        await AppSettings.openAppSettings(
          type: AppSettingsType.location,
        );
        return Success(null);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<String, AppError>> getAddressFromLatLng({
    required double latitude,
    required double longitude,
  }) {
    return runAsyncCall(
      name: 'getAddress',
      future: () async {
        final placemarks = await placemarkFromCoordinates(
          latitude,
          longitude,
        );

        String? address;
        if (placemarks.isNotEmpty) {
          final place = placemarks.first;
          final addresses = [
            // if (place.street?.isNotEmpty ?? false) place.street,
            // if (place.locality?.isNotEmpty ?? false) place.locality,
            if (place.administrativeArea?.isNotEmpty ?? false)
              place.administrativeArea,
            if (place.country?.isNotEmpty ?? false) place.country,
          ];
          address = addresses.join(', ');
        }

        if (address == null) {
          throw AppError(
            message: 'Could not get the address from lat/lng',
          );
        }

        return Success(address);
      },
      onError: Failure.new,
    );
  }
}
