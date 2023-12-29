import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taskkk/widgets/HomeLayoutWidgets/CustomHeader.dart';
import 'package:taskkk/widgets/HomeLayoutWidgets/CustomSmallContainer.dart';

class CustomPage1Column extends StatelessWidget {
  const CustomPage1Column({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 14),
          child: CustomHeader(
            text: 'Conditions',
          ),
        ),
        Row(
          children: [
            Expanded(
              child: CustomSmallContainer(
                icon: FontAwesomeIcons.archway,
                text: 'No Minimum Deposit',
              ),
            ),
            SizedBox(
              width: 13,
            ),
            Expanded(
              child: CustomSmallContainer(
                icon: FontAwesomeIcons.buildingColumns,
                text: r'$15/Month (Paid Annually)',
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 14),
          child: CustomHeader(
            text: 'What You Get',
          ),
        ),
        Row(
          children: [
            Expanded(
              child: CustomSmallContainer(
                icon: FontAwesomeIcons.buildingColumns,
                text: 'Swiss Bank Account',
              ),
            ),
            SizedBox(
              width: 13,
            ),
            Expanded(
              child: CustomSmallContainer(
                icon: FontAwesomeIcons.creditCard,
                text: 'Mastercard Prepaid',
              ),
            ),
            SizedBox(
              width: 13,
            ),
            Expanded(
              child: CustomSmallContainer(
                icon: FontAwesomeIcons.boltLightning,
                text: 'Account Open Same Day',
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Expanded(
              child: CustomSmallContainer(
                icon: FontAwesomeIcons.umbrella,
                text: r'Protected up to $100,000',
              ),
            ),
            SizedBox(
              width: 13,
            ),
            Expanded(
              child: Opacity(
                opacity: .1,
                child: CustomSmallContainer(
                  icon: FontAwesomeIcons.seedling,
                  text: 'Mastercard Prepaid',
                ),
              ),
            ),
            SizedBox(
              width: 13,
            ),
            Expanded(
              child: Opacity(
                opacity: .1,
                child: CustomSmallContainer(
                  icon: FontAwesomeIcons.vault,
                  text: 'Deposits Options',
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
