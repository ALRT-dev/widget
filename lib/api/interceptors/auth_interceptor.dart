import 'package:dio/dio.dart';
import 'package:hazard_app/api/endpoints.dart';
import 'package:hazard_app/api/token_handler.dart';
import 'package:hazard_app/features/shared/enums/shared_prefs_key_types.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/repositories/shared_prefs_repository.dart';
import 'package:hazard_app/features/shared/utils/async_call_helper.dart';
import 'package:hazard_app/features/shared/utils/either.dart';

class AuthInterceptor implements Interceptor {
  AuthInterceptor({
    required final Dio dio,
    required final SharedPreferencesRepository sharedPreferencesRepository,
  }) : _dio = dio,
       _sharedPreferencesRepository = sharedPreferencesRepository;

  final Dio _dio;
  final SharedPreferencesRepository _sharedPreferencesRepository;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final headersResult = await getApiHeaders(
      requestEndpoint: options.path,
      existingHeaders: options.headers,
    );
    final headers = headersResult.whenSuccess(
      (success) => success,
    );

    if (headers != null) {
      options.headers = Map<String, dynamic>.from(headers)
        ..addAll(options.headers);
    }

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  /// Returns the headers for the request based on the current user.
  Future<Either<Map<String, String>, AppError>> getApiHeaders({
    required final String requestEndpoint,
    required final Map<String, dynamic> existingHeaders,
  }) {
    return runAsyncCall(
      name: 'Getting DIO headers',
      withLog: false,
      future: () async {
        // ignore adding token to the endpoints that do not require authentication
        final ignoreEndpoints = [];

        final ignoreToken = ignoreEndpoints.any(
          (endpoint) => requestEndpoint.contains(endpoint),
        );

        final accessToken = ignoreToken ? null : await getAccessToken();
        final headers = <String, String>{
          'Accept-Encoding': 'gzip, deflate',
          'content-type': 'application/json',
          if (accessToken != null) 'Authorization': 'Bearer $accessToken',
          ...existingHeaders,
        };

        return Success(headers);
      },
      onError: Failure.new,
    );
  }

  /// Retrieves the access token from shared preferences.
  Future<String?> getAccessToken() async {
    // get the accessToken from the local storage
    final result = await _sharedPreferencesRepository.getString(
      key: SharedPrefsKey.accessToken,
    );
    final accessToken = result.whenSuccess(
      (success) {
        if (success is String) return success;
        return null;
      },
    );
    if (accessToken == null) return null;

    // check if the token is expired or not
    final isExpired = await TokenHandler.isTokenExpired(
      token: accessToken,
    );
    if (isExpired) {
      // if the token is expired then generate new access token using the refresh token
      final newAccessTokenResult = await _generateNewAccessToken();

      return newAccessTokenResult.whenSuccess((success) {
        // save the new access token to the local storage.
        _sharedPreferencesRepository.saveString(
          key: SharedPrefsKey.accessToken,
          value: success,
        );

        return success;
      });
    }

    return accessToken;
  }

  /// Calls the API to generate new accessToken using the old refreshToken.
  Future<Either<String, AppError>> _generateNewAccessToken() {
    return runAsyncCall(
      name: 'generateNewAccessToken',
      future: () async {
        final result = await _sharedPreferencesRepository.getString(
          key: SharedPrefsKey.refreshToken,
        );
        final refreshToken = result.whenSuccess(
          (success) {
            if (success is String) return success;
            return null;
          },
        );
        if (refreshToken == null) {
          throw AppError(message: 'No refresh token!');
        }

        final request = await _dio.post<Map<String, dynamic>>(
          kUrlRefreshToken,
          data: {
            'refreshToken': refreshToken,
          },
        );

        final data = request.data;
        if (data?['accessToken'] == null || data?['accessToken'] is! String) {
          throw AppError(
            message: 'accessToken could not be generated',
          );
        }

        final newAccessToken = data!['accessToken'] as String;
        return Success(newAccessToken);
      },
      onError: Failure.new,
    );
  }
}
