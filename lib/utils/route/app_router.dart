import 'package:flutter/material.dart';
import 'package:nike_app/utils/route/app_routes.dart';
import 'package:nike_app/views/pages/custom_bottom_navbar.dart';
import 'package:nike_app/views/pages/product_details_page.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.bottomNavbar:
        return MaterialPageRoute(
          builder: (_) => const CustomBottomNavbar(),
        );
        case AppRoutes.productDetails:
        return MaterialPageRoute(
          builder: (_) => const ProductDetailsPage(),
        );
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                body: Center(child: Text('No route defined for'))));
    }
  }
}
