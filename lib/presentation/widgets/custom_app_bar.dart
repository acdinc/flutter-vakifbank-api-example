import 'package:flutter/material.dart';

import '../../core/extensions/build_context_extension.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      leading: _leading(context),
      title: _title(context),
    );
  }

  IconButton _leading(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(
        Icons.close,
        color: Colors.black87,
      ),
    );
  }

  Text _title(BuildContext context) {
    return Text(
      title,
      style: TextStyle(color: context.primaryColor),
    );
  }
}
