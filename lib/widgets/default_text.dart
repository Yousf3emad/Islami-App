import 'package:flutter/cupertino.dart';

Widget defaultText({
  required String txt,
  TextDirection txtDirection = TextDirection.ltr,
  Color? color,
}) => Text(textDirection: txtDirection,
      txt,
      style: TextStyle(
        fontFamily: "Elmessiri",
        fontWeight: FontWeight.bold,
        fontSize: 22,
        color: color,
      ),
    );
