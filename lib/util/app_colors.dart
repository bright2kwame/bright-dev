import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = const Color(0xFF0A0A0F);
  static Color primaryColorLight = const Color(0xFFFFCC66);
  static Color primaryColorDark = const Color(0xFF0A0A0F);

  static Color secondaryColor = const Color(0xFF0A0A0F);
  static Color secondaryColorLight = const Color(0xFFFFCC66);
  static Color secondaryColorDark = const Color(0xFF0A0A0F);

  static Color background = const Color(0xFF10121A);
  static Color cardBackground = const Color(0xFF171c26);
  static Color textColor = const Color(0xFFE5E5E5);
  static Color textOrangeColor = const Color(0xFFf3af24);
  static Color subTextColor = const Color(0xFF808898);

  static Color whiteColor = const Color(0xFFffffff);
  static Color errorColor = const Color(0xFFE36562);
  static Color darkColor = const Color(0xFF000000);
  static Color grayColor = Colors.grey;

  static Color primaryButtonBoarderColor = const Color(0xFF94E8FB);
  static Color primaryButtonColor = const Color(0xFF94E8FB);

  /// Converts a hex color string (e.g., "#RRGGBB" or "RRGGBB") into a Flutter Color object.
  Color colorFromHex(String hexColor) {
    // 1. Remove the '#' symbol if it exists
    hexColor = hexColor.toUpperCase().replaceAll('#', '');

    // 2. Add the alpha channel if it's missing (assume opaque: FF)
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    // 3. Parse the hex string to an integer
    // The radix 16 specifies the base for parsing (hexadecimal).
    int colorInt = int.parse(hexColor, radix: 16);
    // 4. Create the Color object (0xAARRGGBB)
    return Color(colorInt);
  }
}
