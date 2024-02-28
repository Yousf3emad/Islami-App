import 'package:flutter/material.dart';
import 'package:islamic_app/consts/app_colors.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

BottomNavigationBarItem bottomNavBarItem({
  required BuildContext context,
  required String icon,
  required String label,
  double iconHeight = 40.0,
}) {
  ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
  return BottomNavigationBarItem(
    icon: Image.asset(
      icon,
      height: iconHeight,
    ),
    label: label,
    activeIcon: Image.asset(
      icon,
      height: iconHeight,
      color: themeProvider.isDark ? AppColors.gold : Colors.black,
    ),
  );
}
