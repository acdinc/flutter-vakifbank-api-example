import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/result/result.dart';
import '../entities/calculated_bond_info.dart/calculated_bond_info_entity.dart';
import '../entities/product_info/product_info_entity.dart';

abstract class BondRepository {
  Future<Result<List<ProductInfoEntity>, Exceptions>> fetchBondList({
    required String productName,
    required String transactionType,
  });
  Future<Result<CalculatedBondInfoEntity, Exceptions>> calculateBond({
    required String productName,
    required String transactionType,
    required String isin,
    int? item,
    int? amount,
  });
}
