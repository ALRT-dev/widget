import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'alrt_location_model.freezed.dart';
part 'alrt_location_model.g.dart';

@freezed
abstract class AlrtLocation with _$AlrtLocation {
  const AlrtLocation._();

  const factory AlrtLocation({
    required final double latitude,
    required final double longitude,
    final String? address,
    final String? name,
  }) = _AlrtLocation;

  LatLng get latLng => LatLng(latitude, longitude);

  factory AlrtLocation.fromJson(Map<String, dynamic> json) =>
      _$AlrtLocationFromJson(json);
}
