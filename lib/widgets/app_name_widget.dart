import 'package:flutter/material.dart';
import 'package:islamic_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

Widget appName(BuildContext context) {
  ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
  return Text("إسلامي",
    style: TextStyle(
      color: themeProvider.isDark? Colors.white : Colors.black,
      fontFamily: "Elmessiri",
      fontSize: 30.0,
      fontWeight: FontWeight.w700,
    ),
  );
}