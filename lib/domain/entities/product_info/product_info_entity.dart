// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_info_entity.freezed.dart';
part 'product_info_entity.g.dart';

@freezed
class ProductInfoEntity with _$ProductInfoEntity {
  ProductInfoEntity._();

  factory ProductInfoEntity({
    @JsonKey(name: 'WithholdingRate') String? withholdingRate,
    @JsonKey(name: 'ExpiryDate') String? expiryDate,
    @JsonKey(name: 'TermDays') String? termDays,
    @JsonKey(name: 'ProductName') String? productName,
    @JsonKey(name: 'PurchaseInterestRate') String? purchaseInterestRate,
    @JsonKey(name: 'ISIN') String? isin,
    @JsonKey(name: 'CurrencyCode') String? currencyCode,
    @JsonKey(name: 'PaperType') String? paperType,
    @JsonKey(name: 'CleanPrice') String? cleanPrice,
    @JsonKey(name: 'SaleInterestRate') String? saleInterestRate,
    @JsonKey(name: 'PaperType2') String? paperType2,
    @JsonKey(name: 'CouponInterestRate') String? couponInterestRate,
    @JsonKey(name: 'PaymentPeriod') String? paymentPeriod,
  }) = _ProductInfoEntity;

  factory ProductInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$ProductInfoEntityFromJson(json);
}
