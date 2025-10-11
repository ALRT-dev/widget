import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hazard_app/features/map/models/alrt_location_model.dart';
import 'package:hazard_app/features/shared/models/alrt_media_model.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';

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

    /// The list of [CreatingHazardReport.id]s that have been acknowledged.
    ///
    /// i.e A success or error toast has been shown for these reports.
    @Default(<String>[]) final List<String> acknowledgedReportIds,

    /// The the state of creating the hazard report.
    @Default(<CreatingHazardReport>[])
    final List<CreatingHazardReport> creatingHazardReports,
  }) = _CreateReportProviderState;
}

@freezed
abstract class CreatingHazardReport with _$CreatingHazardReport {
  const factory CreatingHazardReport({
    required final String id,
    required final Hazard hazard,
    required final CreatingHazardReportState state,
  }) = _CreatingHazardReport;
}

@freezed
class CreatingHazardReportState with _$CreatingHazardReportState {
  const factory CreatingHazardReportState.initial() =
      _CreatingHazardReportStateInitial;
  const factory CreatingHazardReportState.loading() =
      _CreatingHazardReportStateLoading;
  const factory CreatingHazardReportState.success(
    final Hazard hazard,
  ) = _CreatingHazardReportStateSuccess;
  const factory CreatingHazardReportState.error(final AppError error) =
      _CreatingHazardReportStateFailure;
}
