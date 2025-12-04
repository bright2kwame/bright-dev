import 'package:bright_portfolio/util/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButtonStyle {
  static ButtonStyle primaryOutline(bool isMobile) {
    return OutlinedButton.styleFrom(
      foregroundColor: AppColors.primaryColorLight,
      side: BorderSide(color: AppColors.primaryColorLight, width: 0.5),
      padding: EdgeInsets.symmetric(
        horizontal: 30,
        vertical: isMobile ? 18 : 22,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
    );
  }

  static ButtonStyle primaryColored(bool isMobile) {
    return ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColorLight,
      foregroundColor: AppColors.primaryColor,
      padding: EdgeInsets.symmetric(
        horizontal: 30,
        vertical: isMobile ? 18 : 22,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(width: 0.5),
      ),
      textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
      elevation: 5,
    );
  }
}
