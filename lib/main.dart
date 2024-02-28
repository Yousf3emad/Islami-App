import 'package:flutter/material.dart';
import 'package:islamic_app/providers/theme_provider.dart';
import 'package:islamic_app/screens/inner_screens/hadess_content.dart';
import 'package:islamic_app/screens/inner_screens/sura_content.dart';
import 'package:provider/provider.dart';
import 'root_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider(),)
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            theme: ThemeData(
                appBarTheme: AppBarTheme(
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  iconTheme: IconThemeData(
                    color: themeProvider.isDark ? Colors.white : Colors.black,
                  ),
                ),
            ),
            debugShowCheckedModeBanner: false,
            // home: FlutterSplashScreen(
            //   useImmersiveMode: true,
            //   duration: const Duration(seconds: 2),
            //   nextScreen: const RootScreen(),
            //   splashScreenBody: SizedBox(
            //     width: size.width,
            //     child: Image.asset(
            //       AssetsManager.splash,
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            initialRoute: RootScreen.routeName,
            routes: {
              HadessContent.routeName: (context) => const HadessContent(),
              RootScreen.routeName: (context) => const RootScreen(),
              SuraContent.routeName: (context) => const SuraContent(),
            },
          );
        },
      ),
    );
  }
}
