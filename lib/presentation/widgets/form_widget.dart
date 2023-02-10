import 'package:flutter/cupertino.dart';

import '../../app/constants/app_strings.dart';
import '../../core/extensions/build_context_extension.dart';
import '../../domain/entities/form_data/form_data_entity.dart';
import 'custom_button.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key, required this.onValidated});

  final void Function(FormDataEntity data) onValidated;

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _itemController;
  late final TextEditingController _amountController;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey();
    _itemController = TextEditingController();
    _amountController = TextEditingController();
  }

  @override
  void dispose() {
    _itemController.dispose();
    _amountController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  void _calculate() {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final formData = FormDataEntity(
      item: int.tryParse(_itemController.text),
      amount: int.tryParse(_amountController.text),
    );

    widget.onValidated(formData);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CupertinoFormSection.insetGrouped(
          backgroundColor: context.scaffoldBackgroundColor,
          margin: EdgeInsets.zero,
          children: [
            _itemFormRow(context),
            _amountFormRow(context),
          ],
        ),
        const SizedBox(height: 24),
        CustomButton(
          onPressed: _calculate,
          text: AppStrings.calculate,
          buttonOpacity: 0.05,
        ),
      ],
    );
  }

  CupertinoFormRow _itemFormRow(BuildContext context) {
    return CupertinoFormRow(
      padding: const EdgeInsets.only(left: 28),
      prefix: Text(
        AppStrings.quantity,
        style: context.textTheme.bodySmall,
      ),
      child: CupertinoTextFormFieldRow(
        controller: _itemController,
        validator: _validator,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
      ),
    );
  }

  CupertinoFormRow _amountFormRow(BuildContext context) {
    return CupertinoFormRow(
      padding: const EdgeInsets.only(left: 28),
      prefix: Text(
        AppStrings.amount,
        style: context.textTheme.bodySmall,
      ),
      child: CupertinoTextFormFieldRow(
        controller: _amountController,
        validator: _validator,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
      ),
    );
  }

  String? _validator(String? value) {
    final item = _itemController.text;
    final amount = _amountController.text;

    if (item.isEmpty && amount.isEmpty) {
      return AppStrings.quantityOrAmount;
    } else if (item.isNotEmpty && amount.isNotEmpty) {
      _itemController.clear();
      _amountController.clear();
      return AppStrings.quantityOrAmount;
    }
    {
      return null;
    }
  }
}
