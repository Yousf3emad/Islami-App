import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{

  bool isDark = false;


  void setIsDark(bool isDark){
    this.isDark = isDark;
    notifyListeners();
  }
}