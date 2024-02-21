import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/consts/app_colors.dart';
import 'package:islamic_app/screens/inner_screens/hadess_content.dart';
import 'package:islamic_app/services/assets_manager.dart';
import 'package:islamic_app/widgets/default_text.dart';

import '../models/hadeth_mode.dart';

class AhadessScreen extends StatefulWidget {
  const AhadessScreen({super.key});

  @override
  State<AhadessScreen> createState() => _AhadessScreenState();
}

class _AhadessScreenState extends State<AhadessScreen> {
  List<HadethModel> ahadethList = [];
  @override
  Widget build(BuildContext context) {
    if (ahadethList.isEmpty) {
      readHadethContent();
    }
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(
          height: 25.0,
        ),
        Image.asset(
          AssetsManager.basmala,
        ),
        const SizedBox(
          height: 12.0,
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
          height: 18.0,
        ),
        Flexible(
          child: SizedBox(
            width: size.width * 0.8,
            child: ListView.separated(
              itemCount: ahadethList.length ,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, HadessContent.routeName,arguments: ahadethList[index]);
                },
                child: Container(
                  height: 50.0,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(color: AppColors.bottomNavBarColor,width: 2.0),
                    color: Colors.transparent,
                  ),
                  child: Center(
                    child: defaultText(txt: "${ahadethList[index].title}(${index+1})",txtDirection: TextDirection.rtl,
                    ),
                  ),
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 20.0,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
      ],
    );
  }
  void readHadethContent() async {
    String file =
    await rootBundle.loadString("assets/files/ahadeth/ahadeth.txt");
    List<String> ahadeth = file.trim().split("#");

    for(int i=0; i<ahadeth.length-1; i++){
      List<String> hadethLines = ahadeth[i].trim().split("\n");
      String hadethTitle = hadethLines[0];
      hadethLines.removeAt(0);
      List<String> hadethContent = hadethLines;
      HadethModel hadethModel =  HadethModel(title: hadethTitle,content: hadethContent);
      ahadethList.add(hadethModel);

      print(hadethTitle);
    }
    setState(() {});
  }
}
