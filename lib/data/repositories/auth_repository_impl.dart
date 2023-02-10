import '../../core/exceptions/exceptions.dart';
import '../../core/result/result.dart';
import '../../domain/entities/auth_response/auth_response_entity.dart';
import '../../domain/respositories/auth_repository.dart';
import '../local_data_source/local_data_keys.dart';
import '../local_data_source/local_data_source.dart';
import '../remote_data_source/auth/auth_remote_data_source.dart';
import '../secret/env.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
    required LocalDataSource localDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  final AuthRemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;

  @override
  Future<Result<AuthResponseEntity, Exceptions>> login() async {
    const grantType = 'client_credentials';
    const scope = 'public';

    try {
      await _localDataSource.clear();

      final response = await _remoteDataSource.authenticate(
        clientId: Env.clientId,
        clientSecret: Env.clientSecret,
        grantType: grantType,
        scope: scope,
      );

      if (response == null) {
        return Result.failure(Exceptions.empty(this));
      } else {
        await _localDataSource.setValue(
          LocalDataKeys.accessToken,
          response.accessToken,
        );
        return Result.success(response);
      }
    } catch (e) {
      return Result.failure(e.getException);
    }
  }
}
