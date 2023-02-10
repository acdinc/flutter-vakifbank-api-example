import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';

import '../../../domain/entities/auth_response/auth_response_entity.dart';
import '../remote_data_helper.dart';

part 'auth_remote_data_source.g.dart';

@RestApi(
  baseUrl: RemoteData.baseUrl,
  parser: Parser.FlutterCompute,
)
abstract class AuthRemoteDataSource {
  factory AuthRemoteDataSource(Dio dio, {String baseUrl}) =
      _AuthRemoteDataSource;

  @POST(RemoteData.authenticationPath)
  Future<AuthResponseEntity?> authenticate({
    @Query(AuthRequest.clientId) required String clientId,
    @Query(AuthRequest.clientSecret) required String clientSecret,
    @Query(AuthRequest.grantType) required String grantType,
    @Query(AuthRequest.scope) required String scope,
  });
}
