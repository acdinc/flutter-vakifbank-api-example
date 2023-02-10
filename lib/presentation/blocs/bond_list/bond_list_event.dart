import 'package:freezed_annotation/freezed_annotation.dart';

part 'bond_list_event.freezed.dart';

@freezed
class BondListEvent with _$BondListEvent {
  const factory BondListEvent.fetchBondList({
    required String productName,
    required String transactionType,
  }) = FetchBondListEvent;
}
