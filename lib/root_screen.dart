import 'package:flutter/material.dart';
import 'package:islamic_app/consts/app_colors.dart';
import 'package:islamic_app/screens/ahadess_screen.dart';
import 'package:islamic_app/screens/quran.dart';
import 'package:islamic_app/screens/radio_screen.dart';
import 'package:islamic_app/screens/tasbeeh_screen.dart';
import 'package:islamic_app/services/assets_manager.dart';
import 'package:islamic_app/widgets/app_name_widget.dart';
import 'package:islamic_app/widgets/bottom_navbar_item.dart';
import 'package:islamic_app/widgets/default_text.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});
  static const String routeName = "/RootScreen";

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
          drawer: Drawer(
            backgroundColor: AppColors.primaryColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 120,
                    child: DrawerHeader(
                      child: Center(child: appName()),
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  defaultText(
                    txt: "Mode",
                    ltrSpacing: 1.5,
                  ),
                  const SizedBox(height: 12.0,),
                  SwitchListTile(
                    value: false,
                    onChanged: (bool value) {},
                    title: defaultText(
                        txt: "Light Mode",
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w300),
                    secondary: Image.asset(
                      AssetsManager.theme,height: 35.0,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Divider(
                      thickness: 1.0,
                    ),
                  ),
                  defaultText(
                    txt: "Language",
                    ltrSpacing: 1.5,
                  ),
                  const SizedBox(height: 12.0,),
                  ListTile(
                    onTap: (){},
                    title: defaultText(
                        txt: "English",
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w300),
                    trailing: const Icon(Icons.language),
                  ),
                ],
              ),
            ),
          ),
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
            backgroundColor: AppColors.primaryColor,
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
