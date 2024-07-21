import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/utils/app_routes.dart';
import 'package:flutter_ecommerce_app/views/pages/custom_bottom_navbar.dart';
import 'package:flutter_ecommerce_app/views/pages/my_orders_page.dart';
import 'package:flutter_ecommerce_app/views/pages/product_details_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.productDetails:
        return MaterialPageRoute(
          builder: (_) => const ProductDetailsPage(),
        );
      case AppRoutes.myOrders:
        return MaterialPageRoute(
          builder: (_) => MyOrdersPage(),
          settings: settings,
        );
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => CustomBottomNavbar(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Error Page'),
            ),
          ),
          settings: settings,
        );
    }
  }
}
