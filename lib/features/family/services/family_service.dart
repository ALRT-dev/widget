import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hazard_app/features/family/models/family_models.dart';
import 'package:hazard_app/features/family/repositories/family_repository.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/utils/either.dart';

/// Provides [FamilyService].
final providerOfFamilyService = Provider<FamilyService>(FamilyService.new);

/// A thin service layer over [FamilyRepository].
class FamilyService {
  FamilyService(final Ref ref) : _ref = ref;

  final Ref _ref;
  FamilyRepository get _familyRepository =>
      _ref.read(providerOfFamilyRepository);

  /// Returns the user's family circle, or `null` when they have none.
  Future<Either<FamilyCircle?, AppError>> getFamilyCircle() {
    return _familyRepository.getFamilyCircle();
  }

  Future<Either<FamilyCircle, AppError>> createFamilyCircle({
    required final String name,
  }) {
    return _familyRepository.createFamilyCircle(name: name);
  }

  Future<Either<void, AppError>> updateFamilyCircle({
    final String? name,
    final String? themeColor,
  }) {
    return _familyRepository.updateFamilyCircle(
      name: name,
      themeColor: themeColor,
    );
  }

  Future<Either<void, AppError>> deleteFamilyCircle() {
    return _familyRepository.deleteFamilyCircle();
  }

  Future<Either<void, AppError>> leaveFamilyCircle() {
    return _familyRepository.leaveFamilyCircle();
  }

  Future<Either<void, AppError>> removeFamilyMember({
    required final String memberId,
  }) {
    return _familyRepository.removeFamilyMember(memberId: memberId);
  }

  Future<Either<void, AppError>> updateOwnFamilyMember({
    final String? nickname,
    final FamilySharingLevel? sharingLevel,
    final String? colorHex,
  }) {
    return _familyRepository.updateOwnFamilyMember(
      nickname: nickname,
      sharingLevel: sharingLevel,
      colorHex: colorHex,
    );
  }

  Future<Either<void, AppError>> updateOwnFamilyMemberPhoto({
    required final File photo,
  }) {
    return _familyRepository.updateOwnFamilyMemberPhoto(photo: photo);
  }

  Future<Either<FamilyInvite, AppError>> createFamilyInvite() {
    return _familyRepository.createFamilyInvite();
  }

  Future<Either<List<FamilyInvite>, AppError>> getFamilyInvites() {
    return _familyRepository.getFamilyInvites();
  }

  Future<Either<void, AppError>> revokeFamilyInvite({
    required final String inviteId,
  }) {
    return _familyRepository.revokeFamilyInvite(inviteId: inviteId);
  }

  Future<Either<FamilyCircle, AppError>> joinFamilyCircle({
    required final String code,
  }) {
    return _familyRepository.joinFamilyCircle(code: code);
  }

  Future<Either<void, AppError>> sendFamilyLocationPing({
    required final double latitude,
    required final double longitude,
    final double? accuracy,
    final double? speed,
    final int? batteryLevel,
    final bool? isMoving,
  }) {
    return _familyRepository.sendFamilyLocationPing(
      latitude: latitude,
      longitude: longitude,
      accuracy: accuracy,
      speed: speed,
      batteryLevel: batteryLevel,
      isMoving: isMoving,
    );
  }

  Future<Either<FamilyLocationRequest, AppError>> createFamilyLocationRequest({
    required final String memberId,
  }) {
    return _familyRepository.createFamilyLocationRequest(memberId: memberId);
  }

  Future<Either<List<FamilyLocationRequest>, AppError>>
  getPendingFamilyLocationRequests() {
    return _familyRepository.getPendingFamilyLocationRequests();
  }

  Future<Either<FamilyLocationRequest, AppError>>
  respondToFamilyLocationRequest({
    required final String requestId,
    required final bool share,
    final double? latitude,
    final double? longitude,
  }) {
    return _familyRepository.respondToFamilyLocationRequest(
      requestId: requestId,
      share: share,
      latitude: latitude,
      longitude: longitude,
    );
  }

  Future<Either<FamilyCheckIn, AppError>> sendFamilyCheckIn({
    final FamilyCheckInStatus? status,
    final String? message,
    final double? latitude,
    final double? longitude,
    final String? requestId,
    final String? hazardId,
  }) {
    return _familyRepository.sendFamilyCheckIn(
      status: status,
      message: message,
      latitude: latitude,
      longitude: longitude,
      requestId: requestId,
      hazardId: hazardId,
    );
  }

  Future<Either<FamilyCheckInRequest, AppError>> requestFamilyCheckIn({
    final String? message,
    final String? hazardId,
  }) {
    return _familyRepository.requestFamilyCheckIn(
      message: message,
      hazardId: hazardId,
    );
  }

  Future<Either<List<FamilyCheckIn>, AppError>> getFamilyCheckIns({
    final int? limit,
  }) {
    return _familyRepository.getFamilyCheckIns(limit: limit);
  }

  Future<Either<List<FamilySavedPlace>, AppError>> getFamilyPlaces() {
    return _familyRepository.getFamilyPlaces();
  }

  Future<Either<FamilySavedPlace, AppError>> createFamilyPlace({
    required final String name,
    required final double latitude,
    required final double longitude,
    final FamilyPlaceIcon? icon,
    final int? radiusMeters,
    final String? address,
  }) {
    return _familyRepository.createFamilyPlace(
      name: name,
      icon: icon,
      latitude: latitude,
      longitude: longitude,
      radiusMeters: radiusMeters,
      address: address,
    );
  }

  Future<Either<FamilySavedPlace, AppError>> updateFamilyPlace({
    required final String placeId,
    final String? name,
    final FamilyPlaceIcon? icon,
    final double? latitude,
    final double? longitude,
    final int? radiusMeters,
    final String? address,
  }) {
    return _familyRepository.updateFamilyPlace(
      placeId: placeId,
      name: name,
      icon: icon,
      latitude: latitude,
      longitude: longitude,
      radiusMeters: radiusMeters,
      address: address,
    );
  }

  Future<Either<void, AppError>> deleteFamilyPlace({
    required final String placeId,
  }) {
    return _familyRepository.deleteFamilyPlace(placeId: placeId);
  }

  Future<Either<FamilyPlaceNotificationPref, AppError>> updateFamilyPlacePref({
    required final String placeId,
    required final String subjectMemberId,
    required final bool notifyArrivals,
    required final bool notifyDepartures,
  }) {
    return _familyRepository.updateFamilyPlacePref(
      placeId: placeId,
      subjectMemberId: subjectMemberId,
      notifyArrivals: notifyArrivals,
      notifyDepartures: notifyDepartures,
    );
  }

  Future<Either<FamilySosEvent, AppError>> triggerFamilySos({
    final double? latitude,
    final double? longitude,
  }) {
    return _familyRepository.triggerFamilySos(
      latitude: latitude,
      longitude: longitude,
    );
  }

  Future<Either<List<FamilySosEvent>, AppError>> getActiveFamilySosEvents() {
    return _familyRepository.getActiveFamilySosEvents();
  }

  Future<Either<FamilySosResponse, AppError>> respondToFamilySos({
    required final String sosEventId,
    required final FamilySosResponseType type,
  }) {
    return _familyRepository.respondToFamilySos(
      sosEventId: sosEventId,
      type: type,
    );
  }

  Future<Either<FamilySosEvent, AppError>> resolveFamilySos({
    required final String sosEventId,
  }) {
    return _familyRepository.resolveFamilySos(sosEventId: sosEventId);
  }
}
