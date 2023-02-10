import 'package:flutter/material.dart';

import '../../core/extensions/build_context_extension.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.buttonOpacity,
    this.textColor,
    this.loadingText,
  });

  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final double? buttonOpacity;
  final Color? textColor;
  final String? loadingText;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: _style(context),
      onPressed: isLoading ? () {} : onPressed,
      child: Text(
        isLoading ? (loadingText ?? text) : text,
        style: TextStyle(color: textColor),
      ),
    );
  }

  ButtonStyle _style(BuildContext context) {
    return OutlinedButton.styleFrom(
      backgroundColor: buttonOpacity == null
          ? null
          : context.primaryColor.withOpacity(buttonOpacity!),
      padding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
