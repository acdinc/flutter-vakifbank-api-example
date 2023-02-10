import '../../core/exceptions/exceptions.dart';
import '../../core/result/result.dart';
import '../../core/use_case/use_case.dart';
import '../entities/auth_response/auth_response_entity.dart';
import '../respositories/auth_repository.dart';

class AuthLoginUseCase implements UseCase<AuthResponseEntity, NoParams> {
  AuthLoginUseCase(this.repository);

  final AuthRepository repository;

  @override
  Future<Result<AuthResponseEntity, Exceptions>> call(NoParams noParams) async {
    return repository.login();
  }
}
