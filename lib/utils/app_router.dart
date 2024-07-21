import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/utils/app_routes.dart';
import 'package:flutter_ecommerce_app/views/pages/custom_bottom_navbar.dart';
import 'package:flutter_ecommerce_app/views/pages/my_orders_page.dart';
import 'package:flutter_ecommerce_app/views/pages/payment_page.dart';
import 'package:flutter_ecommerce_app/views/pages/product_details_page.dart';
import 'package:provider/provider.dart';

import '../provider/cart_provider.dart';

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
      case AppRoutes.payment:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider.value(
            value: Provider.of<CartProvider>(_, listen: false),
            child: PaymentPage(),
          ),
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
