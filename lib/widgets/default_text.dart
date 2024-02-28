import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class DefaultText extends StatelessWidget {
  DefaultText({
    super.key,
    required this.txt,
    this.ltrSpacing,
    this.fontSize = 22,
    this.fontWeight = FontWeight.bold,
    this.txtAlign,
    this.txtDirection = TextDirection.ltr,
    this.color,
  });

  String txt;
  double? ltrSpacing;
  double fontSize;
  FontWeight fontWeight;
  TextAlign? txtAlign;
  TextDirection txtDirection;
  Color? color;
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Text(
      textAlign: txtAlign,
      textDirection: txtDirection,
      txt,
      style: TextStyle(
        letterSpacing: ltrSpacing,
        fontFamily: "Elmessiri",
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: themeProvider.isDark ? Colors.white : color,
      ),
    );
  }
}
