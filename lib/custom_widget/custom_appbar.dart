import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    required this.Title,
    this.style,
    this.actions,
    this.colors

  });

  final Widget Title;
  final TextStyle? style;
  final List<Widget>? actions;
  final Color ? colors;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:colors,
      title: Title,
      titleTextStyle: style,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}