// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vakifbank/domain/entities/product/product_entity.dart';

part 'bond_response_entity.freezed.dart';
part 'bond_response_entity.g.dart';

@freezed
class BondResponseEntity with _$BondResponseEntity {
  BondResponseEntity._();

  factory BondResponseEntity({
    @JsonKey(name: 'Header') Map<String, dynamic>? header,
    @JsonKey(name: 'Data') ProductEntity? product,
    String? scope,
  }) = _BondResponseEntity;

  factory BondResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$BondResponseEntityFromJson(json);
}

BondResponseEntity deserializeBondResponseEntity(Map<String, dynamic> json) =>
    BondResponseEntity.fromJson(json);
