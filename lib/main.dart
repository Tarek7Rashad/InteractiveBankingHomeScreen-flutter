import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskkk/Layout/Home_Layout.dart';
import 'package:taskkk/shared/constant.dart';
import 'package:taskkk/modules/Investment_Screen.dart';

void main() {
  runApp(const FlutterTask());
}

class FlutterTask extends StatelessWidget {
  const FlutterTask({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      initialRoute: HomeLayout.id,
      debugShowCheckedModeBanner: false,
      routes: {
        HomeLayout.id: (context) => const HomeLayout(),
        InvestmentScreen.id: (context) => const InvestmentScreen(),
      },
      theme: ThemeData(
          scaffoldBackgroundColor: kMainColor,
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              systemNavigationBarIconBrightness: Brightness.dark,
              // Status bar color
              statusBarColor: Colors.transparent,
              // Status bar brightness (optional)
              statusBarIconBrightness:
                  Brightness.dark, // For Android (dark icons)
              statusBarBrightness: Brightness.light, // For iOS (dark icons)
            ),
          )),
    );
  }
}
