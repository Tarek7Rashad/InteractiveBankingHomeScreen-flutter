import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taskkk/shared/components/cubit/investment_cubit.dart';
import 'package:taskkk/shared/constant.dart';
import 'package:taskkk/shared/network/local.dart';
import 'package:taskkk/widgets/InvestmentScreenWidgets/CustomAnnualYieldRow.dart';
import 'package:taskkk/widgets/InvestmentScreenWidgets/CustomYearTermRow.dart';

class CustomInvestAmountContainer extends StatefulWidget {
  const CustomInvestAmountContainer({
    super.key,
  });

  @override
  State<CustomInvestAmountContainer> createState() =>
      _CustomInvestAmountContainerState();
}

bool isLoading = false;
double incrementAmount = 10000; // Amount to increment or decrement
double minAmount = 250; // Minimum investment amount
double annualYieldToMaturity = 6.81;
TextEditingController investmentAmountController = TextEditingController();
double investmentAmount = 10000; // Initial investment amount

// Timer for continuous incrementation
Timer incrementTimer = Timer(Duration.zero, () {});

class _CustomInvestAmountContainerState
    extends State<CustomInvestAmountContainer> {
  @override
  void initState() {
    retrieveInvestmentAmount().then((value) {
      log(value.toString());
      investmentAmount = value!; // Print the retrieved value
    }).catchError((onError) {
      log(onError.toString());
      investmentAmount = 10000;
    });
    super.initState();
  }

  @override
  void dispose() {
    incrementTimer.cancel();
    storeInvestmentAmount(investmentAmount);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InvestmentCubit, InvestmentState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BlocProvider.of<InvestmentCubit>(context)
          ..changeTermValue();
        return FutureBuilder(
          future: retrieveInvestmentAmount(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kGreyColor.withOpacity(.2),
                  ),
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: kBlackColor,
                      strokeWidth: 4,
                    ),
                  ),
                ),
              );
            } // Display an error message if any
            else if (snapshot.hasData) {
              return Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x19979FB8),
                            blurRadius: 40,
                            offset: Offset(4, 10),
                            spreadRadius: 0,
                          )
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: kSecondaryColor),
                    child: Column(
                      children: [
                        const Text(
                          'Investment Amount',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kInvestText2Color,
                            fontSize: 14,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: cubit.decrementInvestmentAmount,
                              onLongPressStart: (_) =>
                                  cubit.decrementContinuously(),
                              onLongPressEnd: (_) => cubit.stopDecrement(),
                              onLongPressMoveUpdate: (_) =>
                                  cubit.decrementInvestmentAmount(),
                              child: Container(
                                width: 31.07,
                                height: 32.03,
                                decoration: const ShapeDecoration(
                                  color: kInvestBackgroundIconButton,
                                  shape: OvalBorder(),
                                  shadows: [
                                    BoxShadow(
                                      color: kShadowInvestIconButtonColor,
                                      blurRadius: 4,
                                      offset: Offset(0, 3),
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                child: const Icon(FontAwesomeIcons.minus),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * .7,
                                child: Text(
                                  investmentAmount.toStringAsFixed(2),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: kDarkBlueColor,
                                    fontSize: 36,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: cubit.incrementInvestmentAmount,
                              onLongPressStart: (_) =>
                                  cubit.incrementContinuously(),
                              onLongPressEnd: (_) => cubit.stopIncrement(),
                              onLongPressMoveUpdate: (_) =>
                                  cubit.incrementInvestmentAmount(),
                              child: Container(
                                width: 31.07,
                                height: 32.03,
                                decoration: const ShapeDecoration(
                                  color: kInvestBackgroundIconButton,
                                  shape: OvalBorder(),
                                  shadows: [
                                    BoxShadow(
                                      color: kShadowInvestIconButtonColor,
                                      blurRadius: 4,
                                      offset: Offset(0, 3),
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                child: const Icon(FontAwesomeIcons.plus),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: kGreenColor.withOpacity(.1),
                          ),
                          child: Text(
                            '$annualYieldToMaturity% YTM',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: kGreenColor,
                              fontSize: 13,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w600,
                              height: 1,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // this section belongs to Terms Section
                        const CustomRow(
                          color: kBackgroundForCustomRowContainer,
                          borderColor: kDarkBlueColor,
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        CustomAnnualYieldRow(
                          title: 'Capital At Maturity',
                          subTitle:
                              '\$${(annualYieldToMaturity * cubit.term * investmentAmount) + investmentAmount}',
                          title2: 'Total Interest',
                          subTitle2:
                              '\$${annualYieldToMaturity * cubit.term * investmentAmount}',
                        ),
                        const SizedBox(
                          height: 16,
                        ),

                        CustomAnnualYieldRow(
                          title: 'Annual Interest',
                          subTitle:
                              '${investmentAmount * annualYieldToMaturity}',
                          title2: 'Average Maturity Date',
                          subTitle2:
                              '${(cubit.term + DateTime.now().year).round()}',
                        ),
                      ],
                    ),
                  ),
                  if (isLoading)
                    Positioned.fill(
                      child: Center(
                        child: Container(
                          width: 110,
                          height: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: kGreyColor.withOpacity(.2),
                          ),
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: kBlackColor,
                              strokeWidth: 4,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              );
            } else {
              return Center(
                  child: Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kGreyColor.withOpacity(.2),
                      ),
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: kBlackColor,
                          strokeWidth: 4,
                        ),
                      )));
            }
          },
        );
      },
    );
  }
}
