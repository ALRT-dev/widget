import 'package:freezed_annotation/freezed_annotation.dart';

part 'hazard_source_model.freezed.dart';
part 'hazard_source_model.g.dart';

@freezed
abstract class HazardSource with _$HazardSource {
  const factory HazardSource({
    /// The unique identifier for the hazard source.
    required final String id,

    /// The name of the hazard source.
    final String? name,

    /// The URL associated with the hazard source.
    final String? url,
  }) = _HazardSource;

  factory HazardSource.fromJson(Map<String, dynamic> json) =>
      _$HazardSourceFromJson(json);
}
