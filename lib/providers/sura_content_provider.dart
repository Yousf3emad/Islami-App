import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SuraContentProvider extends ChangeNotifier{
   String suraContent ="";

  void readSuraFile(int index) async {
    String sura = await rootBundle.loadString("assets/files/suras/${index + 1}.txt");
    List<String> suraLines = sura.split("\n");

    suraLines.removeWhere((element) => element.trim().isEmpty);
    sura = "";
    for(int i=0;i<suraLines.length;i++){
      sura = "$sura${suraLines[i].trim()} (${i+1}) ";
    }
    suraContent = sura;

    notifyListeners();
  }
}