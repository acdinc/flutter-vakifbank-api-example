// ignore_for_file: one_member_abstracts

import 'package:equatable/equatable.dart';

import '../exceptions/exceptions.dart';
import '../result/result.dart';

abstract class UseCase<T, Params> {
  Future<Result<T, Exceptions>> call(Params params);
}

abstract class Params extends Equatable {
  const Params();

  @override
  List<Object?> get props;
}

class NoParams extends Params {
  @override
  List<Object?> get props => [];
}
