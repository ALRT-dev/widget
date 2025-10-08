import 'package:freezed_annotation/freezed_annotation.dart';

part 'google_place_model.freezed.dart';
part 'google_place_model.g.dart';

@freezed
abstract class GooglePlace with _$GooglePlace {
  const factory GooglePlace({
    @JsonKey(name: 'place_id') required final String placeId,
    required final String description,
    required final double latitude,
    required final double longitude,
    required final String name,
    required final String address,
  }) = _GooglePlace;

  factory GooglePlace.fromJson(Map<String, dynamic> json) =>
      _$GooglePlaceFromJson(json);
}
