import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hazard_app/features/shared/enums/socket_event_types.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';
import 'package:hazard_app/features/shared/providers/service_providers.dart';
import 'package:hazard_app/features/shared/services/socket_service.dart';

final providerOfHazardSocketManager = Provider<HazardSocketManager>(
  (ref) => HazardSocketManager(ref: ref),
);

/// A global notifier that listens to all hazard socket events and broadcasts them
/// to any interested parties via separate streams. This solves the issue where multiple
/// providers were conflicting with each other's socket listeners.
class HazardSocketManager {
  HazardSocketManager({required Ref ref}) : _ref = ref {
    _setupSocketListeners();
  }

  final Ref _ref;

  final StreamController<Hazard> _updateHazardStreamController =
      StreamController<Hazard>.broadcast();
  final StreamController<Hazard> _newHazardStreamController =
      StreamController<Hazard>.broadcast();
  final StreamController<String> _deleteHazardStreamController =
      StreamController<String>.broadcast();

  SocketService get _socketService => _ref.read(providerOfSocketService);

  /// Stream that broadcasts hazard updates to all listeners
  Stream<Hazard> get updateHazardStream => _updateHazardStreamController.stream;

  /// Stream that broadcasts new hazards to all listeners
  Stream<Hazard> get newHazardStream => _newHazardStreamController.stream;

  /// Stream that broadcasts hazard deletions (hazard IDs) to all listeners
  Stream<String> get deleteHazardStream => _deleteHazardStreamController.stream;

  /// Sets up socket listeners for all hazard events.
  /// This is the single point where we listen to all hazard socket events.
  void _setupSocketListeners() {
    _socketService.listenToEvent(
      SocketEvent.newHazard,
      (data) {
        if (data is Map<String, dynamic>) {
          final newHazard = Hazard.fromJson(data);
          _newHazardStreamController.add(newHazard);
        }
      },
    );

    _socketService.listenToEvent(
      SocketEvent.updateHazard,
      (data) {
        if (data is Map<String, dynamic>) {
          final updatedHazard = Hazard.fromJson(data);
          _updateHazardStreamController.add(updatedHazard);
        }
      },
    );

    _socketService.listenToEvent(
      SocketEvent.deleteHazard,
      (data) {
        if (data is Map<String, dynamic>) {
          final hazardId = data['id'] as String?;
          if (hazardId != null) {
            _deleteHazardStreamController.add(hazardId);
          }
        }
      },
    );
  }

  /// Disposes of all stream controllers when no longer needed
  void dispose() {
    _updateHazardStreamController.close();
    _newHazardStreamController.close();
    _deleteHazardStreamController.close();
  }
}
