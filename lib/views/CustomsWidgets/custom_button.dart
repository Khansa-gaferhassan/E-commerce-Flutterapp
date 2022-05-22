import 'package:e_nosa/views/CustomsWidgets/custom_text.dart';
import 'package:e_nosa/views/constant.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {this.text, this.alignment = Alignment.center, this.color});
  final color;
  final text;

  final Alignment alignment;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ElevatedButton(
      style: ElevatedButton.styleFrom(primary: primary_color),
      onPressed: () {},
      child: CustomText(text: text, color: color, alignment: alignment),
    ));
  }
}
