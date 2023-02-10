import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../data/local_data_source/local_data_source.dart';
import '../data/remote_data_source/auth/auth_remote_data_source.dart';
import '../data/remote_data_source/bond/bond_remote_data_source.dart';
import '../data/remote_data_source/custom_interceptor.dart';
import '../data/repositories/auth_repository_impl.dart';
import '../data/repositories/bond_repository_impl.dart';
import '../domain/respositories/auth_repository.dart';
import '../domain/respositories/bond_repository.dart';
import '../domain/use_cases/auth_login_use_case.dart';
import '../domain/use_cases/calculate_bond_use_case.dart';
import '../domain/use_cases/fetch_bond_list_use_case.dart';
import '../presentation/blocs/auth/auth_bloc.dart';
import '../presentation/blocs/bond_calculator/bond_calculator_bloc.dart';
import '../presentation/blocs/bond_list/bond_list_bloc.dart';
import '../presentation/blocs/bond_type/bond_type_cubit.dart';
import '../presentation/blocs/transaction_type/transaction_type_cubit.dart';

// service locator
final sl = GetIt.instance;

Future<void> init() async {
  // hive local db init
  final box = await LocalDataSourceImpl.init();
  // locators
  sl
    // external
    ..registerLazySingleton<Box<dynamic>>(
      () => box,
    )
    ..registerLazySingleton<Dio>(
      () => Dio()..interceptors.add(CustomInterceptor()),
    )
    // data sources
    ..registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl(sl()),
    )
    ..registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSource(sl()),
    )
    ..registerLazySingleton<BondRemoteDataSource>(
      () => BondRemoteDataSource(sl()),
    )
    // repositories
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        remoteDataSource: sl(),
        localDataSource: sl(),
      ),
    )
    ..registerLazySingleton<BondRepository>(
      () => BondRepositoryImpl(
        remoteDataSource: sl(),
        localDataSource: sl(),
      ),
    )
    // use cases
    ..registerLazySingleton(() => AuthLoginUseCase(sl()))
    ..registerLazySingleton(() => FetchBondListUseCase(sl()))
    ..registerLazySingleton(() => CalculateBondUseCase(sl()))
    // blocs
    ..registerFactory(() => AuthBloc(sl()))
    ..registerFactory(() => BondListBloc(sl()))
    ..registerFactory(() => BondCalculatorBloc(sl()))
    ..registerFactory(BondTypeCubit.new)
    ..registerFactory(TransactionTypeCubit.new);
}
