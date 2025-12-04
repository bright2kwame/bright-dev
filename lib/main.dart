import 'package:bright_portfolio/main_app.dart';
import 'package:bright_portfolio/util/app_colors.dart';
import 'package:bright_portfolio/util/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: AppColors.primaryColor,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ),
  );
  final authService = AuthService();
  usePathUrlStrategy();
  runApp(MainApp(authService: authService));
}
