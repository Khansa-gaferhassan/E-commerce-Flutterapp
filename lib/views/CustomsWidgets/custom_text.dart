import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final text;
  final color;
  final fontSize;
  final int? maxLine;
  final Alignment alignment;
  final lineHeight;
  const CustomText(
      {this.text = "",
      this.color = Colors.pinkAccent,
      this.fontSize = 18.0,
      this.maxLine,
      this.lineHeight,
      this.alignment = Alignment.topLeft});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          height: lineHeight,
          fontSize: fontSize,
        ),
        maxLines: maxLine,
      ),
    );
  }
}
