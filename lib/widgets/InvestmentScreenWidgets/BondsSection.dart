import 'package:flutter/material.dart';
import 'package:taskkk/widgets/InvestmentScreenWidgets/CustomBondsCard.dart';

class BondsSection extends StatelessWidget {
  const BondsSection({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCard(
          width: width,
          image: 'assets/images/netflix.png',
          title: 'Netflix INC',
          subTitle: 'BBB',
          trailing: '5.37% APY',
        ),
        const SizedBox(
          height: 16,
        ),
        CustomCard(
          width: width,
          image: 'assets/images/ford.png',
          title: 'Ford Motor LLC',
          subTitle: 'BB+',
          trailing: '7.71% APY',
        ),
        const SizedBox(
          height: 16,
        ),
        CustomCard(
          width: width,
          image: 'assets/images/apple.png',
          title: 'Apple INC',
          subTitle: 'AA+',
          trailing: '4.85% APY',
        ),
        const SizedBox(
          height: 16,
        ),
        CustomCard(
          width: width,
          image: 'assets/images/Morgan Stanley.png',
          title: 'Morgan Stanley',
          subTitle: 'A-',
          trailing: '6.27% APY',
        )
      ],
    );
  }
}
