import 'package:flutter/material.dart';
import 'package:islamic_app/models/sura_model.dart';
import 'package:islamic_app/providers/sura_content_provider.dart';
import 'package:islamic_app/widgets/default_text.dart';
import 'package:provider/provider.dart';
import '../../consts/app_colors.dart';
import '../../providers/theme_provider.dart';
import '../../services/assets_manager.dart';
import '../../widgets/app_name_widget.dart';

class SuraContent extends StatelessWidget {
   const SuraContent({super.key});

  static String routeName = "SuraContent";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var suraModel = ModalRoute.of(context)!.settings.arguments as SuraModel;
    return ChangeNotifierProvider<SuraContentProvider>(
      create: (context) => SuraContentProvider(),
      builder: (context, child) {
        ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
        SuraContentProvider suraContentProvider =
        Provider.of<SuraContentProvider>(context);
        if (suraContentProvider.suraContent.isEmpty) {
          suraContentProvider.readSuraFile(suraModel.suraIndex);
        }
        return Stack(
          children: [
            Image.asset( themeProvider.isDark? AssetsManager.darkBackground :
              AssetsManager.background,
              fit: BoxFit.fill,
              width: size.width,
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: appName(context),
              ),
              body: suraContentProvider.suraContent.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    )
                  : Center(
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        height: size.height - 150,
                        width: size.width - 50,
                        color:  themeProvider.isDark? AppColors.primaryDarkColor : AppColors.hadessAndSuraContentBg,
                        child: Column(
                          children: [
                            DefaultText(
                              txt: suraModel.suraName,
                            ),
                             Divider(
                              height: 24,
                              color: themeProvider.isDark? Colors.white : AppColors.primaryColor,
                              thickness: 2,
                              indent: 30,
                              endIndent: 30,
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    suraModel.suraIndex == 0
                                        ? const Visibility(
                                            visible: false, child: Text(""))
                                        : DefaultText(txt: suraModel.basmala),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    DefaultText(
                                        txt: suraContentProvider.suraContent,
                                        txtDirection: TextDirection.rtl,
                                        ltrSpacing: 0.5),
                                    // ListView.separated(
                                    //   shrinkWrap: true,
                                    //   physics: NeverScrollableScrollPhysics(),
                                    //   separatorBuilder: (context, index) =>
                                    //   const SizedBox(
                                    //     height: 6,
                                    //   ),
                                    //   itemBuilder: (context, index) => defaultText(
                                    //       txt: '${verses[index]}(${index + 1})',
                                    //       txtDirection: TextDirection.rtl),
                                    //   itemCount: verses.length,
                                    // ),
                                    DefaultText(txt: suraModel.tasdek),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
          ],
        );
      },
    );
  }
}
