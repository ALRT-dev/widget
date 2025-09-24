import 'package:hazard_app/api/rest_client.dart';
import 'package:hazard_app/features/shared/models/app_user_model.dart';
import 'package:hazard_app/features/shared/models/error_model.dart';
import 'package:hazard_app/features/shared/utils/async_call_helper.dart';
import 'package:hazard_app/features/shared/utils/either.dart';

abstract class UserRepository {
  Future<Either<AppUser, AppError>> getCurrentUser();
}

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  final RestClient _restClient;

  @override
  Future<Either<AppUser, AppError>> getCurrentUser() {
    return runAsyncCall(
      name: 'getCurrentUser',
      future: () async {
        final result = await _restClient.getCurrentUser();
        return Success(result);
      },
      onError: Failure.new,
    );
  }
}
