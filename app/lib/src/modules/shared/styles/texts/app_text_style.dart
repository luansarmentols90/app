import 'package:app/src/modules/shared/styles/colors/app_colors.dart';
import 'package:app/src/modules/shared/styles/fonts/app_fonts.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static const TextStyle h1 = TextStyle(
      fontFamily: AppFonts.MulishMedium,
      fontSize: 24,
      color: AppColors.black
  );
  static const TextStyle h1Bold = TextStyle(
      fontFamily: AppFonts.MulishMedium,
      fontWeight: FontWeight.bold,
      fontSize: 24,
      color: AppColors.black
  );
}