import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_subscription_model.freezed.dart';
part 'location_subscription_model.g.dart';

@freezed
abstract class LocationSubscription with _$LocationSubscription {
  const factory LocationSubscription({
    required final String id,
    required final double northeastLat,
    required final double northeastLng,
    required final double southwestLat,
    required final double southwestLng,
    final String? name,
    final String? address,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _LocationSubscription;

  factory LocationSubscription.fromJson(Map<String, dynamic> json) =>
      _$LocationSubscriptionFromJson(json);
}
