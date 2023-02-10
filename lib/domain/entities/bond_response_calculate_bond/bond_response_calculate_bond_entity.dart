// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../info/info_entity.dart';

part 'bond_response_calculate_bond_entity.freezed.dart';
part 'bond_response_calculate_bond_entity.g.dart';

@freezed
class BondResponseCalculateBondEntity with _$BondResponseCalculateBondEntity {
  BondResponseCalculateBondEntity._();

  factory BondResponseCalculateBondEntity({
    @JsonKey(name: 'Header') Map<String, dynamic>? header,
    @JsonKey(name: 'Data') InfoEntity? info,
    String? scope,
  }) = _BondResponseCalculateBondEntity;

  factory BondResponseCalculateBondEntity.fromJson(Map<String, dynamic> json) =>
      _$BondResponseCalculateBondEntityFromJson(json);
}

BondResponseCalculateBondEntity deserializeBondResponseCalculateBondEntity(
  Map<String, dynamic> json,
) =>
    BondResponseCalculateBondEntity.fromJson(json);
