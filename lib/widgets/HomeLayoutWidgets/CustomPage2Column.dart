import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taskkk/widgets/HomeLayoutWidgets/CustomHeader.dart';
import 'package:taskkk/widgets/HomeLayoutWidgets/CustomSmallContainer.dart';

class CustomPage2Column extends StatelessWidget {
  const CustomPage2Column({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 14),
          child: CustomHeader(
            text: 'Conditions',
          ),
        ),
        const Row(
          children: [
            Expanded(
              child: CustomSmallContainer(
                icon: FontAwesomeIcons.archway,
                text: r'$10,000 Minimum',
              ),
            ),
            SizedBox(
              width: 13,
            ),
            Expanded(
              child: CustomSmallContainer(
                icon: FontAwesomeIcons.buildingColumns,
                text: r'$30/Month (Paid Annually)',
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(
            bottom: 14,
          ),
          child: CustomHeader(
            text: 'What You Get',
          ),
        ),
        const Row(
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
                text: 'Mastercard Debit/Credit',
              ),
            ),
            SizedBox(
              width: 13,
            ),
            Expanded(
              child: CustomSmallContainer(
                icon: FontAwesomeIcons.umbrella,
                text: r'Protected up to $100,000',
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            const Expanded(
              child: CustomSmallContainer(
                icon: FontAwesomeIcons.seedling,
                text: 'Investment Portfolios',
              ),
            ),
            const SizedBox(
              width: 13,
            ),
            const Expanded(
              child: CustomSmallContainer(
                icon: FontAwesomeIcons.vault,
                text: 'Fixed Income Deposit',
              ),
            ),
            const SizedBox(
              width: 13,
            ),
            Expanded(
              child: Container(),
            ),
          ],
        )
      ],
    );
  }
}
