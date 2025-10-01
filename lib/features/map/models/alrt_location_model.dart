import 'package:freezed_annotation/freezed_annotation.dart';

part 'alrt_location_model.freezed.dart';
part 'alrt_location_model.g.dart';

@freezed
abstract class AlrtLocation with _$AlrtLocation {
  const factory AlrtLocation({
    required final double latitude,
    required final double longitude,
    final String? address,
  }) = _AlrtLocation;

  factory AlrtLocation.fromJson(Map<String, dynamic> json) =>
      _$AlrtLocationFromJson(json);
}
