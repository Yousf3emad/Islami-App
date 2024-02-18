import 'package:flutter/material.dart';
import 'package:islamic_app/consts/app_colors.dart';
import 'package:islamic_app/consts/app_strings.dart';

import '../../services/assets_manager.dart';
import '../../widgets/app_name_widget.dart';

class HadessContent extends StatelessWidget {
  const HadessContent({super.key});
  static const String routeName = "/HadessContent";

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
          body: Center(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              height: size.height-150,
              width: size.width-50,
              color: AppColors.hadessContent,
            child: Column(
              children: [
                const Text(
                  "الحديث رقم1",
                  style:  TextStyle(
                    fontFamily: "Elmessiri",
                    fontWeight: FontWeight.bold,
                    fontSize: 22,

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 7.0,),
                  child: Container(
                    height: 2,
                    color: AppColors.bottomNavBarColor,
                  ),

                ),
                const SingleChildScrollView(
                  child: Text(
                    AppStrings.hadessContent,
                    style: TextStyle(
                      fontFamily: "Elmessiri",
                      fontWeight: FontWeight.bold,
                      fontSize: 22,

                    ),
                  ),
                )
              ],
            ),
            ),
          ),

        ),
      ],
    );
  }
}
