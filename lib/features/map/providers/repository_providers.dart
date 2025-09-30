import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hazard_app/features/map/repositories/location_repository.dart';
import 'package:hazard_app/features/map/repositories/map_repository.dart';

/// Provider of [MapRepository].
final providerOfMapRepository =
    Provider.family<MapRepository, GoogleMapController>(
  (ref, googleMapController) => MapRepositoryImpl(
    googleMapController: googleMapController,
  ),
);

/// Provider of [LocationRepository].
final providerOfLocationRepository = Provider<LocationRepository>(
  (ref) => LocationRepositoryImpl(),
);
