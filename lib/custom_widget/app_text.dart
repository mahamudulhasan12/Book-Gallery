import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText({super.key, required this.text, this.tSize, this.tWeight, this.colors, this.tOverflow, this.tDecoration});
  final String text;
  final double ? tSize;
  final FontWeight ? tWeight;
  final Color ? colors;
  final TextOverflow ? tOverflow;
  final TextDecoration ? tDecoration;
  @override
  Widget build(BuildContext context) {
    return  Text(
      text,style: TextStyle(
      fontSize: tSize ?? 14,
      fontWeight: tWeight,
      color: colors ?? Colors.black,
      overflow: tOverflow,
      decoration: tDecoration,
    ),
    );
  }
}
