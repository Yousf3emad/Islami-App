import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/models/sura_model.dart';
import 'package:islamic_app/widgets/default_text.dart';
import '../../consts/app_colors.dart';
import '../../services/assets_manager.dart';
import '../../widgets/app_name_widget.dart';

class SuraContent extends StatefulWidget {
  const SuraContent({super.key});
  static String routeName = "SuraContent";

  @override
  State<SuraContent> createState() => _SuraContentState();
}

class _SuraContentState extends State<SuraContent> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var suraModel = ModalRoute.of(context)!.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      // Future.delayed(const Duration(milliseconds: 700), () {
      //   readSuraFile(suraModel.suraIndex);
      // });
      readSuraFile(suraModel.suraIndex);
    }
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
          body: verses.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.bottomNavBarColor,
                  ),
                )
              : Center(
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    height: size.height-150,
                    width: size.width-50,
                    color: AppColors.hadessContent,
                    child: Column(
                      children: [
                        Text(
                          suraModel.suraName,
                          style: const TextStyle(
                            fontFamily: "Elmessiri",
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 7.0,
                          ),
                          child: Container(
                            height: 2,
                            color: AppColors.bottomNavBarColor,
                          ),
                        ),
                        Flexible(
                          child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 6,
                            ),
                            itemBuilder: (context, index) => defaultText(
                                txt: '${verses[index]}(${index + 1})',
                                txtDirection: TextDirection.rtl),
                            itemCount: verses.length,
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

  void readSuraFile(int index) async {
    String sura = await rootBundle.loadString("assets/files/suras/${index + 1}.txt");
    List<String> suraLines = sura.split("\n");
    suraLines.removeWhere((element) => element.trim().isEmpty);
    verses = suraLines;
    setState(() {});
  }
}
