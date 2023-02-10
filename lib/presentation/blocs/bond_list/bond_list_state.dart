import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/product_info/product_info_entity.dart';

part 'bond_list_state.freezed.dart';

@freezed
class BondListState with _$BondListState {
  const factory BondListState.initial() = InitialState;
  const factory BondListState.loading() = LoadingState;
  const factory BondListState.error(String errorMessage) = ErrorState;
  const factory BondListState.loaded(List<ProductInfoEntity> data) =
      LoadedState;
}
