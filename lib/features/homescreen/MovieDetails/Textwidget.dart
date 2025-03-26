import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  String text;
  TextStyle style;
  TextWidget ({required this.text, required this.style});

  @override
  Widget build(BuildContext context) {
    return  DefaultTextStyle(style: style, child: Text(text));
  }
}
