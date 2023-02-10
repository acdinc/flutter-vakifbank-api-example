import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vakifbank/core/exceptions/exceptions.dart';
import 'package:vakifbank/core/result/result.dart';
import 'package:vakifbank/domain/entities/calculated_bond_info.dart/calculated_bond_info_entity.dart';
import 'package:vakifbank/domain/entities/product_info/product_info_entity.dart';
import 'package:vakifbank/domain/respositories/bond_repository.dart';

class MockRepository extends Mock implements BondRepository {
  @override
  Future<Result<List<ProductInfoEntity>, Exceptions>> fetchBondList({
    required String productName,
    required String transactionType,
  }) async {
    if (productName == 'TahvilBono') {
      return Result.success(bonds);
    } else {
      return const Result.failure(Exceptions.other('Error!'));
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
    if (productName == 'TahvilBono') {
      return Result.success(info);
    } else {
      return const Result.failure(Exceptions.other('Error!'));
    }
  }
}

final bonds = [ProductInfoEntity()];
final info = CalculatedBondInfoEntity();

void main() {
  late MockRepository mockRepository;

  setUp(() {
    mockRepository = MockRepository();
  });

  group('Fetch bonds', () {
    test(
      'returns success',
      () async {
        final response = await mockRepository.fetchBondList(
          productName: 'TahvilBono',
          transactionType: 'Alis',
        );

        expect(
          response.whenOrNull(success: (data) => data),
          bonds,
        );
      },
    );

    test(
      'returns failure',
      () async {
        final response = await mockRepository.fetchBondList(
          productName: '',
          transactionType: '',
        );

        expect(
          response.whenOrNull(
            failure: (error) => error.getException,
          ),
          isA<Exception>(),
        );
      },
    );
  });

  group('Calculate bond', () {
    test(
      'returns success',
      () async {
        final response = await mockRepository.calculateBond(
          productName: 'TahvilBono',
          transactionType: 'Alis',
          isin: 'TRTRTR',
        );

        expect(
          response.whenOrNull(success: (data) => data),
          info,
        );
      },
    );

    test(
      'returns failure',
      () async {
        final response = await mockRepository.calculateBond(
          productName: '',
          transactionType: '',
          isin: '',
        );

        expect(
          response.whenOrNull(failure: (error) => error.getException),
          isA<Exception>(),
        );
      },
    );
  });
}
