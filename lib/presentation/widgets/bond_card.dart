import 'package:flutter/material.dart';

import '../../app/constants/app_strings.dart';
import '../../core/extensions/build_context_extension.dart';
import '../../domain/entities/product_info/product_info_entity.dart';

class BondCard extends StatelessWidget {
  const BondCard({
    super.key,
    required this.productInfo,
    required this.onTap,
  });

  final ProductInfoEntity productInfo;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: _decoration(context),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: _leading(context),
          title: _title,
          subtitle: _subTitle,
          trailing: _trailing(context),
        ),
      ),
    );
  }

  CircleAvatar _leading(BuildContext context) {
    return CircleAvatar(
      backgroundColor: context.primaryColor.withOpacity(0.1),
      child: Text(_exchange(productInfo.currencyCode)),
    );
  }

  Text get _title {
    return Text(productInfo.isin ?? '');
  }

  Text get _subTitle {
    return Text(productInfo.cleanPrice ?? '');
  }

  Column _trailing(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.calculate_outlined,
          color: context.primaryColor.withOpacity(0.5),
        ),
        const SizedBox(height: 8),
        Text(
          AppStrings.calculate,
          style: context.textTheme.bodySmall,
        ),
      ],
    );
  }

  BoxDecoration _decoration(BuildContext context) {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        width: 0.4,
        color: context.primaryColor.withOpacity(0.6),
      ),
    );
  }

  String _exchange(String? currencyCode) {
    switch (currencyCode) {
      case 'TL':
        return '₺';
      case 'USD':
        return r'$';
      case 'EUR':
        return '€';
      default:
        return '';
    }
  }
}
