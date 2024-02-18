import 'package:flutter/material.dart';

BottomNavigationBarItem bottomNavBarItem({
  required String icon,
  required String label,
  double iconHeight = 40.0,
}) =>
    BottomNavigationBarItem(
      icon: Image.asset(
        icon,
        height: iconHeight,
      ),
      label: label,
      activeIcon: Image.asset(
        icon,
        height: iconHeight,
        color: Colors.black,
      ),
    );
