import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/result/result.dart';
import '../../core/use_case/use_case.dart';
import '../entities/product_info/product_info_entity.dart';
import '../respositories/bond_repository.dart';

class FetchBondListUseCase
    implements UseCase<List<ProductInfoEntity>, FetchBondListParams> {
  FetchBondListUseCase(this.repository);

  final BondRepository repository;

  @override
  Future<Result<List<ProductInfoEntity>, Exceptions>> call(
    FetchBondListParams params,
  ) async {
    return repository.fetchBondList(
      productName: params.productName,
      transactionType: params.transactionType,
    );
  }
}

class FetchBondListParams extends Params {
  const FetchBondListParams({
    required this.productName,
    required this.transactionType,
  });

  final String productName;
  final String transactionType;

  @override
  List<Object?> get props => [
        productName,
        transactionType,
      ];
}
