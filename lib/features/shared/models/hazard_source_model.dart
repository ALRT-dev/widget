import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hazard_app/features/shared/models/hazard_source_license_model.dart';

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

    /// The license information for the hazard source.
    final HazardSourceLicense? license,

    /// The copyright information for the hazard source.
    final String? copyrightText,

    /// The link to the copyright information for the hazard source.
    final String? copyrightLink,

    /// The advisory text provided by the hazard source.
    final String? advisoryText,
  }) = _HazardSource;

  factory HazardSource.fromJson(Map<String, dynamic> json) =>
      _$HazardSourceFromJson(json);
}
