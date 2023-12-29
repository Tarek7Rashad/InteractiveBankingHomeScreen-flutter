import 'package:flutter/material.dart';
import 'package:taskkk/shared/constant.dart';
import 'package:taskkk/widgets/HomeLayoutWidgets/CustomHeader.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 16,
      left: 16,
      child: Container(
        height: 56,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: kDarkBlueColor,
        ),
        child: MaterialButton(
          textColor: kSecondaryColor,
          onPressed: () {},
          child: const Center(
            child: CustomHeader(
              text: 'Create Investment Account',
              headerColor: kSecondaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
