import 'package:flutter/material.dart';
import 'package:islamic_app/consts/app_colors.dart';
import 'package:islamic_app/screens/ahadess_screen.dart';
import 'package:islamic_app/screens/quran.dart';
import 'package:islamic_app/screens/radio_screen.dart';
import 'package:islamic_app/screens/tasbeeh_screen.dart';
import 'package:islamic_app/services/assets_manager.dart';
import 'package:islamic_app/widgets/app_name_widget.dart';
import 'package:islamic_app/widgets/bottom_navbar_item.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});
  static const String routeName ="/RootScreen";

  @override
  State<RootScreen> createState() => _RootScreenState();

}

class _RootScreenState extends State<RootScreen> {

  late final PageController _pageController;

  int currentScreen = 0;

  final List<Widget> screens = const [
    RadioScreen(),
    TasbeehScreen(),
    AhadessScreen(),
    QuranScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset(
          AssetsManager.background,
          fit: BoxFit.fill,
          width: size.width,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: appName(),
            centerTitle: true,
            backgroundColor: Colors.transparent,
          ),
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.white54,
            onTap: (index) {
              setState(() {
                currentScreen = index;
                _pageController.jumpToPage(currentScreen);
              });
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.bottomNavBarColor,
            currentIndex: currentScreen,
            items: [
              bottomNavBarItem(icon: AssetsManager.radio, label: "الراديو"),
              bottomNavBarItem(icon: AssetsManager.sebha, label: "التسبيح"),
              bottomNavBarItem(icon: AssetsManager.ahadess, label: "الاحاديث"),
              bottomNavBarItem(icon: AssetsManager.quran, label: "القران"),
            ],
          ),
        ),
      ],
    );
  }
}

/*
* bottomNavigationBar: NavigationBar(
            selectedIndex: currentScreen,
            backgroundColor: AppColors.bottomNavBarColor,
            indicatorColor: Colors.transparent,
            onDestinationSelected: (index) {
              setState(() {
                currentScreen = index;
                _pageController.jumpToPage(currentScreen);
              });
            },
            destinations: [
              NavigationDestination(icon: Image.asset(AssetsManager.radio), label: "ee"),
              NavigationDestination(icon: Image.asset(AssetsManager.sebha), label: "ee"),
              NavigationDestination(icon: Image.asset(AssetsManager.ahadess), label: "ee"),
              NavigationDestination(icon: Image.asset(AssetsManager.ahadess), label: "ee"),

            ],
          ),
* */


/*
* Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
* */

// Scaffold(
// extendBodyBehindAppBar: true,
// appBar: AppBar(
// backgroundColor: Colors.transparent,
// centerTitle: true,
// title: appName(),
// ),
// body: Container(
// decoration: BoxDecoration(
// image: DecorationImage(
// fit: BoxFit.cover,
// image: AssetImage("assets/images/background.png"),
// ),
// ),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.stretch,
// children: [
// appName(),
// appName(),
// appName(),
// appName(),
// ],
// ),
// ),
// );
