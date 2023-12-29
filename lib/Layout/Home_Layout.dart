import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taskkk/shared/constant.dart';
import 'package:taskkk/widgets/HomeLayoutWidgets/CustomAppBar.dart';
import 'package:taskkk/widgets/HomeLayoutWidgets/CustomBody.dart';
import 'package:taskkk/modules/Investment_Screen.dart';
import 'package:taskkk/widgets/InvestmentScreenWidgets/CustomInvestAmountContainer.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});
  static const String id = 'HomeLayout';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

int currentIndex = 0;
bool _isLoading = true;

class _HomeLayoutState extends State<HomeLayout> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            if (value == 1) {
              Navigator.of(context).push(PageRouteBuilder(
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.easeInOutBack;
                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);
                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
                pageBuilder: (context, animation, secondaryAnimation) {
                  return const InvestmentScreen();
                },
              ));
            } else {
              currentIndex = value;
              setState(() {});
            }
          },
          backgroundColor: kSecondaryColor,
          elevation: 0,
          selectedItemColor: kDarkBlueColor,
          selectedLabelStyle: const TextStyle(fontSize: 18),
          unselectedLabelStyle: const TextStyle(fontSize: 16),
          unselectedItemColor: kGreyColor.withOpacity(.7),
          iconSize: 24,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.houseChimney,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.chartLine,
                ),
                label: "Investment"),
            BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.commentDots,
                ),
                label: "Chat"),
          ]),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 30,
        automaticallyImplyLeading: false,
      ),
      body: Stack(children: [
        Visibility(
          visible: !isLoading,
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              const CustomAppBar(),
              CustomBody(width: width, height: height)
            ],
          ),
        ),
        Visibility(
          visible: _isLoading,
          child: Positioned.fill(
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
        )
      ]),
    );
  }
}
