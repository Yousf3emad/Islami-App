import 'package:flutter/material.dart';
import 'package:islamic_app/consts/app_colors.dart';
import 'package:islamic_app/providers/theme_provider.dart';
import 'package:islamic_app/screens/ahadess_screen.dart';
import 'package:islamic_app/screens/quran.dart';
import 'package:islamic_app/screens/radio_screen.dart';
import 'package:islamic_app/screens/tasbeeh_screen.dart';
import 'package:islamic_app/services/assets_manager.dart';
import 'package:islamic_app/widgets/app_name_widget.dart';
import 'package:islamic_app/widgets/bottom_navbar_item.dart';
import 'package:islamic_app/widgets/default_text.dart';
import 'package:provider/provider.dart';

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
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Stack(
      children: [
        Image.asset(
          themeProvider.isDark? AssetsManager.darkBackground : AssetsManager.background,
          fit: BoxFit.fill,
          width: size.width,
        ),
        Scaffold(
          drawer: Drawer(
            backgroundColor: themeProvider.isDark? AppColors.primaryDarkColor : AppColors.primaryColor,
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
                      child: Center(child: appName(context)),
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  DefaultText(
                    txt: "Mode",
                    ltrSpacing: 1.5,
                  ),
                  const SizedBox(height: 12.0,),
                  SwitchListTile(
                    value: themeProvider.isDark,
                    onChanged: (bool value) {
                      themeProvider.setIsDark(value);
                    },
                    title: DefaultText(
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
                  DefaultText(
                    txt: "Language",
                    ltrSpacing: 1.5,
                  ),
                  const SizedBox(height: 12.0,),
                  ListTile(
                    onTap: (){},
                    title: DefaultText(
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
            title: appName(context),
          ),
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: themeProvider.isDark? AppColors.gold : Colors.black,
            unselectedItemColor: Colors.white54,
            onTap: (index) {
              setState(() {
                currentScreen = index;
                _pageController.jumpToPage(currentScreen);
              });
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: themeProvider.isDark? AppColors.primaryDarkColor : AppColors.primaryColor,
            currentIndex: currentScreen,
            items: [
              bottomNavBarItem(
                  context: context,
                  icon: AssetsManager.radio, label: "الراديو"),
              bottomNavBarItem(
                  context: context,
                  icon: AssetsManager.sebha, label: "التسبيح"),
              bottomNavBarItem(
                  context: context,
                  icon: AssetsManager.ahadess, label: "الاحاديث"),
              bottomNavBarItem(
                  context: context,
                  icon: AssetsManager.quran, label: "القران"),
            ],
          ),
        ),
      ],
    );
  }
}
