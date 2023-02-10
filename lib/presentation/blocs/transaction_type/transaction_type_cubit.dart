import 'package:flutter_bloc/flutter_bloc.dart';

enum TransactionType {
  sell('Sell', 'Satis'),
  buy('Buy', 'Alis'),
  ;

  const TransactionType(
    this.text,
    this.requestValue,
  );

  final String text;
  final String requestValue;
}

class TransactionTypeCubit extends Cubit<TransactionType?> {
  TransactionTypeCubit() : super(null);

  void setTab(TransactionType type) => emit(type);
}
