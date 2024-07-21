import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/provider/cart_provider.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';
import 'package:provider/provider.dart';

class CounterWidget extends StatelessWidget {
  final String productId;
  final int value;
  const CounterWidget(
      {super.key, required this.productId, required this.value});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: AppColors.white,
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              provider.decrement(productId);
            },
            icon: const Icon(Icons.remove),
          ),
          Text('$value'),
          IconButton(
            onPressed: () {
              provider.increment(productId);
              // print( );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
