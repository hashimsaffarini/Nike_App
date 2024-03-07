import 'package:flutter/material.dart';
import 'package:nike_app/utils/route/app_routes.dart';
import 'package:nike_app/views/pages/custom_bottom_navbar.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.bottomNavbar:
        return MaterialPageRoute(
          builder: (_) => const CustomBottomNavbar(),
        );
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                body: Center(child: Text('No route defined for'))));
    }
  }
}
