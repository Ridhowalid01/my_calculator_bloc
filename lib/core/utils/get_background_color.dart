import 'package:flutter/material.dart';

import 'colors.dart';

Color getBackgroundColor(bool isTop, bool isOperator, bool isDarkTheme) {
  if (isTop) {
    return isDarkTheme
        ? DarkAppColors.topButtonColor
        : LightAppColors.topButtonColor;
  } else if (isOperator) {
    return AppColors.operatorColor;
  } else {
    return isDarkTheme
        ? DarkAppColors.primaryColor
        : LightAppColors.primaryColor;
  }
}
