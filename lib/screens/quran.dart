import 'package:flutter/material.dart';
import 'package:islamic_app/consts/app_colors.dart';
import 'package:islamic_app/consts/app_strings.dart';
import 'package:islamic_app/models/sura_model.dart';
import 'package:islamic_app/screens/inner_screens/sura_content.dart';
import 'package:islamic_app/services/assets_manager.dart';
import 'package:islamic_app/widgets/default_text.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Image.asset(
          AssetsManager.quran_02,
          height: size.height * .3,
        ),
        const Divider(
          color: AppColors.primaryColor,
          thickness: 2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: DefaultText(txt: "اسم السورة", color: AppColors.primaryColor),
        ),
        const Divider(
          color: AppColors.primaryColor,
          thickness: 2,
        ),
        const SizedBox(
          height: 12.0,
        ),
        Flexible(
          child: SizedBox(
            width: size.width * 0.8,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    SuraContent.routeName,
                    arguments: SuraModel(
                        suraIndex: index, suraName: AppStrings.suraName[index]),
                  );
                },
                child: Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    border:
                        Border.all(color: AppColors.primaryColor, width: 2.0),
                    color: Colors.transparent,
                  ),
                  child: Center(
                    child: DefaultText(
                        txt: AppStrings.suraName[index],
                        color: AppColors.primaryColor),
                  ),
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 18,
              ),
              itemCount: AppStrings.suraName.length,
            ),
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
      ],
    );
  }
}
