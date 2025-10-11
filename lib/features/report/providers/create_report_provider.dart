import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:hazard_app/features/map/models/alrt_location_model.dart';
import 'package:hazard_app/features/report/providers/states/create_report_provider_state.dart';
import 'package:hazard_app/features/shared/models/alrt_media_model.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';
import 'package:hazard_app/features/shared/providers/repository_providers.dart';
import 'package:hazard_app/features/shared/providers/service_providers.dart';
import 'package:hazard_app/features/shared/repositories/media_repository.dart';
import 'package:hazard_app/features/shared/services/hazard_service.dart';
import 'package:uuid/uuid.dart';

final providerOfCreateReport =
    StateNotifierProvider.autoDispose<
      CreateReportProvider,
      CreateReportProviderState
    >(
      (ref) => CreateReportProvider(
        ref: ref,
        state: const CreateReportProviderState(),
      ),
    );

class CreateReportProvider extends StateNotifier<CreateReportProviderState> {
  CreateReportProvider({
    required final Ref ref,
    required final CreateReportProviderState state,
  }) : _ref = ref,
       super(state);

  final Ref _ref;
  MediaRepository get _mediaRepository => _ref.read(providerOfMediaRepository);
  HazardService get _hazardService => _ref.read(providerOfHazardService);

  /// Creates a new hazard report using the data in the current state.
  Future<void> createReport() async {
    final hazard = Hazard(
      title:
          '${state.category?.name ?? 'Unknown'} Hazard at ${state.location?.name ?? 'Unknown Location'}',
      occuredAt: state.dateTime,
      categoryId: state.category!.id,
      latitude: state.location?.latitude,
      longitude: state.location?.longitude,
      description: state.description,
    );

    final creatingHazardReport = CreatingHazardReport(
      id: Uuid().v4(),
      hazard: hazard,
      state: CreatingHazardReportState.loading(),
    );
    addCreatingHazardReport(creatingHazardReport);

    final result = await _hazardService.createHazardReport(
      hazard: hazard,
    );
    if (!mounted) return;

    result.when(
      (hazard) {
        updateCreatingHazardReport(
          creatingHazardReport.copyWith(
            hazard: hazard,
            state: CreatingHazardReportState.success(hazard),
          ),
        );
      },
      (error) {
        updateCreatingHazardReport(
          creatingHazardReport.copyWith(
            state: CreatingHazardReportState.error(error),
          ),
        );
      },
    );
  }

  /// Picks multiple images from the gallery and adds them to [CreateReportProviderState.medias].
  Future<void> pickMedias() async {
    final result = await _mediaRepository.pickMedias();
    if (!mounted) return;

    result.whenSuccess(
      (medias) => updateMedias(
        [...state.medias, ...medias],
      ),
    );
  }

  /// Updates [CreateReportProviderState.dateTime] with the given [dateTime].
  void updateDateTime(final DateTime dateTime) {
    state = state.copyWith(dateTime: dateTime);
  }

  /// Updates [CreateReportProviderState.category] with the given [category].
  void updateCategory(final HazardCategory category) {
    state = state.copyWith(category: category);
  }

  /// Updates [CreateReportProviderState.otherCategoryName] with the given [otherCategoryName].
  void updateCategoryName(final String otherCategoryName) {
    state = state.copyWith(otherCategoryName: otherCategoryName);
  }

  /// Updates [CreateReportProviderState.location] with the given [location].
  void updateLocation(final AlrtLocation location) {
    state = state.copyWith(location: location);
  }

  /// Updates [CreateReportProviderState.description] with the given [description].
  void updateDescription(final String description) {
    state = state.copyWith(description: description);
  }

  /// Updates [CreateReportProviderState.medias] with the given list of [medias].
  void updateMedias(final List<AlrtMedia> medias) {
    state = state.copyWith(medias: medias);
  }

  /// Removes a media from [CreateReportProviderState.medias] with the given [mediaId].
  void removeMedia(final String mediaId) {
    updateMedias(
      state.medias.where((media) => media.id != mediaId).toList(),
    );
  }

  /// Updates [CreateReportProviderState.creatingHazardReports] with the given [creatingHazardReports].
  void updateCreatingHazardReports(
    final List<CreatingHazardReport> creatingHazardReports,
  ) {
    state = state.copyWith(creatingHazardReports: creatingHazardReports);
  }

  /// Adds a new [CreatingHazardReport] to [CreateReportProviderState.creatingHazardReports].
  void addCreatingHazardReport(
    final CreatingHazardReport creatingHazardReport,
  ) {
    updateCreatingHazardReports(
      [...state.creatingHazardReports, creatingHazardReport],
    );
  }

  /// Updates a [CreatingHazardReport] in [CreateReportProviderState.creatingHazardReports].
  void updateCreatingHazardReport(
    final CreatingHazardReport creatingHazardReport,
  ) {
    updateCreatingHazardReports(
      state.creatingHazardReports.map((chr) {
        if (chr.id == creatingHazardReport.id) {
          return creatingHazardReport;
        }
        return chr;
      }).toList(),
    );
  }

  /// Resets all fields in the state to their initial values.
  void resetAllFields() {
    state = state.copyWith(
      dateTime: null,
      category: null,
      otherCategoryName: null,
      location: null,
      description: null,
      medias: [],
    );
  }

  /// Updates [CreateReportProviderState.acknowledgedReportIds] with the given list of [acknowledgedReportIds].
  void updateAcknowledgedReportIds(final List<String> acknowledgedReportIds) {
    state = state.copyWith(acknowledgedReportIds: acknowledgedReportIds);
  }

  /// Adds a new report ID to [CreateReportProviderState.acknowledgedReportIds].
  void addToAcknowledgedReportId(final String reportId) {
    updateAcknowledgedReportIds(
      [...state.acknowledgedReportIds, reportId],
    );
  }
}
