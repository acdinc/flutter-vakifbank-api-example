// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'calculated_bond_info_entity.freezed.dart';
part 'calculated_bond_info_entity.g.dart';

@freezed
class CalculatedBondInfoEntity with _$CalculatedBondInfoEntity {
  CalculatedBondInfoEntity._();

  factory CalculatedBondInfoEntity({
    @JsonKey(name: 'WithholdingRate') String? withholdingRate,
    @JsonKey(name: 'WithholdingAmount') String? withholdingAmount,
    @JsonKey(name: 'Item') String? item,
    @JsonKey(name: 'GrossYield') String? grossYield,
    @JsonKey(name: 'PurchaseInterestRate') String? purchaseInterestRate,
    @JsonKey(name: 'DirtyPrice') String? dirtyPrice,
    @JsonKey(name: 'Amount') String? amount,
    @JsonKey(name: 'NetAmount') String? netAmount,
    @JsonKey(name: 'CleanPrice') String? cleanPrice,
    @JsonKey(name: 'CouponUnitPrice') String? couponUnitPrice,
  }) = _CalculatedBondInfoEntity;

  factory CalculatedBondInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$CalculatedBondInfoEntityFromJson(json);
}
