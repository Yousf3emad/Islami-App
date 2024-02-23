import 'package:flutter/cupertino.dart';

Widget defaultText({
  required String txt,
  double? ltrSpacing,
  double fontSize = 22,
  FontWeight fontWeight = FontWeight.bold,
  TextAlign? txtAlign,
  TextDirection txtDirection = TextDirection.ltr,
  Color? color,
}) => Text(
  textAlign: txtAlign,
  textDirection: txtDirection,
      txt,
      style: TextStyle(

        letterSpacing: ltrSpacing,
        fontFamily: "Elmessiri",
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
      ),
    );
