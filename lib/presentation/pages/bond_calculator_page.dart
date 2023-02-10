import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/constants/app_strings.dart';
import '../../app/injection_container.dart';
import '../../core/extensions/build_context_extension.dart';
import '../../domain/entities/form_data/form_data_entity.dart';
import '../../domain/entities/product_info/product_info_entity.dart';
import '../blocs/bond_calculator/bond_Calculator_event.dart';
import '../blocs/bond_calculator/bond_calculator_bloc.dart';
import '../blocs/bond_calculator/bond_calculator_state.dart';
import '../blocs/bond_type/bond_type_cubit.dart';
import '../blocs/transaction_type/transaction_type_cubit.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_error_widget.dart';
import '../widgets/custom_loading_widget.dart';
import '../widgets/custom_row.dart';
import '../widgets/form_widget.dart';

class BondCalculatorPage extends StatelessWidget {
  const BondCalculatorPage({
    super.key,
    required this.bondType,
    required this.transactionType,
    required this.productInfo,
  });

  final BondType bondType;
  final TransactionType transactionType;
  final ProductInfoEntity productInfo;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<BondCalculatorBloc>(),
      child: _BondCalculatorView(
        bondType: bondType,
        productInfo: productInfo,
        transactionType: transactionType,
      ),
    );
  }
}

class _BondCalculatorView extends StatelessWidget {
  const _BondCalculatorView({
    required this.bondType,
    required this.transactionType,
    required this.productInfo,
  });

  final BondType bondType;
  final TransactionType transactionType;
  final ProductInfoEntity productInfo;

  void _calculate({
    required BuildContext context,
    required FormDataEntity formData,
  }) {
    context.read<BondCalculatorBloc>().add(
          CalculateBondBondCalculatorEvent(
            productName: bondType.requestValue,
            transactionType: transactionType.requestValue,
            isin: productInfo.isin ?? '',
            item: formData.item,
            amount: formData.amount,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.calculateBond,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            SelectableText(
              '${productInfo.isin} '
              '${productInfo.productName}',
            ),
            const SizedBox(height: 24),
            FormWidget(
              onValidated: (formData) => _calculate(
                context: context,
                formData: formData,
              ),
            ),
            const SizedBox(height: 24),
            const Expanded(child: _Body()),
          ],
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BondCalculatorBloc, BondCalculatorState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: CustomLoadingWidget.new,
          error: (e) => CustomErrorWidget(errorMessage: e),
          loaded: (data) {
            return Column(
              children: [
                CupertinoFormSection.insetGrouped(
                  backgroundColor: context.scaffoldBackgroundColor,
                  margin: EdgeInsets.zero,
                  children: [
                    CustomRow(
                      text: AppStrings.cleanPrice,
                      value: data.cleanPrice,
                    ),
                    CustomRow(
                      text: AppStrings.dirtyPrice,
                      value: data.dirtyPrice,
                    ),
                    CustomRow(
                      text: AppStrings.couponUnitPrice,
                      value: data.couponUnitPrice,
                    ),
                    CustomRow(
                      text: AppStrings.netAmount,
                      value: data.netAmount,
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }
}
