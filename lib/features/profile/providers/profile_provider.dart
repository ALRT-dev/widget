import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:hazard_app/features/auth/providers/service_providers.dart';
import 'package:hazard_app/features/auth/services/auth_service.dart';
import 'package:hazard_app/features/profile/providers/states/profile_provider_state.dart';
import 'package:hazard_app/features/shared/providers/logged_in_user_provider.dart';
import 'package:hazard_app/features/shared/providers/user_socket_manager_provider.dart';

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
    _listenToSocketEvents();
  }

  final Ref _ref;
  AuthService get _authService => _ref.read(providerOfAuthService);
  UserSocketManager get _userSocketManager =>
      _ref.read(providerOfUserSocketManager);

  // Only fetch 3 items for preview.
  final pageSize = 3;

  /// Listens to socket events and updates the logged-in user accordingly.
  void _listenToSocketEvents() {
    final xpUpdatesListener = _userSocketManager.userXpUpdateStream.listen(
      (xpPoints) {
        _ref
            .read(providerOfLoggedInUser.notifier)
            .update((user) => user?.copyWith(xpPoints: xpPoints));
      },
    );

    final reliabilityUpdatesListener = _userSocketManager
        .userReliabilityUpdateStream
        .listen(
          (reliabilityScore) {
            _ref
                .read(providerOfLoggedInUser.notifier)
                .update(
                  (user) => user?.copyWith(reliabilityScore: reliabilityScore),
                );
          },
        );

    final upvotesReceivedCountListener = _userSocketManager
        .userUpvotesReceivedCountUpdateStream
        .listen(
          (upvotesReceivedCount) {
            _ref
                .read(providerOfLoggedInUser.notifier)
                .update(
                  (user) => user?.copyWith(
                    upvotesReceivedCount: upvotesReceivedCount,
                  ),
                );
          },
        );

    // Cancel the subscriptions when the provider is disposed.
    _ref.onDispose(() {
      xpUpdatesListener.cancel();
      reliabilityUpdatesListener.cancel();
      upvotesReceivedCountListener.cancel();
    });
  }

  /// Logout the current user.
  Future<void> logout() async {
    state = state.copyWith(
      logoutState: const LogoutState.loading(),
    );

    final result = await _authService.logout();
    if (!mounted) return;

    result.when(
      (_) {
        state = state.copyWith(
          logoutState: const LogoutState.success(),
        );
      },
      (error) {
        state = state.copyWith(
          logoutState: LogoutState.error(error),
        );
      },
    );
  }
}
