// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../calculated_bond_info.dart/calculated_bond_info_entity.dart';

part 'info_entity.freezed.dart';
part 'info_entity.g.dart';

@freezed
class InfoEntity with _$InfoEntity {
  InfoEntity._();

  factory InfoEntity({
    @JsonKey(name: 'Info') CalculatedBondInfoEntity? calculatedBondInfoEntity,
  }) = _InfoEntity;

  factory InfoEntity.fromJson(Map<String, dynamic> json) =>
      _$InfoEntityFromJson(json);
}
