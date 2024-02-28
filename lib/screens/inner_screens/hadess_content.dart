import 'package:flutter/material.dart';
import 'package:islamic_app/consts/app_colors.dart';
import 'package:islamic_app/widgets/default_text.dart';
import 'package:provider/provider.dart';

import '../../models/hadeth_mode.dart';
import '../../providers/theme_provider.dart';
import '../../services/assets_manager.dart';
import '../../widgets/app_name_widget.dart';

class HadessContent extends StatefulWidget {
  const HadessContent({super.key});
  static const String routeName = "/HadessContent";

  @override
  State<HadessContent> createState() => _HadessContentState();
}

class _HadessContentState extends State<HadessContent> {
  @override
  Widget build(BuildContext context) {
    var hadethModel = ModalRoute.of(context)!.settings.arguments as HadethModel;
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset(themeProvider.isDark? AssetsManager.darkBackground :
          AssetsManager.background,
          fit: BoxFit.fill,
          width: size.width,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: appName(context),
            centerTitle: true,
            backgroundColor: Colors.transparent,
          ),
          body: hadethModel.content.isEmpty
              ? const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          )
              : Center(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              height: size.height-150,
              width: size.width-50,
              color:themeProvider.isDark? AppColors.primaryDarkColor : AppColors.hadessAndSuraContentBg,
              child: Column(
                children: [
                  Text(
                    hadethModel.title,
                    style:  TextStyle(
                      fontFamily: "Elmessiri",
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: themeProvider.isDark? Colors.white : null,
                    ),
                  ),
                   Divider(
                    height: 24,
                    color: themeProvider.isDark? Colors.white :AppColors.primaryColor,
                    thickness: 2,
                    indent: 30,
                    endIndent: 30,
                  ),
                  Flexible(
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                      const SizedBox(
                        height: 6,
                      ),
                      itemBuilder: (context, index) => DefaultText(
                          txt: hadethModel.content[index],
                          txtDirection: TextDirection.rtl,
                      ),
                      itemCount: hadethModel.content.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

}
