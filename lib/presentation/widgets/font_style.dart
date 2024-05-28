import 'package:flutter/material.dart';

class TextH1 extends StatelessWidget {
  final bool centerText;
  const TextH1({
    super.key,
    required this.text,
    this.size = 24,
    this.centerText = true,
  });

  final String text;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: centerText ? TextAlign.center : TextAlign.start,
      style: TextStyle(
        fontFamily: 'SupercellMagic',
        fontSize: size,
        height: 1.1,
      ),
    );
  }
}
