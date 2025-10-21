import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hazard_app/api/endpoints.dart';
import 'package:hazard_app/features/auth/models/auth_success_model.dart';
import 'package:hazard_app/features/notification/models/push_notification_settings_model.dart';
import 'package:hazard_app/features/notification/models/push_notification_update_input_model.dart';
import 'package:hazard_app/features/search/models/hazard_search_params.dart';
import 'package:hazard_app/features/shared/models/app_user_model.dart';
import 'package:hazard_app/features/shared/models/hazard_category_model.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';
import 'package:hazard_app/features/shared/models/get_hazards_with_categories_response_model.dart';
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
    @Field() required String idToken,
  });

  @POST(kUrlRefreshToken)
  Future<AuthSuccess> refreshToken({
    @Field() required String accessToken,
  });

  // ---------------------------- USER ----------------------------

  @GET(kUrlUser)
  Future<AppUser> getCurrentUser();

  @PUT(kUrlUser)
  Future<AppUser> updateCurrentUser({
    @Body() required AppUser user,
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

  @GET(kUrlPushNotificationSettings)
  Future<PushNotificationSettings> getPushNotificationSettings();

  @PUT(kUrlPushNotificationSettings)
  Future<HttpResponse> updatePushNotificationSettings({
    @Field() required final List<PushNotificationUpdateInput> updates,
  });

  // ---------------------------- HAZARD ----------------------------

  @GET(kUrlHazards)
  Future<List<Hazard>> getHazards({
    @Queries() required final HazardSearchParams searchParams,
  });

  @GET(kUrlHazardsWithCategories)
  Future<GetHazardsWithCategoriesResponse> getGetHazardsWithCategories({
    @Queries() required final HazardSearchParams searchParams,
  });

  @GET(kUrlHazardCategories)
  Future<List<HazardCategory>> getHazardCategories();

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
  Future<GetHazardsWithCategoriesResponse> getNotificationsFeed({
    @Queries() final HazardSearchParams? searchParams,
  });

  @POST(kUrlNotificationsPushNotificationToken)
  Future<HttpResponse> sendPushNotificationToken({
    @Field() required final String token,
  });
}
