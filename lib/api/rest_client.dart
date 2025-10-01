import 'package:dio/dio.dart';
import 'package:hazard_app/api/endpoints.dart';
import 'package:hazard_app/features/auth/models/auth_success_model.dart';
import 'package:hazard_app/features/search/models/hazard_search_params.dart';
import 'package:hazard_app/features/shared/models/app_user_model.dart';
import 'package:hazard_app/features/shared/models/hazard_model.dart';
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

  // ---------------------------- HAZARD ----------------------------

  @GET(kUrlHazards)
  Future<List<Hazard>> getHazards({
    @Queries() required final HazardSearchParams searchParams,
  });
}
