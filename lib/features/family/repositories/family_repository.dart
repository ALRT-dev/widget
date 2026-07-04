import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hazard_app/api/rest_client.dart';
import 'package:hazard_app/features/family/models/family_models.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/providers/rest_client_provider.dart';
import 'package:hazard_app/features/shared/utils/async_call_helper.dart';
import 'package:hazard_app/features/shared/utils/either.dart';

/// Provides [FamilyRepository].
final providerOfFamilyRepository = Provider<FamilyRepository>((ref) {
  return FamilyRepositoryImpl(
    restClient: ref.watch(providerOfRestClient),
  );
});

abstract class FamilyRepository {
  /// Returns the user's family circle, or `null` when they have none.
  Future<Either<FamilyCircle?, AppError>> getFamilyCircle();

  Future<Either<FamilyCircle, AppError>> createFamilyCircle({
    required final String name,
  });

  Future<Either<void, AppError>> updateFamilyCircle({
    final String? name,
    final String? themeColor,
  });

  Future<Either<void, AppError>> deleteFamilyCircle();

  Future<Either<void, AppError>> leaveFamilyCircle();

  Future<Either<void, AppError>> removeFamilyMember({
    required final String memberId,
  });

  Future<Either<void, AppError>> updateOwnFamilyMember({
    final String? nickname,
    final FamilySharingLevel? sharingLevel,
    final String? colorHex,
  });

  Future<Either<void, AppError>> updateOwnFamilyMemberPhoto({
    required final File photo,
  });

  Future<Either<FamilyInvite, AppError>> createFamilyInvite();

  Future<Either<List<FamilyInvite>, AppError>> getFamilyInvites();

  Future<Either<void, AppError>> revokeFamilyInvite({
    required final String inviteId,
  });

  Future<Either<FamilyCircle, AppError>> joinFamilyCircle({
    required final String code,
  });

  Future<Either<void, AppError>> sendFamilyLocationPing({
    required final double latitude,
    required final double longitude,
    final double? accuracy,
    final double? speed,
    final int? batteryLevel,
    final bool? isMoving,
  });

  Future<Either<FamilyLocationRequest, AppError>> createFamilyLocationRequest({
    required final String memberId,
  });

  Future<Either<List<FamilyLocationRequest>, AppError>>
  getPendingFamilyLocationRequests();

  Future<Either<FamilyLocationRequest, AppError>>
  respondToFamilyLocationRequest({
    required final String requestId,
    required final bool share,
    final double? latitude,
    final double? longitude,
  });

  Future<Either<FamilyCheckIn, AppError>> sendFamilyCheckIn({
    final FamilyCheckInStatus? status,
    final String? message,
    final double? latitude,
    final double? longitude,
    final String? requestId,
    final String? hazardId,
  });

  Future<Either<FamilyCheckInRequest, AppError>> requestFamilyCheckIn({
    final String? message,
    final String? hazardId,
  });

  Future<Either<List<FamilyCheckIn>, AppError>> getFamilyCheckIns({
    final int? limit,
  });

  Future<Either<List<FamilySavedPlace>, AppError>> getFamilyPlaces();

  Future<Either<FamilySavedPlace, AppError>> createFamilyPlace({
    required final String name,
    required final double latitude,
    required final double longitude,
    final FamilyPlaceIcon? icon,
    final int? radiusMeters,
    final String? address,
  });

  Future<Either<FamilySavedPlace, AppError>> updateFamilyPlace({
    required final String placeId,
    final String? name,
    final FamilyPlaceIcon? icon,
    final double? latitude,
    final double? longitude,
    final int? radiusMeters,
    final String? address,
  });

  Future<Either<void, AppError>> deleteFamilyPlace({
    required final String placeId,
  });

  Future<Either<FamilyPlaceNotificationPref, AppError>> updateFamilyPlacePref({
    required final String placeId,
    required final String subjectMemberId,
    required final bool notifyArrivals,
    required final bool notifyDepartures,
  });

  Future<Either<FamilySosEvent, AppError>> triggerFamilySos({
    final double? latitude,
    final double? longitude,
  });

  Future<Either<List<FamilySosEvent>, AppError>> getActiveFamilySosEvents();

  Future<Either<FamilySosResponse, AppError>> respondToFamilySos({
    required final String sosEventId,
    required final FamilySosResponseType type,
  });

  Future<Either<FamilySosEvent, AppError>> resolveFamilySos({
    required final String sosEventId,
  });
}

class FamilyRepositoryImpl implements FamilyRepository {
  FamilyRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  final RestClient _restClient;

  @override
  Future<Either<FamilyCircle?, AppError>> getFamilyCircle() {
    return runAsyncCall(
      name: 'getFamilyCircle',
      future: () async {
        final response = await _restClient.getFamilyCircle();
        final data = response.data;
        if (data == null) return const Success(null);
        return Success(
          FamilyCircle.fromJson(Map<String, dynamic>.from(data as Map)),
        );
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<FamilyCircle, AppError>> createFamilyCircle({
    required String name,
  }) {
    return runAsyncCall(
      name: 'createFamilyCircle',
      future: () async {
        final result = await _restClient.createFamilyCircle(name: name);
        return Success(result);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<void, AppError>> updateFamilyCircle({
    String? name,
    String? themeColor,
  }) {
    return runAsyncCall(
      name: 'updateFamilyCircle',
      future: () async {
        await _restClient.updateFamilyCircle(name: name, themeColor: themeColor);
        return const Success(null);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<void, AppError>> deleteFamilyCircle() {
    return runAsyncCall(
      name: 'deleteFamilyCircle',
      future: () async {
        await _restClient.deleteFamilyCircle();
        return const Success(null);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<void, AppError>> leaveFamilyCircle() {
    return runAsyncCall(
      name: 'leaveFamilyCircle',
      future: () async {
        await _restClient.leaveFamilyCircle();
        return const Success(null);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<void, AppError>> removeFamilyMember({
    required String memberId,
  }) {
    return runAsyncCall(
      name: 'removeFamilyMember',
      future: () async {
        await _restClient.removeFamilyMember(memberId: memberId);
        return const Success(null);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<void, AppError>> updateOwnFamilyMember({
    String? nickname,
    FamilySharingLevel? sharingLevel,
    String? colorHex,
  }) {
    return runAsyncCall(
      name: 'updateOwnFamilyMember',
      future: () async {
        await _restClient.updateOwnFamilyMember(
          nickname: nickname,
          sharingLevel: sharingLevel?.name,
          colorHex: colorHex,
        );
        return const Success(null);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<void, AppError>> updateOwnFamilyMemberPhoto({
    required File photo,
  }) {
    return runAsyncCall(
      name: 'updateOwnFamilyMemberPhoto',
      future: () async {
        await _restClient.updateOwnFamilyMemberPhoto(photo: photo);
        return const Success(null);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<FamilyInvite, AppError>> createFamilyInvite() {
    return runAsyncCall(
      name: 'createFamilyInvite',
      future: () async {
        final result = await _restClient.createFamilyInvite();
        return Success(result);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<List<FamilyInvite>, AppError>> getFamilyInvites() {
    return runAsyncCall(
      name: 'getFamilyInvites',
      future: () async {
        final result = await _restClient.getFamilyInvites();
        return Success(result);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<void, AppError>> revokeFamilyInvite({
    required String inviteId,
  }) {
    return runAsyncCall(
      name: 'revokeFamilyInvite',
      future: () async {
        await _restClient.revokeFamilyInvite(inviteId: inviteId);
        return const Success(null);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<FamilyCircle, AppError>> joinFamilyCircle({
    required String code,
  }) {
    return runAsyncCall(
      name: 'joinFamilyCircle',
      future: () async {
        final result = await _restClient.joinFamilyCircle(code: code);
        return Success(result);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<void, AppError>> sendFamilyLocationPing({
    required double latitude,
    required double longitude,
    double? accuracy,
    double? speed,
    int? batteryLevel,
    bool? isMoving,
  }) {
    return runAsyncCall(
      name: 'sendFamilyLocationPing',
      future: () async {
        await _restClient.sendFamilyLocationPing(
          latitude: latitude,
          longitude: longitude,
          accuracy: accuracy,
          speed: speed,
          batteryLevel: batteryLevel,
          isMoving: isMoving,
        );
        return const Success(null);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<FamilyLocationRequest, AppError>> createFamilyLocationRequest({
    required String memberId,
  }) {
    return runAsyncCall(
      name: 'createFamilyLocationRequest',
      future: () async {
        final request = await _restClient.createFamilyLocationRequest(
          memberId: memberId,
        );
        return Success(request);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<List<FamilyLocationRequest>, AppError>>
  getPendingFamilyLocationRequests() {
    return runAsyncCall(
      name: 'getPendingFamilyLocationRequests',
      future: () async {
        final requests = await _restClient.getPendingFamilyLocationRequests();
        return Success(requests);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<FamilyLocationRequest, AppError>>
  respondToFamilyLocationRequest({
    required String requestId,
    required bool share,
    double? latitude,
    double? longitude,
  }) {
    return runAsyncCall(
      name: 'respondToFamilyLocationRequest',
      future: () async {
        final request = await _restClient.respondToFamilyLocationRequest(
          requestId: requestId,
          share: share,
          latitude: latitude,
          longitude: longitude,
        );
        return Success(request);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<FamilyCheckIn, AppError>> sendFamilyCheckIn({
    FamilyCheckInStatus? status,
    String? message,
    double? latitude,
    double? longitude,
    String? requestId,
    String? hazardId,
  }) {
    return runAsyncCall(
      name: 'sendFamilyCheckIn',
      future: () async {
        final result = await _restClient.sendFamilyCheckIn(
          status: status?.name,
          message: message,
          latitude: latitude,
          longitude: longitude,
          requestId: requestId,
          hazardId: hazardId,
        );
        return Success(result);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<FamilyCheckInRequest, AppError>> requestFamilyCheckIn({
    String? message,
    String? hazardId,
  }) {
    return runAsyncCall(
      name: 'requestFamilyCheckIn',
      future: () async {
        final result = await _restClient.requestFamilyCheckIn(
          message: message,
          hazardId: hazardId,
        );
        return Success(result);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<List<FamilyCheckIn>, AppError>> getFamilyCheckIns({
    int? limit,
  }) {
    return runAsyncCall(
      name: 'getFamilyCheckIns',
      future: () async {
        final result = await _restClient.getFamilyCheckIns(limit: limit);
        return Success(result);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<List<FamilySavedPlace>, AppError>> getFamilyPlaces() {
    return runAsyncCall(
      name: 'getFamilyPlaces',
      future: () async {
        final result = await _restClient.getFamilyPlaces();
        return Success(result);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<FamilySavedPlace, AppError>> createFamilyPlace({
    required String name,
    required double latitude,
    required double longitude,
    FamilyPlaceIcon? icon,
    int? radiusMeters,
    String? address,
  }) {
    return runAsyncCall(
      name: 'createFamilyPlace',
      future: () async {
        final result = await _restClient.createFamilyPlace(
          name: name,
          icon: icon?.name,
          latitude: latitude,
          longitude: longitude,
          radiusMeters: radiusMeters,
          address: address,
        );
        return Success(result);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<FamilySavedPlace, AppError>> updateFamilyPlace({
    required String placeId,
    String? name,
    FamilyPlaceIcon? icon,
    double? latitude,
    double? longitude,
    int? radiusMeters,
    String? address,
  }) {
    return runAsyncCall(
      name: 'updateFamilyPlace',
      future: () async {
        final result = await _restClient.updateFamilyPlace(
          placeId: placeId,
          name: name,
          icon: icon?.name,
          latitude: latitude,
          longitude: longitude,
          radiusMeters: radiusMeters,
          address: address,
        );
        return Success(result);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<void, AppError>> deleteFamilyPlace({required String placeId}) {
    return runAsyncCall(
      name: 'deleteFamilyPlace',
      future: () async {
        await _restClient.deleteFamilyPlace(placeId: placeId);
        return const Success(null);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<FamilyPlaceNotificationPref, AppError>> updateFamilyPlacePref({
    required String placeId,
    required String subjectMemberId,
    required bool notifyArrivals,
    required bool notifyDepartures,
  }) {
    return runAsyncCall(
      name: 'updateFamilyPlacePref',
      future: () async {
        final result = await _restClient.updateFamilyPlacePref(
          placeId: placeId,
          subjectMemberId: subjectMemberId,
          notifyArrivals: notifyArrivals,
          notifyDepartures: notifyDepartures,
        );
        return Success(result);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<FamilySosEvent, AppError>> triggerFamilySos({
    double? latitude,
    double? longitude,
  }) {
    return runAsyncCall(
      name: 'triggerFamilySos',
      future: () async {
        final result = await _restClient.triggerFamilySos(
          latitude: latitude,
          longitude: longitude,
        );
        return Success(result);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<List<FamilySosEvent>, AppError>> getActiveFamilySosEvents() {
    return runAsyncCall(
      name: 'getActiveFamilySosEvents',
      future: () async {
        final result = await _restClient.getActiveFamilySosEvents();
        return Success(result);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<FamilySosResponse, AppError>> respondToFamilySos({
    required String sosEventId,
    required FamilySosResponseType type,
  }) {
    return runAsyncCall(
      name: 'respondToFamilySos',
      future: () async {
        final result = await _restClient.respondToFamilySos(
          sosEventId: sosEventId,
          type: type.name,
        );
        return Success(result);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<FamilySosEvent, AppError>> resolveFamilySos({
    required String sosEventId,
  }) {
    return runAsyncCall(
      name: 'resolveFamilySos',
      future: () async {
        final result = await _restClient.resolveFamilySos(
          sosEventId: sosEventId,
        );
        return Success(result);
      },
      onError: Failure.new,
    );
  }
}
