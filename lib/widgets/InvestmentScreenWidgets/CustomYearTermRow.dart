import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskkk/shared/components/cubit/investment_cubit.dart';
import 'package:taskkk/shared/constant.dart';
import 'package:taskkk/shared/network/local.dart';

class CustomRow extends StatefulWidget {
  const CustomRow({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.color = kSecondaryColor,
    this.borderColor = kBorderSideColor,
    this.borderWidth = 1.0,
  });

  final MainAxisAlignment mainAxisAlignment;
  final Color color;

  final Color borderColor;
  final double borderWidth;
  @override
  State<CustomRow> createState() => _CustomRowState();
}

double term = InvestmentCubit().term;

class _CustomRowState extends State<CustomRow> {
  Color container1Color = kSecondaryColor; //selected by default
  Color container2Color = kSecondaryColor;
  bool isContainer1Tapped = false;
  bool isContainer2Tapped = false;
  bool isClicked = true;

  @override
  void initState() {
    if (termmmm == 3) {
      container1Color = kBackgroundForCustomRowContainer;
    }
    if (termmmm == 5) {
      container2Color = kBackgroundForCustomRowContainer;  
    }
    retrieveTerm().then((value) {
      log('from initial $term'); // Print the retrieved value
    });

    super.initState();
  }

  @override
  void dispose() {
    storeTerm(term);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<InvestmentCubit, InvestmentState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BlocProvider.of<InvestmentCubit>(context)..isClicked;
        return Row(
          mainAxisAlignment: widget.mainAxisAlignment,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  container1Color = kBackgroundForCustomRowContainer;
                  container2Color = kSecondaryColor;
                  isContainer1Tapped = !isContainer1Tapped;
                  isContainer2Tapped = false;
                  cubit.isClicked = true;
                  cubit.term = 3;
                  term = cubit.term;
                  cubit.changeTermValue();
                  if (isClicked) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(milliseconds: 500),
                        backgroundColor: Colors.white,
                        content: Container(
                          color: Colors.white,
                          child: const Row(
                            children: [
                              Icon(Icons.info_outline, color: Colors.black),
                              SizedBox(width: 8),
                              Text(
                                'Year Term Has Changed',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }

                  isClicked = false;

                  log(cubit.term.toString());
                });
              },
              child: Container(
                width: width * .3,
                height: height * .07,
                padding: const EdgeInsets.all(8.0),
                decoration: ShapeDecoration(
                  color: container1Color,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: isContainer1Tapped ? widget.borderWidth : 0.0,
                      color: widget.borderColor,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Center(
                  child: Text(
                    '3 Year Term',
                    style: TextStyle(
                      color: kSpecialGreyColor,
                      fontSize: 16,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                setState(() {});
                container1Color = kSecondaryColor;
                container2Color = kBackgroundForCustomRowContainer;
                isContainer2Tapped = !isContainer2Tapped;
                isContainer1Tapped = false;
                cubit.isClicked = false;
                cubit.term = 5;
                term = cubit.term;
                cubit.changeTermValue();
                if (isClicked == false) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(milliseconds: 500),
                      backgroundColor: Colors.white,
                      content: Container(
                        color: Colors.white,
                        child: const Row(
                          children: [
                            Icon(Icons.info_outline, color: Colors.black),
                            SizedBox(width: 8),
                            Text(
                              'Year Term Has Changed',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                isClicked = true;
                log(cubit.term.toString());
              },
              child: Container(
                width: width * .3,
                height: height * 0.07,
                padding: const EdgeInsets.all(8.0),
                decoration: ShapeDecoration(
                  color: container2Color,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: isContainer2Tapped ? widget.borderWidth : 0.0,
                        color: widget.borderColor),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Center(
                  child: Text(
                    '5 Year Term',
                    style: TextStyle(
                      color: kSpecialGreyColor,
                      fontSize: 16,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        );
      },
    );
  }
}
