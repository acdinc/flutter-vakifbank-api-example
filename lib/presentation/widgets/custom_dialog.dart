import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../app/constants/app_strings.dart';
import '../blocs/transaction_type/transaction_type_cubit.dart';

@immutable
class AlertDialogModel<T> {
  const AlertDialogModel({
    required this.title,
    required this.message,
    required this.buttons,
  });

  final String title;
  final String message;
  final Map<String, T> buttons;
}

@immutable
class BondActionSelectorDialog extends AlertDialogModel<TransactionType> {
  BondActionSelectorDialog({required String bondType})
      : super(
          title: '${AppStrings.sellOrBuy} $bondType',
          message: '${AppStrings.chooseTransactionType} $bondType',
          buttons: {
            TransactionType.sell.text: TransactionType.sell,
            TransactionType.buy.text: TransactionType.buy,
          },
        );
}

extension Present<T> on AlertDialogModel<T> {
  Future<T?> show(BuildContext context) {
    return showDialog<T>(
      context: context,
      builder: (context) {
        return Platform.isIOS
            ? CupertinoAlertDialog(
                title: Text(title),
                content: Text(message),
                actions: buttons.entries.map((e) {
                  return CupertinoDialogAction(
                    onPressed: () => Navigator.pop(context, e.value),
                    child: Text(e.key),
                  );
                }).toList(),
              )
            : AlertDialog(
                title: Text(title),
                content: Text(message),
                actions: buttons.entries.map((e) {
                  return TextButton(
                    onPressed: () => Navigator.pop(context, e.value),
                    child: Text(e.key),
                  );
                }).toList(),
              );
      },
    );
  }
}
