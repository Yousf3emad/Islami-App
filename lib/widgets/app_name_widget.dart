import 'package:flutter/material.dart';
import 'package:islamic_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget appName(BuildContext context) {
  ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
  return Text(AppLocalizations.of(context)!.appName,
    style: TextStyle(
      color: themeProvider.isDark? Colors.white : Colors.black,
      fontFamily: "Elmessiri",
      fontSize: 30.0,
      fontWeight: FontWeight.w700,
    ),
  );
}