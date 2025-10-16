import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hazard_app/features/shared/models/alrt_media_model.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';

part 'create_update_report_provider_state.freezed.dart';

@freezed
abstract class CreateUpdateReportProviderState
    with _$CreateUpdateReportProviderState {
  const factory CreateUpdateReportProviderState({
    /// The hazard to create or update.
    @Default(Hazard()) final Hazard hazardToCreateOrUpdate,

    /// The list of media associated with the hazard report.
    @Default(<AlrtMedia>[]) final List<AlrtMedia> medias,

    /// Whether the report has been submitted.
    @Default(false) final bool reportSubmitted,

    /// The list of [CreatingUpdatingHazardReport.id]s that have been acknowledged.
    ///
    /// i.e A success or error toast has been shown for these reports.
    @Default(<String>[]) final List<String> acknowledgedReportIds,

    /// The the state of creating or updating hazard reports.
    @Default(<CreatingUpdatingHazardReport>[])
    final List<CreatingUpdatingHazardReport> creatingUpdatingHazardReports,
  }) = _CreateUpdateReportProviderState;
}

@freezed
abstract class CreatingUpdatingHazardReport
    with _$CreatingUpdatingHazardReport {
  const factory CreatingUpdatingHazardReport({
    required final String id,
    required final Hazard hazard,
    required final CreatingUpdatingHazardReportState state,
  }) = _CreatingUpdatingHazardReport;
}

@freezed
class CreatingUpdatingHazardReportState
    with _$CreatingUpdatingHazardReportState {
  const factory CreatingUpdatingHazardReportState.initial() =
      _CreatingUpdatingHazardReportStateInitial;
  const factory CreatingUpdatingHazardReportState.loading() =
      _CreatingUpdatingHazardReportStateLoading;
  const factory CreatingUpdatingHazardReportState.success(
    final Hazard hazard,
  ) = _CreatingUpdatingHazardReportStateSuccess;
  const factory CreatingUpdatingHazardReportState.error(final AppError error) =
      _CreatingUpdatingHazardReportStateFailure;
}
