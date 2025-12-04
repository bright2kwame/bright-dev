import 'package:bright_portfolio/util/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  late BuildContext context;

  AppTheme(BuildContext buildContext) {
    context = buildContext;
  }

  ThemeData buildAppTheme() {
    final ThemeData base = ThemeData.light(useMaterial3: true);

    return base.copyWith(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: AppColors.primaryColor,
      primaryColorDark: AppColors.primaryColorDark,
      primaryColorLight: AppColors.primaryColorLight,
      buttonTheme: base.buttonTheme.copyWith(
        buttonColor: AppColors.secondaryColor,
        textTheme: ButtonTextTheme.primary,
      ),
      cardTheme: base.cardTheme.copyWith(
        color: AppColors.background,
        elevation: 0.5,
        shadowColor: Colors.black,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
      ),
      scaffoldBackgroundColor: AppColors.background,
      cardColor: AppColors.cardBackground,
      primaryIconTheme: base.iconTheme.copyWith(color: Colors.grey),
      dialogTheme: base.dialogTheme.copyWith(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      ),
      listTileTheme: base.listTileTheme.copyWith(tileColor: Colors.white),
      textTheme: TextTheme(
        titleMedium: TextStyle(
          fontWeight: FontWeight.w300, // Light weight
          fontSize: 18,
          letterSpacing: 1.5,
        ),
        // For major headings (e.g., "Bright Ahedor.")
        headlineLarge: TextStyle(
          fontWeight: FontWeight.w100, // Thin weight for dramatic look
          fontSize: 72,
          height: 1.1,
        ),
        // For secondary headings (e.g., "I architect and lead...")
        headlineMedium: TextStyle(
          fontWeight: FontWeight.w300, // Light weight
          fontSize: 48,
          height: 1.2,
        ),
        // For the paragraph description and body text
        bodyLarge: TextStyle(
          fontWeight: FontWeight.w300, // Light weight
          fontSize: 20,
          height: 1.5,
        ),
      ),
    );
  }
}
