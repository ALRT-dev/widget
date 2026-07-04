import 'dart:async';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hazard_app/features/family/services/family_service.dart';
import 'package:hazard_app/features/shared/utils/async_call_helper.dart';

/// Provides [FamilyLocationService].
final providerOfFamilyLocationService = Provider<FamilyLocationService>(
  FamilyLocationService.new,
);

/// A battery-conscious background location pinger for Family Mode.
///
/// While running it:
/// - sends an immediate ping on [start],
/// - listens to the position stream with a 150m distance filter,
/// - throttles pings to at most one per 2 minutes, unless the user has moved
///   more than 500m since the last ping,
/// - attaches an `isMoving` flag derived from the reported speed.
class FamilyLocationService {
  FamilyLocationService(final Ref ref) : _ref = ref;

  final Ref _ref;
  FamilyService get _familyService => _ref.read(providerOfFamilyService);

  StreamSubscription<Position>? _positionSubscription;
  DateTime? _lastPingAt;
  Position? _lastPingPosition;
  var _isRunning = false;

  /// Minimum interval between two pings, unless the user moved far enough.
  static const minPingInterval = Duration(minutes: 2);

  /// Position stream distance filter in meters.
  static const distanceFilterMeters = 150;

  /// Moving further than this since the last ping bypasses the throttle.
  static const forcePingDistanceMeters = 500.0;

  /// Speeds above this (m/s) are considered "moving".
  static const movingSpeedThresholdMps = 1.0;

  /// Whether the pinger is currently running.
  bool get isRunning => _isRunning;

  /// Starts the location pinger.
  ///
  /// Returns without crashing when location permission is denied or the
  /// location service is disabled.
  Future<void> start() async {
    if (_isRunning) return;

    final hasPermission = await _hasLocationPermission();
    if (!hasPermission) {
      log(
        'Location permission not granted, family location pings disabled.',
        name: 'FamilyLocationService',
      );
      return;
    }

    _isRunning = true;

    // Send an immediate ping so the family sees us right away.
    final initialPosition = await getLastKnownOrCurrentPosition();
    if (initialPosition != null) {
      await _sendPing(initialPosition);
    }

    _positionSubscription?.cancel();
    _positionSubscription =
        Geolocator.getPositionStream(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.medium,
            distanceFilter: distanceFilterMeters,
          ),
        ).listen(
          _onPosition,
          onError: (Object error) {
            log(
              'Family position stream error: $error',
              name: 'FamilyLocationService',
            );
          },
        );
  }

  /// Stops the location pinger.
  void stop() {
    _positionSubscription?.cancel();
    _positionSubscription = null;
    _isRunning = false;
  }

  /// Returns the last known position, falling back to a fresh (low accuracy)
  /// fix. Returns `null` when the location is unavailable or not permitted.
  Future<Position?> getLastKnownOrCurrentPosition() {
    return runAsyncCall<Position?>(
      name: 'getLastKnownOrCurrentPosition',
      future: () async {
        final hasPermission = await _hasLocationPermission();
        if (!hasPermission) return null;

        final lastKnown = await Geolocator.getLastKnownPosition();
        if (lastKnown != null) return lastKnown;

        return Geolocator.getCurrentPosition(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.medium,
            timeLimit: Duration(seconds: 10),
          ),
        );
      },
      onError: (_) => null,
    );
  }

  /// Handles a new position from the stream, applying the ping throttle.
  Future<void> _onPosition(final Position position) async {
    final now = DateTime.now();

    final movedFarEnough =
        _lastPingPosition == null ||
        Geolocator.distanceBetween(
              _lastPingPosition!.latitude,
              _lastPingPosition!.longitude,
              position.latitude,
              position.longitude,
            ) >
            forcePingDistanceMeters;

    final intervalElapsed =
        _lastPingAt == null || now.difference(_lastPingAt!) >= minPingInterval;

    if (!intervalElapsed && !movedFarEnough) return;

    await _sendPing(position);
  }

  /// Sends a single location ping for [position].
  Future<void> _sendPing(final Position position) async {
    _lastPingAt = DateTime.now();
    _lastPingPosition = position;

    await _familyService.sendFamilyLocationPing(
      latitude: position.latitude,
      longitude: position.longitude,
      accuracy: position.accuracy,
      speed: position.speed,
      isMoving: position.speed > movingSpeedThresholdMps,
    );
  }

  /// Returns true when location services are enabled and permission is
  /// granted (requesting it once when it is simply denied).
  Future<bool> _hasLocationPermission() {
    return runAsyncCall<bool>(
      name: 'familyLocationPermissionCheck',
      future: () async {
        final serviceEnabled = await Geolocator.isLocationServiceEnabled();
        if (!serviceEnabled) return false;

        var permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
        }

        return permission == LocationPermission.whileInUse ||
            permission == LocationPermission.always;
      },
      onError: (_) => false,
    );
  }
}
