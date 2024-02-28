import 'package:flutter/material.dart';
import 'package:islamic_app/consts/app_colors.dart';
import 'package:islamic_app/services/assets_manager.dart';
import 'package:islamic_app/widgets/default_text.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class RadioScreen extends StatelessWidget {
  const RadioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AssetsManager.radio_02,
              height: size.height * .3,
            ),
            SizedBox(
              height: size.width * 0.05,
            ),
             DefaultText(
               txt: "اذاعه القران الكريم",
            ),
            SizedBox(
              height: size.width * .09,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    AssetsManager.iconMetroPlayPrevious,
                    color: themeProvider.isDark ? AppColors.gold : null,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    AssetsManager.iconAwesomePlayNext,
                    color: themeProvider.isDark ? AppColors.gold : null,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    AssetsManager.iconMetroPlayNext,
                    color: themeProvider.isDark ? AppColors.gold : null,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}
