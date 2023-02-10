import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/calculated_bond_info.dart/calculated_bond_info_entity.dart';

part 'bond_calculator_state.freezed.dart';

@freezed
class BondCalculatorState with _$BondCalculatorState {
  const factory BondCalculatorState.initial() = InitialState;
  const factory BondCalculatorState.loading() = LoadingState;
  const factory BondCalculatorState.error(String errorMessage) = ErrorState;
  const factory BondCalculatorState.loaded(CalculatedBondInfoEntity data) =
      LoadedState;
}
