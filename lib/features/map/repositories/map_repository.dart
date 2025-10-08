import 'package:dio/dio.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hazard_app/features/map/models/alrt_location_model.dart';
import 'package:hazard_app/features/map/models/google_place_model.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/utils/async_call_helper.dart';
import 'package:hazard_app/features/shared/utils/either.dart';
import 'package:hazard_app/others/env.dart';

abstract class MapRepository {
  Future<Either<void, AppError>> animateCamera({
    required final CameraUpdate cameraUpdate,
    final Duration? duration,
  });

  Future<Either<List<GooglePlace>, AppError>> getPlaces({
    required final String searchString,
    required final AlrtLocation currentUserLocation,
  });

  Future<Either<void, AppError>> getPlaceDetails({
    required final String placeId,
  });

  Future<Either<RoutesApiResponse, AppError>> getRoute({
    required final LatLng origin,
    required final LatLng destination,
  });
}

class MapRepositoryImpl implements MapRepository {
  const MapRepositoryImpl({
    required GoogleMapController googleMapController,
    required Dio dio,
    required PolylinePoints polylinePoints,
  })  : _googleMapController = googleMapController,
        _dio = dio,
        _polylinePoints = polylinePoints;

  final GoogleMapController _googleMapController;
  final Dio _dio;
  final PolylinePoints _polylinePoints;

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

  @override
  Future<Either<List<GooglePlace>, AppError>> getPlaces({
    required String searchString,
    required AlrtLocation currentUserLocation,
  }) {
    return runAsyncCall(
      name: 'getPlaces',
      future: () async {
        final result = await _dio.get(
          'https://maps.googleapis.com/maps/api/place/autocomplete/json',
          queryParameters: {
            'input': searchString,
            'key': Env.googleMapsApiKey,
            'locationbias':
                'circle:50000@${currentUserLocation.latitude},${currentUserLocation.longitude}',
          },
        ).then((response) async {
          final predictions = response.data['predictions'];
          if (predictions == null || predictions is! List) {
            return <Map<String, dynamic>>[];
          }

          final futures = <Future<Map<String, dynamic>>>[];

          for (final prediction in predictions) {
            if (prediction is Map<String, dynamic> &&
                prediction.containsKey('place_id')) {
              final data = {
                'place_id': prediction['place_id'],
                'description': prediction['description'],
              };
              final future = getPlaceDetails(
                placeId: prediction['place_id'],
              ).then(
                (value) => value.when(
                  (details) => {
                    ...data,
                    'latitude': details['geometry']['location']['lat'],
                    'longitude': details['geometry']['location']['lng'],
                    'name': details['name'],
                    'address': details['formatted_address'],
                  },
                  (error) => data,
                ),
              );
              futures.add(future);
            }
          }

          return Future.wait(futures);
        });
        final places = result.map((e) => GooglePlace.fromJson(e)).toList();
        return Success(places);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<Map<String, dynamic>, AppError>> getPlaceDetails({
    required String placeId,
  }) {
    return runAsyncCall(
      name: 'getPlaceDetails',
      future: () async {
        final response = await _dio.get(
          'https://maps.googleapis.com/maps/api/place/details/json',
          queryParameters: {
            'place_id': placeId,
            'key': Env.googleMapsApiKey,
            'fields': 'geometry,formatted_address,name',
          },
        );

        if (response.data['status'] != 'OK' ||
            response.data['result'] == null ||
            response.data['result'] is! Map<String, dynamic>) {
          throw AppError(
            message: response.data['error_message'] ??
                'Failed to fetch place details',
          );
        }

        return Success(
          response.data['result'] as Map<String, dynamic>,
        );
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<RoutesApiResponse, AppError>> getRoute({
    required LatLng origin,
    required LatLng destination,
  }) {
    return runAsyncCall(
      name: 'getRoute',
      future: () async {
        final request = RoutesApiRequest(
          origin: PointLatLng(origin.latitude, origin.longitude),
          destination: PointLatLng(destination.latitude, destination.longitude),
          travelMode: TravelMode.driving,
          routingPreference: RoutingPreference.trafficAware,
          polylineQuality: PolylineQuality.overview,
        );

        final result = await _polylinePoints.getRouteBetweenCoordinatesV2(
          request: request,
        );

        return Success(result);
      },
      onError: Failure.new,
    );
  }
}
