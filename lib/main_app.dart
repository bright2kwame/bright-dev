import 'package:bright_portfolio/util/app_theme.dart';
import 'package:bright_portfolio/util/auth_service.dart';
import 'package:bright_portfolio/util/router_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainApp extends StatelessWidget {
  final AuthService authService;
  const MainApp({super.key, required this.authService});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthService>.value(
      value: authService,
      child: Builder(
        builder: (context) {
          final appRouter = AppRouter(authService);
          return MaterialApp.router(
            title: "Bright.Dev",
            theme: AppTheme(context).buildAppTheme(),
            debugShowCheckedModeBanner: false,
            routerConfig: appRouter.router,
            themeAnimationCurve: Easing.legacy,
          );
        },
      ),
    );
  }
}
