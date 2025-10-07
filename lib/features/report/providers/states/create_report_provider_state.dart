import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hazard_app/features/map/models/alrt_location_model.dart';
import 'package:hazard_app/features/shared/models/alrt_media_model.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';

part 'create_report_provider_state.freezed.dart';

@freezed
abstract class CreateReportProviderState with _$CreateReportProviderState {
  const factory CreateReportProviderState({
    /// The date and time of the hazard.
    final DateTime? dateTime,

    /// The selected category of the hazard.
    final HazardCategory? category,

    /// The name of the new category if [category] represents "Other" category.
    ///
    /// This field is required if [category] represents "Other" category.
    /// Otherwise, it will be ignored.
    final String? otherCategoryName,

    /// The location of the hazard.
    final AlrtLocation? location,

    /// The description of the hazard.
    final String? description,

    /// The list of media associated with the hazard report.
    @Default(<AlrtMedia>[]) final List<AlrtMedia> medias,
  }) = _CreateReportProviderState;
}
