import 'package:flutter/material.dart';

class TextH1 extends StatelessWidget {
  const TextH1({
    super.key,
    required this.text, this.size = 24,
  });

  final String text;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'SupercellMagic',
        fontSize: size,
        height: 1.1,
      ),
    );
  }
}