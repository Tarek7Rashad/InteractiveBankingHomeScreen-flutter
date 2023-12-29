import 'package:flutter/material.dart';
import 'package:taskkk/shared/constant.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
    required this.text,
    this.fontSize = 18,
    this.headerColor = kDarkBlueColor,
    this.fontWeight = FontWeight.w600,
    this.height,
  });
  final String text;
  final double fontSize;
  final Color headerColor;
  final FontWeight fontWeight;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          height: height,
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: headerColor,
          fontFamily: 'Lato'),
    );
  }
}
