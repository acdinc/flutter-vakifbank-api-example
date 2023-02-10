// ignore_for_file: file_names
// VS Code error !?!?!

import 'package:freezed_annotation/freezed_annotation.dart';

part 'bond_Calculator_event.freezed.dart';

@freezed
class BondCalculatorEvent with _$BondCalculatorEvent {
  const factory BondCalculatorEvent.calculateBond({
    required String productName,
    required String transactionType,
    required String isin,
    int? item,
    int? amount,
  }) = CalculateBondBondCalculatorEvent;
}
