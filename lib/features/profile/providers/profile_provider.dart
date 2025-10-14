import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:hazard_app/features/profile/providers/states/profile_provider_state.dart';
import 'package:hazard_app/features/search/models/hazard_search_params.dart';
import 'package:hazard_app/features/shared/enums/hazard_review_status_types.dart';
import 'package:hazard_app/features/shared/models/app_user_model.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';
import 'package:hazard_app/features/shared/providers/logged_in_user_provider.dart';
import 'package:hazard_app/features/shared/providers/service_providers.dart';
import 'package:hazard_app/features/shared/services/hazard_service.dart';

final providerOfProfile =
    StateNotifierProvider.autoDispose<ProfileProvider, ProfileProviderState>(
      (ref) => ProfileProvider(
        ref: ref,
        state: const ProfileProviderState(),
      ),
    );

class ProfileProvider extends StateNotifier<ProfileProviderState> {
  ProfileProvider({
    required final Ref ref,
    required final ProfileProviderState state,
  }) : _ref = ref,
       super(state) {
    getMyAcceptedHazards();
    getMyRejectedHazards();
  }

  final Ref _ref;
  HazardService get _hazardService => _ref.read(providerOfHazardService);
  AppUser? get _loggedInUser => _ref.read(providerOfLoggedInUser);

  // Only fetch 3 items for preview.
  final pageSize = 3;

  /// Fetches hazards reported by the logged-in user that have been accepted.
  Future<void> getMyAcceptedHazards() async {
    if (_loggedInUser?.id == null) return;

    state = state.copyWith(
      getMyAcceptedHazardsState: const GetMyHazardsState.loading(),
    );

    final result = await _hazardService.getHazards(
      searchParams: HazardSearchParams(
        reportedById: _loggedInUser!.id,
        reviewStatus: HazardReviewStatus.accepted,
        pageSize: pageSize,
      ),
    );
    if (!mounted) return;

    result.when(
      (hazards) {
        state = state.copyWith(
          myAcceptedHazards: hazards,
          getMyAcceptedHazardsState: GetMyHazardsState.success(
            hazards,
          ),
        );
      },
      (error) {
        state = state.copyWith(
          getMyAcceptedHazardsState: GetMyHazardsState.error(
            error,
          ),
        );
      },
    );
  }

  /// Fetches hazards reported by the logged-in user that have been rejected.
  Future<void> getMyRejectedHazards() async {
    if (_loggedInUser == null) return;

    state = state.copyWith(
      getMyRejectedHazardsState: const GetMyHazardsState.loading(),
    );

    final result = await _hazardService.getHazards(
      searchParams: HazardSearchParams(
        reportedById: _loggedInUser!.id,
        reviewStatus: HazardReviewStatus.rejected,
        pageSize: pageSize,
      ),
    );
    if (!mounted) return;

    result.when(
      (hazards) {
        state = state.copyWith(
          myRejectedHazards: hazards,
          getMyRejectedHazardsState: GetMyHazardsState.success(
            hazards,
          ),
        );
      },
      (error) {
        state = state.copyWith(
          getMyRejectedHazardsState: GetMyHazardsState.error(
            error,
          ),
        );
      },
    );
  }

  /// Updates [ProfileProviderState.myAcceptedHazards] with the given [hazards].
  void updateMyAcceptedHazards(final List<Hazard> hazards) {
    state = state.copyWith(
      myAcceptedHazards: hazards.sublist(
        0,
        min(hazards.length, pageSize),
      ),
    );
  }

  /// Adds a hazard to [ProfileProviderState.myAcceptedHazards].
  void addToMyAcceptedHazards(final Hazard hazard) {
    final updatedHazards = List<Hazard>.from(state.myAcceptedHazards)
      ..insert(0, hazard);
    updateMyAcceptedHazards(updatedHazards);
  }

  /// Removes a hazard from [ProfileProviderState.myAcceptedHazards] by its [hazardId].
  void removeFromMyAcceptedHazards(final String hazardId) {
    final updatedHazards = state.myAcceptedHazards
        .where((hazard) => hazard.id != hazardId)
        .toList();
    updateMyAcceptedHazards(updatedHazards);
  }

  /// Updates [ProfileProviderState.myRejectedHazards] with the given [hazards].
  void updateMyRejectedHazards(final List<Hazard> hazards) {
    state = state.copyWith(
      myRejectedHazards: hazards.sublist(
        0,
        min(hazards.length, pageSize),
      ),
    );
  }

  /// Adds a hazard to [ProfileProviderState.myRejectedHazards].
  void addToMyRejectedHazards(final Hazard hazard) {
    final updatedHazards = List<Hazard>.from(state.myRejectedHazards)
      ..insert(0, hazard);
    updateMyRejectedHazards(updatedHazards);
  }

  /// Removes a hazard from [ProfileProviderState.myRejectedHazards] by its [hazardId].
  void removeFromMyRejectedHazards(final String hazardId) {
    final updatedHazards = state.myRejectedHazards
        .where((hazard) => hazard.id != hazardId)
        .toList();
    updateMyRejectedHazards(updatedHazards);
  }
}
