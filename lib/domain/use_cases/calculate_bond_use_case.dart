import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/result/result.dart';
import '../../core/use_case/use_case.dart';
import '../entities/calculated_bond_info.dart/calculated_bond_info_entity.dart';
import '../respositories/bond_repository.dart';

class CalculateBondUseCase
    implements UseCase<CalculatedBondInfoEntity, CalculateBondParams> {
  CalculateBondUseCase(this.repository);

  final BondRepository repository;

  @override
  Future<Result<CalculatedBondInfoEntity, Exceptions>> call(
    CalculateBondParams params,
  ) async {
    return repository.calculateBond(
      productName: params.productName,
      transactionType: params.transactionType,
      isin: params.isin,
      item: params.item,
      amount: params.amount,
    );
  }
}

class CalculateBondParams extends Params {
  const CalculateBondParams({
    required this.productName,
    required this.transactionType,
    required this.isin,
    this.item,
    this.amount,
  });

  final String productName;
  final String transactionType;
  final String isin;
  final int? item;
  final int? amount;

  @override
  List<Object?> get props => [
        productName,
        transactionType,
        isin,
        item,
        amount,
      ];
}
