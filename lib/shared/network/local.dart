import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskkk/shared/constant.dart';
import 'package:taskkk/widgets/InvestmentScreenWidgets/CustomInvestAmountContainer.dart';

Future<void> storeInvestmentAmount(double value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setDouble('investmentAmount', investmentAmount);
}

Future<double?> retrieveInvestmentAmount() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  double? value = prefs.getDouble('investmentAmount');
  return value;
}

Future<void> storeTerm(double value) async {
  SharedPreferences prefs2 = await SharedPreferences.getInstance();

  await prefs2.setDouble('term', termmmm);
}

Future<double?> retrieveTerm() async {
  SharedPreferences prefs2 = await SharedPreferences.getInstance();
  double? value = prefs2.getDouble('term');
  return value;
}
