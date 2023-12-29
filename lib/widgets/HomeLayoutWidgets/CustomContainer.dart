import 'package:flutter/material.dart';
import 'package:taskkk/shared/constant.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.width,
    required this.height,
    required this.text,
    required this.image,
  });

  final double width;
  final double height;
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 14),
      child: Container(
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(6.0),
        ),
        width: width,
        height: 200,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'bünd',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Lato',
                        color: kDarkBlueColor),
                  ),
                  Text(
                    text,
                    style: TextStyle(
                        color: kGreyColor.withOpacity(.7),
                        fontSize: 26,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: kGreyColor.withOpacity(.1),
                        borderRadius: BorderRadius.circular(6)),
                    width: 120,
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/two-arrows.png',
                          width: 18,
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        const Text(
                          'Start Now',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: kDarkBlueColor,
                              fontFamily: 'Lato'),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Image.asset(
                image,
                width: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
