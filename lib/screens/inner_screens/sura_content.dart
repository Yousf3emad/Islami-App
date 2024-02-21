import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
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
  String suraContent ="";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var suraModel = ModalRoute.of(context)!.settings.arguments as SuraModel;
    if (suraContent.isEmpty) {
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
          body: suraContent.isEmpty
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
                        defaultText(
                          txt: suraModel.suraName,
                        ),
                        Divider(
                          height: 24,
                          color: AppColors.bottomNavBarColor,
                          thickness: 2,
                          indent: 30,
                          endIndent: 30,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                suraModel.suraIndex==0? Visibility( visible: false, child: Text("")) : defaultText(txt: suraModel.basmala),
                                SizedBox(height: 6,),
                                defaultText(txt: suraContent,txtDirection: TextDirection.rtl,ltrSpacing: 0.5),
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
                                defaultText(txt: suraModel.tasdek),
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
  }

  void readSuraFile(int index) async {
    String sura = await rootBundle.loadString("assets/files/suras/${index + 1}.txt");
    List<String> suraLines = sura.split("\n");

    suraLines.removeWhere((element) => element.trim().isEmpty);
    sura = "";
    for(int i=0;i<suraLines.length;i++){
      sura = sura + suraLines[i].trim()+" (${i+1}) ";
    }
    suraContent = sura;

    setState(() {});
  }
}
