import 'package:google_sign_in/google_sign_in.dart';
import 'package:hazard_app/api/rest_client.dart';
import 'package:hazard_app/features/auth/models/auth_success_model.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/utils/async_call_helper.dart';
import 'package:hazard_app/features/shared/utils/either.dart';

abstract class AuthRepository {
  Future<Either<AuthSuccess, AppError>> signInWithGoogle();
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
  Future<Either<AuthSuccess, AppError>> signInWithGoogle() {
    return runAsyncCall(
      name: 'signInWithGoogle',
      future: () async {
        await _googleSignIn.initialize();
        final account = await _googleSignIn.authenticate();

        final googleAuth = account.authentication;
        if (googleAuth.idToken == null) {
          throw AppError(message: 'No account was selected');
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
