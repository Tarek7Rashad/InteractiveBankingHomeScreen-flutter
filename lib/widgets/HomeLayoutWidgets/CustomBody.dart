import 'package:flutter/material.dart';
import 'package:taskkk/model/ContainerModel.dart';
import 'package:taskkk/shared/constant.dart';
import 'package:taskkk/widgets/HomeLayoutWidgets/CustomContainer.dart';
import 'package:taskkk/widgets/HomeLayoutWidgets/CustomPage1Column.dart';
import 'package:taskkk/widgets/HomeLayoutWidgets/CustomPage2Column.dart';
import 'package:taskkk/widgets/HomeLayoutWidgets/CustomPage3Column.dart';
import 'package:taskkk/widgets/HomeLayoutWidgets/CustomPage4Column.dart';

class CustomBody extends StatelessWidget {
  const CustomBody({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;
  final List<ContainerModel> containers = const [
    ContainerModel(text: "Standard", logo: 'assets/images/Dukascopy.logo.png'),
    ContainerModel(text: "Plus", logo: 'assets/images/CIM_BANQUE_LOGO.png'),
    ContainerModel(text: "Max", logo: 'assets/images/UBS-logo.png'),
    ContainerModel(text: "Unlimited", logo: 'assets/images/UBS-logo.png'),
  ];
  final List<Widget> bodyColumn = const [
    CustomPage1Column(),
    CustomPage2Column(),
    CustomPage3Column(),
    CustomPage4Column(),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 620,
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: containers.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SizedBox(
            width: width,
            child: Padding(
              padding: const EdgeInsets.only(top: 15, left: 16),
              child: Container(
                color: kMainColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                    ),
                    CustomContainer(
                      width: width,
                      height: height,
                      image: containers[index].logo,
                      text: containers[index].text,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.circle_rounded,
                          size: 16,
                          color: index == 0 ? kDarkBlueColor : kCircleIconColor,
                        ),
                        SizedBox(
                          width: width * .01,
                        ),
                        Icon(
                          Icons.circle_rounded,
                          size: 16,
                          color: index == 1 ? kDarkBlueColor : kCircleIconColor,
                        ),
                        SizedBox(
                          width: width * .01,
                        ),
                        Icon(
                          Icons.circle_rounded,
                          size: 16,
                          color: index == 2 ? kDarkBlueColor : kCircleIconColor,
                        ),
                        SizedBox(
                          width: width * .01,
                        ),
                        Icon(
                          Icons.circle_rounded,
                          size: 16,
                          color: index == 3 ? kDarkBlueColor : kCircleIconColor,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    showBodyColumn(index, bodyColumn),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget showBodyColumn(int index, List<Widget> bodyColumn) {
  if (index == 0) {
    return bodyColumn[index];
  }
  if (index == 1) {
    return bodyColumn[index];
  }
  if (index == 2) {
    return bodyColumn[index];
  }
  if (index == 3) {
    return bodyColumn[index];
  }
  return bodyColumn[index];
}
