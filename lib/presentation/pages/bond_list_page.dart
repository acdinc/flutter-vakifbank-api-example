import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/constants/app_constants.dart';
import '../../app/constants/app_strings.dart';
import '../../app/injection_container.dart';
import '../../domain/entities/product_info/product_info_entity.dart';
import '../blocs/bond_list/bond_list_bloc.dart';
import '../blocs/bond_list/bond_list_event.dart';
import '../blocs/bond_list/bond_list_state.dart';
import '../blocs/bond_type/bond_type_cubit.dart';
import '../blocs/transaction_type/transaction_type_cubit.dart';
import '../widgets/bond_card.dart';
import '../widgets/custom_bottom_sheet.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_dialog.dart';
import '../widgets/custom_error_widget.dart';
import '../widgets/custom_loading_widget.dart';
import 'bond_calculator_page.dart';

class BondListPage extends StatelessWidget {
  const BondListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BondListBloc>(
          create: (_) => sl<BondListBloc>(),
        ),
        BlocProvider<BondTypeCubit>(
          create: (_) => sl<BondTypeCubit>(),
        ),
        BlocProvider<TransactionTypeCubit>(
          create: (_) => sl<TransactionTypeCubit>(),
        )
      ],
      child: const _BondListView(),
    );
  }
}

class _BondListView extends StatelessWidget {
  const _BondListView();

  Future<void> _transactionTypeSelectDialog({
    required BuildContext context,
    required BondType bondType,
  }) async {
    final transactionType = await BondActionSelectorDialog(
      bondType: bondType.text,
    ).show(context);

    if (context.mounted && transactionType != null) {
      context.read<BondTypeCubit>().setTab(bondType);
      context.read<TransactionTypeCubit>().setTab(transactionType);

      context.read<BondListBloc>().add(
            FetchBondListEvent(
              productName: bondType.requestValue,
              transactionType: transactionType.requestValue,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          '${AppConstants.apiName} '
          '${context.watch<BondTypeCubit>().state?.text ?? 'Bond'} '
          '${AppStrings.list}',
          // AppStrings.bondList,
          style: const TextStyle(color: Colors.black87),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: BondType.values.map((bondType) {
              return CustomButton(
                text: '${AppStrings.fetch} ${bondType.text}',
                buttonOpacity: 0.1,
                onPressed: () => _transactionTypeSelectDialog(
                  context: context,
                  bondType: bondType,
                ),
              );
            }).toList(),
          ),
          const Expanded(child: _Body()),
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  Future<void> _showBondCalculator({
    required BuildContext context,
    required BondType bondType,
    required TransactionType transactionType,
    required ProductInfoEntity productInfo,
  }) async {
    return CustomModalBottomSheet.show<dynamic>(
      context: context,
      child: BondCalculatorPage(
        bondType: bondType,
        transactionType: transactionType,
        productInfo: productInfo,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BondListBloc, BondListState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: CustomLoadingWidget.new,
          error: (e) => CustomErrorWidget(errorMessage: e),
          loaded: (data) {
            return ListView.builder(
              itemCount: data.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final productInfo = data[index];

                return BondCard(
                  productInfo: productInfo,
                  onTap: () => _showBondCalculator(
                    context: context,
                    bondType: context.read<BondTypeCubit>().state!,
                    transactionType:
                        context.read<TransactionTypeCubit>().state!,
                    productInfo: productInfo,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
