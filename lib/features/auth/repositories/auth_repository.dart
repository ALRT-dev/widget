import 'package:google_sign_in/google_sign_in.dart';
import 'package:hazard_app/api/rest_client.dart';
import 'package:hazard_app/features/auth/models/auth_success_model.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/utils/async_call_helper.dart';
import 'package:hazard_app/features/shared/utils/either.dart';

abstract class AuthRepository {
  Future<Either<void, AppError>> initializeGoogleSignIn();
  Future<Either<AuthSuccess, AppError>> signInWithGoogle();
  Future<Either<AuthSuccess, AppError>> signInWithGoogleUser({
    required GoogleSignInAccount googleUser,
  });
}

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required final RestClient restClient,
    required final GoogleSignIn googleSignIn,
  })  : _restClient = restClient,
        _googleSignIn = googleSignIn;

  final RestClient _restClient;
  final GoogleSignIn _googleSignIn;

  @override
  Future<Either<void, AppError>> initializeGoogleSignIn() {
    return runAsyncCall(
      name: 'initializeGoogleSignIn',
      future: () async {
        await _googleSignIn.initialize();
        return const Success(null);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<AuthSuccess, AppError>> signInWithGoogle() {
    return runAsyncCall(
      name: 'signInWithGoogle',
      future: () async {
        final account = await _googleSignIn.authenticate();

        final googleAuth = account.authentication;
        if (googleAuth.idToken == null) {
          throw AppError(message: 'Failed to get authentication token');
        }

        final result = await _restClient.verifyGoogleOAuth(
          idToken: googleAuth.idToken!,
        );
        return Success(result);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<Either<AuthSuccess, AppError>> signInWithGoogleUser({
    required GoogleSignInAccount googleUser,
  }) {
    return runAsyncCall(
      name: 'signInWithGoogleUser',
      future: () async {
        final googleAuth = googleUser.authentication;
        if (googleAuth.idToken == null) {
          throw AppError(message: 'Failed to get authentication token');
        }

        final result = await _restClient.verifyGoogleOAuth(
          idToken: googleAuth.idToken!,
        );
        return Success(result);
      },
      onError: Failure.new,
    );
  }
}
