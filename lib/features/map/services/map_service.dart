import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hazard_app/features/map/providers/repository_providers.dart';
import 'package:hazard_app/features/map/repositories/map_repository.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/utils/either.dart';

class MapService {
  MapService(final Ref ref) : _ref = ref;

  final Ref _ref;
  GoogleMapController? _googleMapController;

  MapRepository get _mapRepository {
    if (_googleMapController == null) {
      throw Exception('GoogleMapController is not initialized');
    }
    return _ref.read(providerOfMapRepository(_googleMapController!));
  }

  /// Initializes the map controller.
  void initializeMapController({
    required final GoogleMapController googleMapController,
  }) {
    _googleMapController = googleMapController;
  }

  /// Animates the camera to the given [cameraUpdate] with an optional [duration].
  Future<Either<void, AppError>> animateCamera({
    required final CameraUpdate cameraUpdate,
    final Duration? duration,
  }) async {
    final result = await _mapRepository.animateCamera(
      cameraUpdate: cameraUpdate,
      duration: duration,
    );
    return result;
  }
}
