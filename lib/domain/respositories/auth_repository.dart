// ignore_for_file: one_member_abstracts

import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/result/result.dart';
import '../entities/auth_response/auth_response_entity.dart';

abstract class AuthRepository {
  Future<Result<AuthResponseEntity, Exceptions>> login();
}
