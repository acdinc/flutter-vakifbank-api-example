import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_cases/fetch_bond_list_use_case.dart';
import 'bond_list_event.dart';
import 'bond_list_state.dart';

class BondListBloc extends Bloc<BondListEvent, BondListState> {
  BondListBloc(this.fetchBondListUseCase) : super(const InitialState()) {
    on<BondListEvent>(_mapEventToState);
  }

  final FetchBondListUseCase fetchBondListUseCase;

  FutureOr<dynamic> _mapEventToState(
    BondListEvent event,
    Emitter<BondListState> emit,
  ) {
    return event.map(
      fetchBondList: (event) async {
        emit(const LoadingState());

        final failureOrSuccess = await fetchBondListUseCase(
          FetchBondListParams(
            productName: event.productName,
            transactionType: event.transactionType,
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
