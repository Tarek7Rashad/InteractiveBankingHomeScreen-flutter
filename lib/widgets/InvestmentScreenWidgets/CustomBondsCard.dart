import 'package:flutter/material.dart';
import 'package:taskkk/shared/constant.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.width,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.trailing,
  });

  final double width;
  final String image;
  final String title;
  final String subTitle;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      padding: const EdgeInsets.all(8),
      width: width,
      decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color(0x19979FB8),
              blurRadius: 40,
              offset: Offset(4, 10),
              spreadRadius: 0,
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: kInvestBackgroundIconButton,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      image,
                      width: 70,
                      height: 70,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        subTitle,
                        style: const TextStyle(
                          color: kFooterContainerSubTitle,
                          fontSize: 16,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Text(
              trailing,
              style: const TextStyle(
                color: Color(0xFF46AF35),
                fontSize: 18,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w600,
                height: 0.10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
