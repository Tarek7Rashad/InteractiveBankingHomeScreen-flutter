// ignore: file_names

import 'package:flutter/material.dart';
import 'package:taskkk/shared/constant.dart';

class CustomAnnualYieldRow extends StatefulWidget {
  const CustomAnnualYieldRow({
    super.key,
    required this.title,
    required this.subTitle,
    required this.title2,
    required this.subTitle2,
  });
  final String title;
  final String subTitle;
  final String title2;
  final String subTitle2;

  @override
  State<CustomAnnualYieldRow> createState() => _CustomAnnualYieldRowState();
}

class _CustomAnnualYieldRowState extends State<CustomAnnualYieldRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    color: kInvestText2Color,
                    fontSize: 18,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Text(widget.subTitle,
                      style: const TextStyle(
                        color: kDarkBlueColor,
                        fontSize: 24,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w600,
                      )),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  widget.title2,
                  style: const TextStyle(
                    color: kInvestText2Color,
                    fontSize: 18,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    widget.subTitle2,
                    style: const TextStyle(
                      color: kDarkBlueColor,
                      fontSize: 24,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
