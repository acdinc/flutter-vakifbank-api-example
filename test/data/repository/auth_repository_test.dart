import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vakifbank/core/exceptions/exceptions.dart';
import 'package:vakifbank/core/result/result.dart';
import 'package:vakifbank/domain/entities/auth_response/auth_response_entity.dart';
import 'package:vakifbank/domain/respositories/auth_repository.dart';

class MockRepository extends Mock implements AuthRepository {
  @override
  Future<Result<AuthResponseEntity, Exceptions>> login() async {
    return Result.success(authEntity);
  }
}

final authEntity = AuthResponseEntity(accessToken: 'xxxxxxxxx');

void main() {
  late MockRepository mockRepository;

  setUp(() {
    mockRepository = MockRepository();
  });

  test(
    'Login returns access token successfully',
    () async {
      final response = await mockRepository.login();

      expect(
        response.when(
          success: (data) => data.accessToken,
          failure: (error) => error,
        ),
        authEntity.accessToken,
      );
    },
  );
}
