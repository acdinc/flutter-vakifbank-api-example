import '../../core/exceptions/exceptions.dart';
import '../../core/result/result.dart';
import '../../domain/entities/calculated_bond_info.dart/calculated_bond_info_entity.dart';
import '../../domain/entities/product_info/product_info_entity.dart';
import '../../domain/respositories/bond_repository.dart';
import '../local_data_source/local_data_source.dart';
import '../remote_data_source/bond/bond_remote_data_source.dart';

class BondRepositoryImpl implements BondRepository {
  BondRepositoryImpl({
    required BondRemoteDataSource remoteDataSource,
    required LocalDataSource localDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  final BondRemoteDataSource _remoteDataSource;
  // ignore: unused_field
  final LocalDataSource _localDataSource;

  @override
  Future<Result<List<ProductInfoEntity>, Exceptions>> fetchBondList({
    required String productName,
    required String transactionType,
  }) async {
    try {
      final response = await _remoteDataSource.fetchBondList(
        productName: productName,
        transactionType: transactionType,
      );

      final data = response?.product?.productInfo;

      if (data == null) {
        return Result.failure(Exceptions.empty(this));
      } else {
        return Result.success(data);
      }
    } catch (e) {
      return Result.failure(e.getException);
    }
  }

  @override
  Future<Result<CalculatedBondInfoEntity, Exceptions>> calculateBond({
    required String productName,
    required String transactionType,
    required String isin,
    int? item,
    int? amount,
  }) async {
    try {
      final response = await _remoteDataSource.calculateBond(
        productName: productName,
        transactionType: transactionType,
        isin: isin,
        item: item,
        amount: amount,
      );

      final data = response?.info?.calculatedBondInfoEntity;

      if (data == null) {
        return Result.failure(Exceptions.empty(this));
      } else {
        return Result.success(data);
      }
    } catch (e) {
      return Result.failure(e.getException);
    }
  }
}
