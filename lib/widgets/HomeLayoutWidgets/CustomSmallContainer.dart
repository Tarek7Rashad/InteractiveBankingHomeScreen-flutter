import 'package:flutter/material.dart';
import 'package:taskkk/shared/constant.dart';

class CustomSmallContainer extends StatelessWidget {
  const CustomSmallContainer({
    super.key,
    required this.icon,
    required this.text,
  });
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: kSeconWhiteColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
          child: Column(
            children: [
              Icon(
                icon,
                color: kDarkBlueColor,
                size: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  text,
                  style: const TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 11.5,
                      fontWeight: FontWeight.w600,
                      color: kSpecialBlackColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
