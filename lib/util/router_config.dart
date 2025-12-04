// router/router_config.dart

import 'package:bright_portfolio/landing_page.dart';
import 'package:bright_portfolio/not_found_page.dart';
import 'package:bright_portfolio/util/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  //web application routes
  static const root = "/";
  final AuthService authService;
  //list of routes that are protected
  List<String> protectedRoutes = [];

  AppRouter(this.authService);

  // The main router configuration
  late final GoRouter router = GoRouter(
    initialLocation: root,

    // The key redirect function
    redirect: (BuildContext context, GoRouterState state) {
      //cases where the user is already logged in

      //check the details
      final String currentRoute = state.uri.path;
      debugPrint("Current Route: $currentRoute");
      //user not logged in but attempting to access protected routes
      return null;
    },

    refreshListenable:
        authService, // Listen to changes in AuthService (login/logout)

    errorBuilder: (context, state) {
      return NotFoundPage();
    },

    routes: [
      GoRoute(
        path: root,
        name: 'root',
        builder: (context, state) => const LandingPage(),
      ),
    ],
  );
}
