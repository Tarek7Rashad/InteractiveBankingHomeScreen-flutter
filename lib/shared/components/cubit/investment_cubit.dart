import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:taskkk/shared/constant.dart';
import 'package:taskkk/widgets/InvestmentScreenWidgets/CustomInvestAmountContainer.dart';

part 'investment_state.dart';

class InvestmentCubit extends Cubit<InvestmentState> {
  InvestmentCubit() : super(InvestmentInitial());

  bool isClicked = true;

  double term = termmmm;
  changeTermValue() {
    if (isClicked) {
      term = 3;
    } else {
      term = 5;
    }

    emit(ChangeTermValueState());
  }

  // Simulated method for fetching data
  Future<void> fetchData() async {
    try {
      emit(FetchDataLoadingState());
      isLoading = true; // Set loading state to true

      // Simulate fetching data with a delay
      await Future.delayed(const Duration(seconds: 2));

      // After fetching the data (or any operation), set isLoading to false
      emit(FetchDataSuccessState());
      isLoading = false;
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  void incrementInvestmentAmount() async {
    try {
      await fetchData();
      if (investmentAmount < 10000 && investmentAmount >= 250) {
        // Increment or decrement by $1000 until it reaches the minimum amount
        emit(IncrementInvestmentAmountBy1000State());
        investmentAmount += 1000;
      } else {
        // Increment by $10000,00

        investmentAmount += 10000;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  void decrementInvestmentAmount() async {
    try {
      await fetchData();
      if (investmentAmount >= 10250) {
        // Increment or decrement by $10000 until it reaches the minimum amount
        emit(DecrementInvestmentAmountBy10000State());
        investmentAmount -= 10000;
      } else if (investmentAmount <= 10000 && investmentAmount > 1000) {
        emit(DecrementInvestmentAmountBy1000State());
        investmentAmount -= 1000;
      } else if (investmentAmount == 1000 && investmentAmount > minAmount) {
        investmentAmount = minAmount;
        emit(DecrementInvestmentAmountUntil250State());
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }
// another detailed solution ================>
// void decrementInvestmentAmount() {
//     // if (investmentAmount <= minAmount) {
//     if (investmentAmount >= 2000) {
//       // Increment or decrement by $1000 until it reaches the minimum amount
//       setState(() {
//         investmentAmount -= 1000;
//       });
//     } else if (investmentAmount > 1000 && investmentAmount < 2000) {
//       setState(() {
//         investmentAmount -= 100;
//       });
//     } else if (investmentAmount <= 1000 && investmentAmount > 300) {
//       setState(() {
//         investmentAmount -= 100;
//       });
//     } else if (investmentAmount == 300 && investmentAmount > minAmount) {
//       // Decrement by $50,00
//       setState(() {
//         investmentAmount -= 50;
//       });
//     } else {
//       setState(() {
//         investmentAmount = minAmount;
//       });
//     }
//   }

  void incrementContinuously() {
    incrementTimer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      incrementInvestmentAmount();
    });
  }

  void decrementContinuously() {
    incrementTimer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      decrementInvestmentAmount();
    });
  }

  void stopIncrement() {
    incrementTimer.cancel();
  }

  void stopDecrement() {
    incrementTimer.cancel();
  }
}
