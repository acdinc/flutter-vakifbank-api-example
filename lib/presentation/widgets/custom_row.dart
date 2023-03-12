import 'package:flutter/cupertino.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({
    required this.text,
    required this.value,
    super.key,
  });

  final String text;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return CupertinoFormRow(
      padding: const EdgeInsets.fromLTRB(28, 16, 16, 16),
      child: Row(
        children: [
          Text(text),
          const Spacer(),
          Text(value ?? ''),
        ],
      ),
    );
  }
}
