part of 'investment_cubit.dart';

@immutable
sealed class InvestmentState {}

final class InvestmentInitial extends InvestmentState {}

final class ChangeTermValueState extends InvestmentState {}

final class FetchDataLoadingState extends InvestmentState {}

final class FetchDataSuccessState extends InvestmentState {}

final class IncrementInvestmentAmountBy1000State extends InvestmentState {}

final class IncrementInvestmentAmountBy10000State extends InvestmentState {}

final class DecrementInvestmentAmountBy10000State extends InvestmentState {}

final class DecrementInvestmentAmountBy1000State extends InvestmentState {}

final class DecrementInvestmentAmountUntil250State extends InvestmentState {}
