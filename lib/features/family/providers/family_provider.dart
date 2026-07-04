import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:hazard_app/features/family/models/family_models.dart';
import 'package:hazard_app/features/family/providers/family_socket_manager_provider.dart';
import 'package:hazard_app/features/family/providers/states/family_provider_state.dart';
import 'package:hazard_app/features/family/services/family_location_service.dart';
import 'package:hazard_app/features/family/services/family_service.dart';
import 'package:hazard_app/features/shared/extensions/context_extension.dart';
import 'package:hazard_app/features/shared/providers/navigator_key_provider.dart';
import 'package:hazard_app/features/shared/services/analytics_service.dart';

final providerOfFamily =
    StateNotifierProvider<FamilyProvider, FamilyProviderState>(
      (ref) => FamilyProvider(
        ref: ref,
        state: const FamilyProviderState(),
      ),
    );

class FamilyProvider extends StateNotifier<FamilyProviderState> {
  FamilyProvider({
    required final Ref ref,
    required final FamilyProviderState state,
  }) : _ref = ref,
       super(state) {
    _listenToSocketEvents();
  }

  final Ref _ref;
  FamilyService get _familyService => _ref.read(providerOfFamilyService);
  FamilyLocationService get _familyLocationService =>
      _ref.read(providerOfFamilyLocationService);
  FamilySocketManager get _familySocketManager =>
      _ref.read(providerOfFamilySocketManager);

  static const _recentCheckInsLimit = 20;

  // ---------------------------- SOCKET EVENTS ----------------------------

  void _listenToSocketEvents() {
    final subscriptions = <StreamSubscription>[
      _familySocketManager.circleUpdateStream.listen(
        (_) => load(silent: true),
      ),
      _familySocketManager.locationUpdateStream.listen(_patchMemberLocation),
      _familySocketManager.checkInStream.listen(_onCheckInReceived),
      _familySocketManager.checkInRequestStream.listen(
        _onCheckInRequestReceived,
      ),
      _familySocketManager.placeEventStream.listen((_) => _refreshPlaces()),
      _familySocketManager.sosStream.listen(_onSosReceived),
      _familySocketManager.sosResponseStream.listen(_onSosResponseReceived),
      _familySocketManager.sosResolvedStream.listen(_onSosResolved),
      _familySocketManager.hazardProximityStream.listen(_onHazardProximity),
    ];

    _ref.onDispose(() {
      for (final subscription in subscriptions) {
        subscription.cancel();
      }
    });
  }

  /// Patches the live location fields of a member in the circle.
  void _patchMemberLocation(final FamilyMember incoming) {
    final circle = state.circle;
    if (circle == null) return;

    final members = circle.members.map((member) {
      if (member.id != incoming.id) return member;
      return member.copyWith(
        latitude: incoming.latitude,
        longitude: incoming.longitude,
        locationLabel: incoming.locationLabel ?? member.locationLabel,
        locationUpdatedAt: incoming.locationUpdatedAt ?? DateTime.now(),
        batteryLevel: incoming.batteryLevel ?? member.batteryLevel,
        isMoving: incoming.isMoving,
        currentPlaceId: incoming.currentPlaceId,
      );
    }).toList();

    state = state.copyWith(circle: circle.copyWith(members: members));
  }

  /// Appends a check-in, updates the member's last check-in time and shows a
  /// quiet toast when it came from another member.
  void _onCheckInReceived(final FamilyCheckIn checkIn) {
    _appendCheckIn(checkIn);

    if (checkIn.memberId != state.circle?.myMemberId) {
      final name = checkIn.member?.displayName ?? 'A family member';
      final label = checkIn.status == FamilyCheckInStatus.safe
          ? '$name checked in safe'
          : '$name needs help';
      _showToast(message: label, isWarning: checkIn.status != FamilyCheckInStatus.safe);
    }
  }

  void _onCheckInRequestReceived(final FamilyCheckInRequest request) {
    final circle = state.circle;
    if (circle == null) return;

    state = state.copyWith(
      circle: circle.copyWith(latestCheckInRequest: request),
    );

    if (request.requestedById != circle.myMemberId) {
      final name = request.requestedBy?.displayName ?? 'A family member';
      _showToast(message: '$name asked everyone to check in');
    }
  }

  void _onSosReceived(final FamilySosEvent sosEvent) {
    _upsertSosEvent(sosEvent);

    if (sosEvent.memberId != state.circle?.myMemberId &&
        sosEvent.status == FamilySosStatus.active) {
      final name = sosEvent.member?.displayName ?? 'A family member';
      _showToast(message: '$name triggered SOS', isWarning: true);
    }
  }

  void _onSosResponseReceived(final FamilySosResponse response) {
    final events = state.activeSosEvents.map((event) {
      if (event.id != response.sosEventId) return event;
      final responses = [
        ...event.responses.where(
          (r) => r.memberId != response.memberId || r.type != response.type,
        ),
        response,
      ];
      return event.copyWith(responses: responses);
    }).toList();

    state = state.copyWith(activeSosEvents: events);
  }

  void _onSosResolved(final FamilySosEvent sosEvent) {
    state = state.copyWith(
      activeSosEvents: state.activeSosEvents
          .where((event) => event.id != sosEvent.id)
          .toList(),
    );
  }

  void _onHazardProximity(final Map<String, dynamic> payload) {
    final memberId = payload['memberId']?.toString();
    if (memberId == null) return;

    final isNear =
        (payload['isNear'] ?? payload['inProximity'] ?? true) == true;

    final ids = {...state.memberIdsNearAlert};
    isNear ? ids.add(memberId) : ids.remove(memberId);
    state = state.copyWith(memberIdsNearAlert: ids);
  }

  // ---------------------------- CIRCLE ----------------------------

  /// Loads the family circle and, when one exists, its recent check-ins and
  /// active SOS events.
  Future<void> load({final bool silent = false}) async {
    if (!silent) {
      state = state.copyWith(loadState: const FamilyActionState.loading());
    }

    final result = await _familyService.getFamilyCircle();
    if (!mounted) return;

    await result.when(
      (circle) async {
        state = state.copyWith(
          circle: circle,
          hasLoadedOnce: true,
          loadState: const FamilyActionState.success(),
          activeSosEvents: circle?.activeSosEvents ?? const [],
        );

        if (circle != null) {
          await Future.wait([
            _refreshRecentCheckIns(),
            _refreshActiveSosEvents(),
          ]);
        }
      },
      (error) async {
        state = state.copyWith(
          hasLoadedOnce: true,
          loadState: silent
              ? state.loadState
              : FamilyActionState.error(error),
        );
      },
    );
  }

  Future<void> createCircle({required final String name}) async {
    state = state.copyWith(
      createCircleState: const FamilyActionState.loading(),
    );

    final result = await _familyService.createFamilyCircle(name: name);
    if (!mounted) return;

    result.when(
      (circle) {
        state = state.copyWith(
          circle: circle,
          hasLoadedOnce: true,
          loadState: const FamilyActionState.success(),
          createCircleState: const FamilyActionState.success(),
        );
      },
      (error) {
        state = state.copyWith(
          createCircleState: FamilyActionState.error(error),
        );
      },
    );
  }

  Future<void> join({required final String code}) async {
    state = state.copyWith(joinCircleState: const FamilyActionState.loading());

    final result = await _familyService.joinFamilyCircle(code: code);
    if (!mounted) return;

    result.when(
      (circle) {
        state = state.copyWith(
          circle: circle,
          hasLoadedOnce: true,
          loadState: const FamilyActionState.success(),
          joinCircleState: const FamilyActionState.success(),
        );
      },
      (error) {
        state = state.copyWith(joinCircleState: FamilyActionState.error(error));
      },
    );
  }

  Future<void> leave() => _leaveOrDelete(isDelete: false);

  Future<void> deleteCircle() => _leaveOrDelete(isDelete: true);

  Future<void> _leaveOrDelete({required final bool isDelete}) async {
    state = state.copyWith(
      leaveDeleteState: const FamilyActionState.loading(),
    );

    final result = isDelete
        ? await _familyService.deleteFamilyCircle()
        : await _familyService.leaveFamilyCircle();
    if (!mounted) return;

    result.when(
      (_) {
        state = const FamilyProviderState(
          hasLoadedOnce: true,
          loadState: FamilyActionState.success(),
          leaveDeleteState: FamilyActionState.success(),
        );
      },
      (error) {
        state = state.copyWith(
          leaveDeleteState: FamilyActionState.error(error),
        );
      },
    );
  }

  Future<void> removeMember({required final String memberId}) async {
    final result = await _familyService.removeFamilyMember(memberId: memberId);
    if (!mounted) return;

    result.when(
      (_) => load(silent: true),
      (error) => _showToast(message: error.message, isWarning: true),
    );
  }

  // ---------------------------- OWN MEMBER ----------------------------

  Future<void> updateSharingLevel(final FamilySharingLevel level) async {
    state = state.copyWith(
      memberUpdateState: const FamilyActionState.loading(),
    );

    final result = await _familyService.updateOwnFamilyMember(
      sharingLevel: level,
    );
    if (!mounted) return;

    result.when(
      (_) {
        final circle = state.circle;
        final members = circle?.members
            .map(
              (member) => member.id == circle.myMemberId
                  ? member.copyWith(sharingLevel: level)
                  : member,
            )
            .toList();

        state = state.copyWith(
          circle: members == null ? circle : circle?.copyWith(members: members),
          memberUpdateState: const FamilyActionState.success(),
        );
      },
      (error) {
        state = state.copyWith(
          memberUpdateState: FamilyActionState.error(error),
        );
      },
    );
  }

  /// Updates the member's circle profile (nickname and/or accent colour).
  Future<bool> updateMyProfile({
    final String? nickname,
    final String? colorHex,
  }) async {
    state = state.copyWith(
      memberUpdateState: const FamilyActionState.loading(),
    );

    final result = await _familyService.updateOwnFamilyMember(
      nickname: nickname,
      colorHex: colorHex,
    );
    if (!mounted) return false;

    return result.when(
      (_) {
        state = state.copyWith(
          memberUpdateState: const FamilyActionState.success(),
        );
        load(silent: true);
        return true;
      },
      (error) {
        state = state.copyWith(
          memberUpdateState: FamilyActionState.error(error),
        );
        return false;
      },
    );
  }

  /// Uploads a circle-specific photo for the member.
  Future<bool> updateMyPhoto(final File photo) async {
    state = state.copyWith(
      memberUpdateState: const FamilyActionState.loading(),
    );

    final result = await _familyService.updateOwnFamilyMemberPhoto(
      photo: photo,
    );
    if (!mounted) return false;

    return result.when(
      (_) {
        state = state.copyWith(
          memberUpdateState: const FamilyActionState.success(),
        );
        load(silent: true);
        return true;
      },
      (error) {
        state = state.copyWith(
          memberUpdateState: FamilyActionState.error(error),
        );
        return false;
      },
    );
  }

  Future<void> updateNickname(final String nickname) async {
    state = state.copyWith(
      memberUpdateState: const FamilyActionState.loading(),
    );

    final result = await _familyService.updateOwnFamilyMember(
      nickname: nickname,
    );
    if (!mounted) return;

    result.when(
      (_) {
        state = state.copyWith(
          memberUpdateState: const FamilyActionState.success(),
        );
        load(silent: true);
      },
      (error) {
        state = state.copyWith(
          memberUpdateState: FamilyActionState.error(error),
        );
      },
    );
  }

  // ---------------------------- LOCATION SNAPSHOTS ----------------------------
  // ALRT never live-tracks: these are one-time, expiring, member-initiated.

  /// Asks [memberId] to share a one-time location snapshot.
  /// Returns true when the request was sent.
  Future<bool> requestMemberLocation({required final String memberId}) async {
    final result = await _familyService.createFamilyLocationRequest(
      memberId: memberId,
    );
    if (!mounted) return false;
    return result.when((_) => true, (_) => false);
  }

  /// Answers a "where are you" request. When [share] is true the current
  /// position is attached; declining sends nothing.
  Future<bool> respondToLocationRequest({
    required final String requestId,
    required final bool share,
  }) async {
    double? latitude;
    double? longitude;
    if (share) {
      final position = await _familyLocationService
          .getLastKnownOrCurrentPosition();
      if (position == null) return false;
      latitude = position.latitude;
      longitude = position.longitude;
    }
    if (!mounted) return false;

    final result = await _familyService.respondToFamilyLocationRequest(
      requestId: requestId,
      share: share,
      latitude: latitude,
      longitude: longitude,
    );
    if (!mounted) return false;
    return result.when(
      (_) {
        if (share) AnalyticsService.familySnapshotShared(via: 'request');
        return true;
      },
      (_) => false,
    );
  }

  /// Explicitly shares a fresh snapshot (e.g. re-sharing during an SOS).
  Future<bool> shareSnapshotNow() async {
    final shared = await _familyLocationService.shareSnapshotNow();
    if (shared) {
      AnalyticsService.familySnapshotShared(via: 'manual');
    }
    if (shared && mounted) {
      await load(silent: true);
    }
    return shared;
  }

  // ---------------------------- CHECK-INS ----------------------------

  /// Sends a check-in with the user's current (last known) location attached.
  Future<void> checkIn({
    final FamilyCheckInStatus status = FamilyCheckInStatus.safe,
    final String? message,
  }) async {
    state = state.copyWith(checkInState: const FamilyActionState.loading());

    final position = await _familyLocationService
        .getLastKnownOrCurrentPosition();
    if (!mounted) return;

    final result = await _familyService.sendFamilyCheckIn(
      status: status,
      message: message,
      latitude: position?.latitude,
      longitude: position?.longitude,
      requestId: state.circle?.latestCheckInRequest?.id,
    );
    if (!mounted) return;

    result.when(
      (checkInResult) {
        AnalyticsService.familyCheckIn();
        _appendCheckIn(checkInResult);
        state = state.copyWith(
          checkInState: const FamilyActionState.success(),
        );
      },
      (error) {
        state = state.copyWith(checkInState: FamilyActionState.error(error));
      },
    );
  }

  Future<void> requestCheckIn({final String? message}) async {
    state = state.copyWith(
      requestCheckInState: const FamilyActionState.loading(),
    );

    final result = await _familyService.requestFamilyCheckIn(message: message);
    if (!mounted) return;

    result.when(
      (request) {
        state = state.copyWith(
          circle: state.circle?.copyWith(latestCheckInRequest: request),
          requestCheckInState: const FamilyActionState.success(),
        );
      },
      (error) {
        state = state.copyWith(
          requestCheckInState: FamilyActionState.error(error),
        );
      },
    );
  }

  /// Adds [checkIn] to the recent list and stamps the member's
  /// `lastCheckInAt` so "Safe" chips update immediately.
  void _appendCheckIn(final FamilyCheckIn checkIn) {
    final circle = state.circle;

    final members = circle?.members
        .map(
          (member) => member.id == checkIn.memberId
              ? member.copyWith(
                  lastCheckInAt: checkIn.createdAt ?? DateTime.now(),
                )
              : member,
        )
        .toList();

    state = state.copyWith(
      circle: members == null ? circle : circle?.copyWith(members: members),
      recentCheckIns: [
        checkIn,
        ...state.recentCheckIns.where((c) => c.id != checkIn.id),
      ].take(_recentCheckInsLimit).toList(),
    );
  }

  Future<void> _refreshRecentCheckIns() async {
    final result = await _familyService.getFamilyCheckIns(
      limit: _recentCheckInsLimit,
    );
    if (!mounted) return;

    result.whenSuccess((checkIns) {
      state = state.copyWith(recentCheckIns: checkIns);
      return null;
    });
  }

  // ---------------------------- INVITES ----------------------------

  Future<void> loadInvites() async {
    state = state.copyWith(
      invitesLoadState: const FamilyActionState.loading(),
    );

    final result = await _familyService.getFamilyInvites();
    if (!mounted) return;

    result.when(
      (invites) {
        state = state.copyWith(
          invites: invites,
          invitesLoadState: const FamilyActionState.success(),
        );
      },
      (error) {
        state = state.copyWith(
          invitesLoadState: FamilyActionState.error(error),
        );
      },
    );
  }

  Future<FamilyInvite?> createInvite() async {
    state = state.copyWith(
      createInviteState: const FamilyActionState.loading(),
    );

    final result = await _familyService.createFamilyInvite();
    if (!mounted) return null;

    return result.when(
      (invite) {
        state = state.copyWith(
          invites: [invite, ...state.invites],
          createInviteState: const FamilyActionState.success(),
        );
        return invite;
      },
      (error) {
        state = state.copyWith(
          createInviteState: FamilyActionState.error(error),
        );
        return null;
      },
    );
  }

  Future<void> revokeInvite({required final String inviteId}) async {
    final previousInvites = state.invites;
    state = state.copyWith(
      invites: previousInvites.where((i) => i.id != inviteId).toList(),
    );

    final result = await _familyService.revokeFamilyInvite(inviteId: inviteId);
    if (!mounted) return;

    result.whenFailure((error) {
      state = state.copyWith(invites: previousInvites);
      _showToast(message: error.message, isWarning: true);
      return null;
    });
  }

  // ---------------------------- PLACES ----------------------------

  Future<bool> createPlace({
    required final String name,
    required final double latitude,
    required final double longitude,
    final FamilyPlaceIcon? icon,
    final int? radiusMeters,
    final String? address,
  }) async {
    state = state.copyWith(placeSaveState: const FamilyActionState.loading());

    final result = await _familyService.createFamilyPlace(
      name: name,
      icon: icon,
      latitude: latitude,
      longitude: longitude,
      radiusMeters: radiusMeters,
      address: address,
    );
    if (!mounted) return false;

    return result.when(
      (place) {
        final circle = state.circle;
        state = state.copyWith(
          circle: circle?.copyWith(places: [...circle.places, place]),
          placeSaveState: const FamilyActionState.success(),
        );
        return true;
      },
      (error) {
        state = state.copyWith(placeSaveState: FamilyActionState.error(error));
        return false;
      },
    );
  }

  Future<bool> updatePlace({
    required final String placeId,
    final String? name,
    final FamilyPlaceIcon? icon,
    final double? latitude,
    final double? longitude,
    final int? radiusMeters,
    final String? address,
  }) async {
    state = state.copyWith(placeSaveState: const FamilyActionState.loading());

    final result = await _familyService.updateFamilyPlace(
      placeId: placeId,
      name: name,
      icon: icon,
      latitude: latitude,
      longitude: longitude,
      radiusMeters: radiusMeters,
      address: address,
    );
    if (!mounted) return false;

    return result.when(
      (updated) {
        _replacePlace(updated);
        state = state.copyWith(
          placeSaveState: const FamilyActionState.success(),
        );
        return true;
      },
      (error) {
        state = state.copyWith(placeSaveState: FamilyActionState.error(error));
        return false;
      },
    );
  }

  Future<void> deletePlace({required final String placeId}) async {
    final result = await _familyService.deleteFamilyPlace(placeId: placeId);
    if (!mounted) return;

    result.when(
      (_) {
        final circle = state.circle;
        state = state.copyWith(
          circle: circle?.copyWith(
            places: circle.places.where((p) => p.id != placeId).toList(),
          ),
        );
      },
      (error) => _showToast(message: error.message, isWarning: true),
    );
  }

  /// Toggles a per-member arrive/leave notification preference, optimistically.
  Future<void> updatePlacePref({
    required final String placeId,
    required final String subjectMemberId,
    required final bool notifyArrivals,
    required final bool notifyDepartures,
  }) async {
    final circle = state.circle;
    final place = circle?.places.where((p) => p.id == placeId).firstOrNull;
    if (circle == null || place == null) return;

    final previousPlace = place;

    final newPref = FamilyPlaceNotificationPref(
      placeId: placeId,
      subjectMemberId: subjectMemberId,
      notifyArrivals: notifyArrivals,
      notifyDepartures: notifyDepartures,
    );
    _replacePlace(
      place.copyWith(
        notificationPrefs: [
          ...place.notificationPrefs.where(
            (pref) => pref.subjectMemberId != subjectMemberId,
          ),
          newPref,
        ],
      ),
    );

    final result = await _familyService.updateFamilyPlacePref(
      placeId: placeId,
      subjectMemberId: subjectMemberId,
      notifyArrivals: notifyArrivals,
      notifyDepartures: notifyDepartures,
    );
    if (!mounted) return;

    result.whenFailure((error) {
      _replacePlace(previousPlace);
      _showToast(message: error.message, isWarning: true);
      return null;
    });
  }

  Future<void> _refreshPlaces() async {
    final result = await _familyService.getFamilyPlaces();
    if (!mounted) return;

    result.whenSuccess((places) {
      state = state.copyWith(circle: state.circle?.copyWith(places: places));
      return null;
    });
  }

  void _replacePlace(final FamilySavedPlace place) {
    final circle = state.circle;
    if (circle == null) return;

    state = state.copyWith(
      circle: circle.copyWith(
        places: circle.places
            .map((p) => p.id == place.id ? place : p)
            .toList(),
      ),
    );
  }

  // ---------------------------- SOS ----------------------------

  /// Triggers an SOS with the user's current location attached.
  Future<FamilySosEvent?> triggerSos() async {
    state = state.copyWith(sosTriggerState: const FamilyActionState.loading());

    final position = await _familyLocationService
        .getLastKnownOrCurrentPosition();
    if (!mounted) return null;

    final result = await _familyService.triggerFamilySos(
      latitude: position?.latitude,
      longitude: position?.longitude,
    );
    if (!mounted) return null;

    return result.when(
      (sosEvent) {
        AnalyticsService.familySosTriggered();
        _upsertSosEvent(sosEvent);
        state = state.copyWith(
          sosTriggerState: const FamilyActionState.success(),
        );
        return sosEvent;
      },
      (error) {
        state = state.copyWith(sosTriggerState: FamilyActionState.error(error));
        return null;
      },
    );
  }

  Future<void> respondToSos({
    required final String sosEventId,
    required final FamilySosResponseType type,
  }) async {
    state = state.copyWith(sosRespondState: const FamilyActionState.loading());

    final result = await _familyService.respondToFamilySos(
      sosEventId: sosEventId,
      type: type,
    );
    if (!mounted) return;

    result.when(
      (response) {
        _onSosResponseReceived(response);
        state = state.copyWith(
          sosRespondState: const FamilyActionState.success(),
        );
      },
      (error) {
        state = state.copyWith(sosRespondState: FamilyActionState.error(error));
      },
    );
  }

  Future<void> resolveSos({required final String sosEventId}) async {
    final result = await _familyService.resolveFamilySos(
      sosEventId: sosEventId,
    );
    if (!mounted) return;

    result.when(
      (resolved) => _onSosResolved(resolved),
      (error) => _showToast(message: error.message, isWarning: true),
    );
  }

  Future<void> _refreshActiveSosEvents() async {
    final result = await _familyService.getActiveFamilySosEvents();
    if (!mounted) return;

    result.whenSuccess((events) {
      state = state.copyWith(activeSosEvents: events);
      return null;
    });
  }

  void _upsertSosEvent(final FamilySosEvent sosEvent) {
    if (sosEvent.status != FamilySosStatus.active) {
      _onSosResolved(sosEvent);
      return;
    }

    state = state.copyWith(
      activeSosEvents: [
        sosEvent,
        ...state.activeSosEvents.where((event) => event.id != sosEvent.id),
      ],
    );
  }

  // ---------------------------- HELPERS ----------------------------

  /// Resets one-shot action states so screens don't react to stale results.
  void resetActionStates() {
    state = state.copyWith(
      checkInState: const FamilyActionState.initial(),
      requestCheckInState: const FamilyActionState.initial(),
      createCircleState: const FamilyActionState.initial(),
      joinCircleState: const FamilyActionState.initial(),
      leaveDeleteState: const FamilyActionState.initial(),
      memberUpdateState: const FamilyActionState.initial(),
      placeSaveState: const FamilyActionState.initial(),
      sosTriggerState: const FamilyActionState.initial(),
      sosRespondState: const FamilyActionState.initial(),
      createInviteState: const FamilyActionState.initial(),
    );
  }

  /// Shows a toast via the global navigator, when a context is available.
  void _showToast({
    required final String message,
    final bool isWarning = false,
  }) {
    final context = _ref
        .read(providerOfGlobalNavigatorKey)
        .currentContext;
    if (context == null || !context.mounted) return;

    isWarning
        ? context.showWarningToast(message: message)
        : context.showSuccessToast(message: message);
  }
}
