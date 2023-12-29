import 'package:flutter/material.dart';
import 'package:taskkk/shared/constant.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: kSecondaryColor,
                child: Icon(
                  Icons.person_2_outlined,
                  size: 32,
                  color: kBlackColor,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Good Morning',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Mehemet Tester',
                    style: TextStyle(
                        fontSize: 18,
                        color: kBlackColor,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              )
            ],
          ),
          CircleAvatar(
            radius: 30,
            backgroundColor: kSecondaryColor,
            child: Icon(
              Icons.notifications_rounded,
              size: 32,
              color: kBlackColor,
            ),
          )
        ],
      ),
    );
  }
}
