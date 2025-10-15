import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hazard_app/features/shared/enums/socket_event_types.dart';
import 'package:hazard_app/features/shared/models/app_user_model.dart';
import 'package:hazard_app/features/shared/providers/service_providers.dart';
import 'package:hazard_app/features/shared/services/socket_service.dart';

final providerOfUserSocketManager = Provider<UserSocketManager>(
  (ref) => UserSocketManager(ref: ref),
);

/// A global notifier that listens to all user socket events and broadcasts them
/// to any interested parties via separate streams. This solves the issue where multiple
/// providers were conflicting with each other's socket listeners.
class UserSocketManager {
  UserSocketManager({required Ref ref}) : _ref = ref {
    _setupSocketListeners();
  }

  final Ref _ref;

  final StreamController<AppUser> _userUpdateStreamController =
      StreamController<AppUser>.broadcast();
  final StreamController<int> _userXpUpdateStreamController =
      StreamController<int>.broadcast();
  final StreamController<double> _userReliabilityUpdateStreamController =
      StreamController<double>.broadcast();
  final StreamController<int> _userUpvotesReceivedCountUpdateStreamController =
      StreamController<int>.broadcast();

  SocketService get _socketService => _ref.read(providerOfSocketService);

  /// Stream that broadcasts user updates to all listeners
  Stream<AppUser> get userUpdateStream => _userUpdateStreamController.stream;

  /// Stream that broadcasts user XP updates to all listeners
  Stream<int> get userXpUpdateStream => _userXpUpdateStreamController.stream;

  /// Stream that broadcasts user reliability updates to all listeners
  Stream<double> get userReliabilityUpdateStream =>
      _userReliabilityUpdateStreamController.stream;

  /// Stream that broadcasts user upvotes received count updates to all listeners
  Stream<int> get userUpvotesReceivedCountUpdateStream =>
      _userUpvotesReceivedCountUpdateStreamController.stream;

  /// Sets up socket listeners for all user events.
  /// This is the single point where we listen to all user socket events.
  void _setupSocketListeners() {
    _socketService.listenToEvent(
      SocketEvent.updateUser,
      (data) {
        if (data is Map<String, dynamic>) {
          final updatedUser = AppUser.fromJson(data);
          _userUpdateStreamController.add(updatedUser);
        }
      },
    );

    _socketService.listenToEvent(
      SocketEvent.updateUserXp,
      (data) {
        if (data is Map<String, dynamic>) {
          final xpPoints = data['xpPoints'] as int?;
          final reliabilityScore = data['reliabilityScore'] as double?;

          if (xpPoints != null) {
            _userXpUpdateStreamController.add(xpPoints);
          }
          if (reliabilityScore != null) {
            _userReliabilityUpdateStreamController.add(reliabilityScore);
          }
        }
      },
    );

    _socketService.listenToEvent(
      SocketEvent.updateUserUpvotesReceivedCount,
      (data) {
        if (data is Map<String, dynamic>) {
          final upvotesReceivedCount = data['upvotesReceivedCount'] as int?;

          if (upvotesReceivedCount != null) {
            _userUpvotesReceivedCountUpdateStreamController.add(
              upvotesReceivedCount,
            );
          }
        }
      },
    );
  }

  /// Disposes of all stream controllers when no longer needed
  void dispose() {
    _userUpdateStreamController.close();
    _userXpUpdateStreamController.close();
    _userUpvotesReceivedCountUpdateStreamController.close();
  }
}
