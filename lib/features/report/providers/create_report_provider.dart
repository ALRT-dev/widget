import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:hazard_app/features/map/models/alrt_location_model.dart';
import 'package:hazard_app/features/report/providers/states/create_report_provider_state.dart';
import 'package:hazard_app/features/shared/models/alrt_media_model.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';
import 'package:hazard_app/features/shared/providers/repository_providers.dart';
import 'package:hazard_app/features/shared/repositories/media_repository.dart';

final providerOfCreateReport = StateNotifierProvider.autoDispose<
    CreateReportProvider, CreateReportProviderState>(
  (ref) => CreateReportProvider(
    ref: ref,
    state: const CreateReportProviderState(),
  ),
);

class CreateReportProvider extends StateNotifier<CreateReportProviderState> {
  CreateReportProvider({
    required final Ref ref,
    required final CreateReportProviderState state,
  })  : _ref = ref,
        super(state);

  final Ref _ref;
  MediaRepository get _mediaRepository => _ref.read(providerOfMediaRepository);

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
}
