import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';

import '../../../domain/entities/bond_response/bond_response_entity.dart';
import '../../../domain/entities/bond_response_calculate_bond/bond_response_calculate_bond_entity.dart';
import '../remote_data_helper.dart';

part 'bond_remote_data_source.g.dart';

@RestApi(
  baseUrl: RemoteData.baseUrl,
  parser: Parser.FlutterCompute,
)
abstract class BondRemoteDataSource {
  factory BondRemoteDataSource(Dio dio, {String baseUrl}) =
      _BondRemoteDataSource;

  @POST(RemoteData.bondListPath)
  Future<BondResponseEntity?> fetchBondList({
    @Field(BondRequest.productName) required String productName,
    @Field(BondRequest.transactionType) required String transactionType,
  });

  @POST(RemoteData.bondCalculatorPath)
  Future<BondResponseCalculateBondEntity?> calculateBond({
    @Field(BondRequest.productName) required String productName,
    @Field(BondRequest.transactionType) required String transactionType,
    @Field(BondRequest.isin) required String isin,
    @Field(BondRequest.item) int? item,
    @Field(BondRequest.amount) int? amount,
  });
}
