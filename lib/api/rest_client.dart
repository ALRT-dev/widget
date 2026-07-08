import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hazard_app/api/endpoints.dart';
import 'package:hazard_app/features/auth/models/auth_success_model.dart';
import 'package:hazard_app/features/family/models/family_models.dart';
import 'package:hazard_app/features/learn/models/guide_models.dart';
import 'package:hazard_app/features/profile/models/xp_summary_models.dart';
import 'package:hazard_app/features/notification/models/push_notification_settings_model.dart';
import 'package:hazard_app/features/search/models/hazard_search_params.dart';
import 'package:hazard_app/features/shared/models/app_user_model.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';
import 'package:hazard_app/features/shared/models/get_hazards_with_subscription_id_reponse.dart';
import 'package:hazard_app/features/shared/models/location_subscription_model.dart';
import 'package:hazard_app/features/shared/models/view_hazard_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  // ---------------------------- AUTH ----------------------------

  @POST(kUrlOAuthGoogle)
  Future<AuthSuccess> verifyGoogleOAuth({
    @Field() required final String idToken,
  });

  @POST(kUrlOAuthApple)
  Future<AuthSuccess> verifyAppleOAuth({
    @Field() required final String identityToken,
    @Field() final String? firstName,
    @Field() final String? lastName,
  });

  @POST(kUrlOAuthMicrosoft)
  Future<AuthSuccess> verifyMicrosoftOAuth({
    @Field() required final String idToken,
  });

  @POST(kUrlRefreshToken)
  Future<AuthSuccess> refreshToken({
    @Field() required final String accessToken,
  });

  // ---------------------------- ONBOARDING ----------------------------

  @POST(kUrlOnboardingAcceptDisclaimer)
  Future<void> acceptOnboardingDisclaimer();

  @POST(kUrlOnboardingAcceptTos)
  Future<void> acceptOnboardingTermsOfService();

  @POST(kUrlOnboardingLocation)
  Future<void> setOnboardingLocation({
    @Field() required final double latitude,
    @Field() required final double longitude,
    @Field() final String? locationName,
  });

  @POST(kUrlOnboardingRadius)
  Future<void> setOnboardingRadius({
    @Field() required final double radiusInKm,
  });

  @POST(kUrlOnboardingNotifications)
  Future<void> setOnboardingNotificationPreferences({
    @Field() required final String pushNotificationPreference,
  });

  // ---------------------------- USER ----------------------------

  @GET(kUrlUser)
  Future<AppUser> getCurrentUser();

  @PUT(kUrlUser)
  Future<AppUser> updateCurrentUser({
    @Body() required final AppUser user,
    @CancelRequest() final CancelToken? cancelToken,
  });

  @PUT(kUrlUserProfilePicture)
  @MultiPart()
  Future<AppUser> updateUserProfilePicture({
    @Part() required final File profilePictureFile,
    @SendProgress() final void Function(int, int)? onSendProgress,
  });

  @POST(kUrlSubscribeLocation)
  Future<LocationSubscription> subscribeToLocation({
    @Field() required final double northeastLat,
    @Field() required final double northeastLng,
    @Field() required final double southwestLat,
    @Field() required final double southwestLng,
    @Field() final String? name,
    @Field() final String? address,
  });

  @DELETE('$kUrlUnsubscribeLocation/{subscriptionId}')
  Future<void> unsubscribeFromLocation({
    @Path() required String subscriptionId,
  });

  @GET(kUrlUserLocationSubscriptions)
  Future<List<LocationSubscription>> getLocationSubscriptions();

  @PUT(kUrlOwnLocationSubscription)
  Future<LocationSubscription> updateOwnLocationSubscription({
    @Field() required final double latitude,
    @Field() required final double longitude,
    @Field() final String? locationName,
  });

  @PUT(kUrlOwnLocationSubscriptionRadius)
  Future<LocationSubscription> updateOwnLocationSubscriptionRadius({
    @Field() required final double radiusKm,
  });

  @GET(kUrlPushNotificationSettings)
  Future<PushNotificationSettings> getPushNotificationSettings();

  @PUT(kUrlPushNotificationSettings)
  Future<PushNotificationSettings> updatePushNotificationSettings({
    @Body() required final PushNotificationSettings pushNotificationSettings,
  });

  @DELETE(kUrlUserAccount)
  Future<void> deleteAccount();

  @POST(kUrlUserAccountCancelDeletion)
  Future<void> cancelAccountDeletion();

  // ---------------------------- HAZARD ----------------------------

  @GET(kUrlHazards)
  Future<List<Hazard>> getHazards({
    @Queries() required final HazardSearchParams searchParams,
    @CancelRequest() final CancelToken? cancelToken,
  });

  @GET(kUrlHazardsWithSubscriptionId)
  Future<GetHazardsWithSubscriptionIdResponse> getGetHazardsWithSubscriptionId({
    @Queries() required final HazardSearchParams searchParams,
  });

  @GET(kUrlHazardCategories)
  Future<List<HazardCategory>> getAllHazardCategories();

  @GET(kUrlHazardCategoriesParent)
  Future<List<HazardCategory>> getAllParentHazardCategories();

  @GET(kUrlHazardCategoriesSub)
  Future<List<HazardCategory>> getAllSubHazardCategories();

  @POST(kUrlHazards)
  @MultiPart()
  Future<Hazard> createHazardReport({
    @Part() required final Map<String, dynamic> hazard,
    @Part() final List<File>? mediaFiles,
  });

  @PUT('$kUrlHazards/{hazardId}')
  @MultiPart()
  Future<Hazard> updateHazardReport({
    @Path() required final String hazardId,
    @Part() required final Map<String, dynamic> hazard,
    @Part() final List<File>? mediaFiles,
    @Part() final List<String>? removedMediaIds,
  });

  @DELETE('$kUrlHazards/{hazardId}')
  Future<void> deleteHazardReport({
    @Path() required final String hazardId,
  });

  @POST(kUrlHazardVote)
  Future<HttpResponse> voteHazard({
    @Path() required final String hazardId,
    @Field() required final String voteType,
  });

  @POST(kUrlHazardView)
  Future<ViewHazardResponse> viewHazard({
    @Path() required final String hazardId,
  });

  // ---------------------------- NOTIFICATION ----------------------------

  @GET(kUrlNotificationsFeed)
  Future<List<Hazard>> getNotificationsFeed({
    @Queries() final HazardSearchParams? searchParams,
  });

  @POST(kUrlNotificationsPushNotificationToken)
  Future<HttpResponse> sendPushNotificationToken({
    @Field() required final String token,
  });

  // ---------------------------- SUPPORT ----------------------------

  @POST(kUrlSupport)
  Future<void> submitSupportRequest({
    @Field() required final String requestType,
    @Field() required final String details,
    @Field() final String? userName,
    @Field() final String? userEmail,
  });

  // ---------------------------- FAMILY ----------------------------

  /// Returns the user's family circle, or a null body when they have none —
  /// handled as dynamic so the repository can map null -> no circle.
  @GET(kUrlFamilyCircle)
  Future<HttpResponse<dynamic>> getFamilyCircle();

  @POST(kUrlFamilyCircle)
  Future<FamilyCircle> createFamilyCircle({
    @Field() required final String name,
  });

  @PUT(kUrlFamilyCircle)
  Future<HttpResponse> updateFamilyCircle({
    @Field() final String? name,
    @Field() final String? themeColor,
  });

  @DELETE(kUrlFamilyCircle)
  Future<HttpResponse> deleteFamilyCircle();

  @POST(kUrlFamilyCircleLeave)
  Future<HttpResponse> leaveFamilyCircle();

  @DELETE('$kUrlFamilyMembers/{memberId}')
  Future<HttpResponse> removeFamilyMember({
    @Path() required final String memberId,
  });

  @PUT(kUrlFamilyMemberMe)
  Future<HttpResponse> updateOwnFamilyMember({
    @Field() final String? nickname,
    @Field() final String? sharingLevel,
    @Field() final String? colorHex,
  });

  @PUT(kUrlFamilyMemberMePhoto)
  @MultiPart()
  Future<HttpResponse> updateOwnFamilyMemberPhoto({
    @Part(name: 'profilePictureFile') required final File photo,
  });

  @POST(kUrlFamilyInvites)
  Future<FamilyInvite> createFamilyInvite();

  @GET(kUrlFamilyInvites)
  Future<List<FamilyInvite>> getFamilyInvites();

  @POST(kUrlFamilyInviteRevoke)
  Future<HttpResponse> revokeFamilyInvite({
    @Path() required final String inviteId,
  });

  @POST(kUrlFamilyJoin)
  Future<FamilyCircle> joinFamilyCircle({
    @Field() required final String code,
  });

  @POST(kUrlFamilyLocation)
  Future<HttpResponse> sendFamilyLocationPing({
    @Field() required final double latitude,
    @Field() required final double longitude,
    @Field() final double? accuracy,
    @Field() final double? speed,
    @Field() final double? heading,
    @Field() final int? batteryLevel,
    @Field() final bool? isMoving,
  });

  @POST(kUrlFamilyLocationRequest)
  Future<FamilyLocationRequest> createFamilyLocationRequest({
    @Path() required final String memberId,
  });

  @GET(kUrlFamilyLocationRequestsPending)
  Future<List<FamilyLocationRequest>> getPendingFamilyLocationRequests();

  @POST(kUrlFamilyLocationRequestRespond)
  Future<FamilyLocationRequest> respondToFamilyLocationRequest({
    @Path() required final String requestId,
    @Field() required final bool share,
    @Field() final double? latitude,
    @Field() final double? longitude,
  });

  @POST(kUrlFamilyCheckIn)
  Future<FamilyCheckIn> sendFamilyCheckIn({
    @Field() final String? status,
    @Field() final String? message,
    @Field() final double? latitude,
    @Field() final double? longitude,
    @Field() final String? requestId,
    @Field() final String? hazardId,
  });

  @POST(kUrlFamilyCheckInRequest)
  Future<FamilyCheckInRequest> requestFamilyCheckIn({
    @Field() final String? message,
    @Field() final String? hazardId,
  });

  @GET(kUrlFamilyCheckIns)
  Future<List<FamilyCheckIn>> getFamilyCheckIns({
    @Query('limit') final int? limit,
  });

  @GET(kUrlFamilyPlaces)
  Future<List<FamilySavedPlace>> getFamilyPlaces();

  @POST(kUrlFamilyPlaces)
  Future<FamilySavedPlace> createFamilyPlace({
    @Field() required final String name,
    @Field() final String? icon,
    @Field() required final double latitude,
    @Field() required final double longitude,
    @Field() final int? radiusMeters,
    @Field() final String? address,
  });

  @PUT('$kUrlFamilyPlaces/{placeId}')
  Future<FamilySavedPlace> updateFamilyPlace({
    @Path() required final String placeId,
    @Field() final String? name,
    @Field() final String? icon,
    @Field() final double? latitude,
    @Field() final double? longitude,
    @Field() final int? radiusMeters,
    @Field() final String? address,
  });

  @DELETE('$kUrlFamilyPlaces/{placeId}')
  Future<HttpResponse> deleteFamilyPlace({
    @Path() required final String placeId,
  });

  @PUT(kUrlFamilyPlacePrefs)
  Future<FamilyPlaceNotificationPref> updateFamilyPlacePref({
    @Path() required final String placeId,
    @Field() required final String subjectMemberId,
    @Field() required final bool notifyArrivals,
    @Field() required final bool notifyDepartures,
  });

  @POST(kUrlFamilySos)
  Future<FamilySosEvent> triggerFamilySos({
    @Field() final double? latitude,
    @Field() final double? longitude,
  });

  @GET(kUrlFamilySosActive)
  Future<List<FamilySosEvent>> getActiveFamilySosEvents();

  @POST(kUrlFamilySosRespond)
  Future<FamilySosResponse> respondToFamilySos({
    @Path() required final String sosEventId,
    @Field() required final String type,
  });

  @POST(kUrlFamilySosResolve)
  Future<FamilySosEvent> resolveFamilySos({
    @Path() required final String sosEventId,
  });

  // ---------------------------- LEARN / GUIDES ----------------------------

  @GET(kUrlXpSummary)
  Future<XpSummary> getXpSummary();

  @GET(kUrlGuideTopics)
  Future<GuideTopicsResponse> getGuideTopics();

  @GET(kUrlGuideDetail)
  Future<GuideDetail> getGuideDetail({
    @Path() required final String slugOrId,
  });

  @POST(kUrlGuideComplete)
  Future<GuideCompletionResponse> completeGuide({
    @Path() required final String slugOrId,
  });

  /// Returns the guide linked to a hazard category (nullable body).
  @GET(kUrlGuideForCategory)
  Future<HttpResponse<dynamic>> getGuideForCategory({
    @Path() required final String categoryId,
  });
}
