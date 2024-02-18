import 'package:flutter/material.dart';
import 'package:islamic_app/consts/app_colors.dart';
import 'package:islamic_app/screens/inner_screens/hadess_content.dart';
import 'package:islamic_app/services/assets_manager.dart';
import 'package:islamic_app/widgets/default_text.dart';

class AhadessScreen extends StatefulWidget {
  const AhadessScreen({super.key});

  @override
  State<AhadessScreen> createState() => _AhadessScreenState();
}

class _AhadessScreenState extends State<AhadessScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 25.0,
        ),
        Image.asset(
          AssetsManager.basmala,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Container(
          height: size.height*.08,
          alignment: Alignment.center,
          width: double.infinity,
          decoration: const BoxDecoration(
            border: BorderDirectional(
                top: BorderSide(color: AppColors.bottomNavBarColor, width: 2.0),
                bottom:
                    BorderSide(color: AppColors.bottomNavBarColor, width: 2.0)),
          ),
          child: defaultText(txt: "الاحاديث"),
        ),
        const SizedBox(
          height: 30.0,
        ),
        Flexible(
          child: ListView.separated(
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, HadessContent.routeName);
              },
              child: Center(
                child: Text(
                  "${index + 1}الحديث رقم",
                  style: const TextStyle(
                    fontFamily: "Elmessiri",
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 20.0,
            ),
            itemCount: 20,
          ),
        )
      ],
    );
  }
}
