import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/utils/async_call_helper.dart';
import 'package:hazard_app/features/shared/utils/either.dart';

abstract class MapRepository {
  Future<Either<void, AppError>> animateCamera({
    required final CameraUpdate cameraUpdate,
    final Duration? duration,
  });
}

class MapRepositoryImpl implements MapRepository {
  const MapRepositoryImpl({
    required GoogleMapController googleMapController,
  }) : _googleMapController = googleMapController;

  final GoogleMapController _googleMapController;

  @override
  Future<Either<void, AppError>> animateCamera({
    required CameraUpdate cameraUpdate,
    Duration? duration,
  }) {
    return runAsyncCall(
      name: 'animateCamera',
      future: () async {
        await _googleMapController.animateCamera(
          cameraUpdate,
          duration: duration,
        );
        return Success(null);
      },
      onError: Failure.new,
    );
  }
}
