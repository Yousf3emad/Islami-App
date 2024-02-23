import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/hadeth_mode.dart';

class AhadethProvider extends ChangeNotifier{

  List<HadethModel> ahadethList = [];

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
      notifyListeners();
    }
  }
}