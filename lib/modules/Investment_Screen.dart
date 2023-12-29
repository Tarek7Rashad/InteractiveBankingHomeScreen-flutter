import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taskkk/shared/components/cubit/investment_cubit.dart';
import 'package:taskkk/shared/constant.dart';
import 'package:taskkk/widgets/HomeLayoutWidgets/CustomHeader.dart';
import 'package:taskkk/widgets/InvestmentScreenWidgets/BondsSection.dart';
import 'package:taskkk/widgets/InvestmentScreenWidgets/CustomAnnualYieldRow.dart';
import 'package:taskkk/widgets/InvestmentScreenWidgets/CustomButton.dart';
import 'package:taskkk/widgets/InvestmentScreenWidgets/CustomInvestAmountContainer.dart';
import 'package:taskkk/widgets/InvestmentScreenWidgets/CustomYearTermRow.dart';

class InvestmentScreen extends StatefulWidget {
  const InvestmentScreen({super.key});
  static const String id = 'Investments';

  @override
  State<InvestmentScreen> createState() => _InvestmentScreenState();
}

class _InvestmentScreenState extends State<InvestmentScreen> {
  // bool _isLoading = true;

  Future<void> _refresh() async {
    setState(() {});
    // Perform your refresh action here
    // For example, fetch updated data
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => InvestmentCubit(),
      child: BlocConsumer<InvestmentCubit, InvestmentState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: 30,
            ),
            body: RefreshIndicator(
              color: kDarkBlueColor,
              onRefresh: _refresh,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 80),
                    child: ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 18,
                            ),
                            child: SizedBox(
                              width: 24,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                      splashColor: Colors.transparent,
                                      splashRadius: .1,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(
                                          FontAwesomeIcons.angleLeft)),
                                  const Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: CustomHeader(
                                            text: 'Fixed Income',
                                            headerColor: kInvestBlackColor,
                                            fontSize: 24,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CustomHeader(
                                  text: 'Fixed Income Portfolio',
                                  headerColor: kSpecialBlackColor,
                                  fontSize: 22.5,
                                  fontWeight: FontWeight.w700,
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                const SizedBox(
                                  child: CustomHeader(
                                    text:
                                        'A fixed income portfolio consists of bonds and other securities providing steady income and relatively lower risk.',
                                    headerColor: kInvestTextColor,
                                    height: 1.5,
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // this {Annual Yield To Maturity (YTM)} Header Text
                                        CustomHeader(
                                          text:
                                              'Annual Yield To Maturity (YTM)',
                                          fontSize: 20,
                                          headerColor: kInvestText2Color,
                                        ),
                                        SizedBox(
                                          width: 2.0,
                                        ),
                                        Icon(
                                          FontAwesomeIcons.circleInfo,
                                          color: kInvestText2Color,
                                        )
                                      ],
                                    ),
                                    Padding(
                                        //this {Annual Yield To Maturity} percentage text
                                        padding:
                                            EdgeInsets.symmetric(vertical: 16),
                                        child: CustomHeader(
                                          text: '6.81%',
                                          fontSize: 32,
                                        ))
                                  ],
                                ),
                                //this CustomAnnualYieldRow Section
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  child: CustomAnnualYieldRow(
                                    title: 'Average Rating',
                                    subTitle: 'AA',
                                    title2: 'Bonds',
                                    subTitle2: '20 Companies',
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const CustomHeader(
                                        text: 'Term Types',
                                        headerColor: kInvestText2Color,
                                      ),
                                      const SizedBox(
                                        height: 13,
                                      ),
                                      const CustomRow(), //this CustomRow using in {Annual Yield To Maturity (YTM)} section and {Investment Calculator} section
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      const CustomHeader(
                                          text:
                                              'Investment Calculator'), //this Header For Investment Amount Section
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      const CustomInvestAmountContainer(), //this CustomInvestAmountContainer Section
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 16),
                                        child: CustomHeader(
                                            text:
                                                'Bonds'), //this Header For Bonds Section
                                      ),
                                      BondsSection(width: width)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ]),
                  ),
                  CustomButton(
                      width: width), // Create Investment Account Button
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
