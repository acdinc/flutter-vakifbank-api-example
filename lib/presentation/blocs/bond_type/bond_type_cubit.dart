import 'package:flutter_bloc/flutter_bloc.dart';

enum BondType {
  tahvil('Tahvil Bono', 'TahvilBono'),
  eurobond('Eurobond', 'Eurobond'),
  ;

  const BondType(
    this.text,
    this.requestValue,
  );

  final String text;
  final String requestValue;
}

class BondTypeCubit extends Cubit<BondType?> {
  BondTypeCubit() : super(null);

  void setTab(BondType type) => emit(type);
}
