import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hazard_app/features/shared/enums/hazard_severity_band_types.dart';
import 'package:hazard_app/features/shared/enums/hazard_severity_system_types.dart';
import 'package:hazard_app/features/shared/enums/hazard_source_shape_types.dart';
import 'package:hazard_app/features/shared/enums/severity_level_handling_types.dart';
import 'package:hazard_app/features/shared/enums/source_push_policy_types.dart';
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

    /// The marker shape for this source's alerts in the "One Glance" model.
    ///
    /// User reports always render as a circle regardless of this value — see
    /// `Hazard.resolvedShape`.
    final HazardSourceShape? shape,

    /// The severity vocabulary this source speaks (AWS level / band / category /
    /// GDACS colour / advisory).
    final HazardSeveritySystem? severitySystem,

    /// How this source's severity word/level is rendered (verbatim vs
    /// band-colour-only vs category vs level-exempt).
    final SeverityLevelHandling? levelHandling,

    /// Minutes a marker lingers after the underlying alert clears. Null uses the
    /// default lifecycle.
    final int? stickiness,

    /// The ceiling on the internal band for this source (e.g. community caps at
    /// [HazardSeverityBand.action]). Null means no cap.
    final HazardSeverityBand? maxInternalBand,

    /// When alerts from this source generate a push notification.
    final SourcePushPolicy? pushPolicy,
  }) = _HazardSource;

  factory HazardSource.fromJson(Map<String, dynamic> json) =>
      _$HazardSourceFromJson(json);
}
