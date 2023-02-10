import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_cases/calculate_bond_use_case.dart';
import 'bond_Calculator_event.dart';
import 'bond_calculator_state.dart';

class BondCalculatorBloc
    extends Bloc<BondCalculatorEvent, BondCalculatorState> {
  BondCalculatorBloc(this.calculateBondUseCase) : super(const InitialState()) {
    on<BondCalculatorEvent>(_mapEventToState);
  }

  final CalculateBondUseCase calculateBondUseCase;

  FutureOr<dynamic> _mapEventToState(
    BondCalculatorEvent event,
    Emitter<BondCalculatorState> emit,
  ) {
    return event.map(
      calculateBond: (event) async {
        emit(const LoadingState());

        final failureOrSuccess = await calculateBondUseCase(
          CalculateBondParams(
            productName: event.productName,
            transactionType: event.transactionType,
            isin: event.isin,
            item: event.item,
            amount: event.amount,
          ),
        );

        return emit(
          failureOrSuccess.when(
            success: LoadedState.new,
            failure: (error) => ErrorState(error.localizedErrorMessage),
          ),
        );
      },
    );
  }
}
