import 'package:flutter/foundation.dart';
import 'package:flutter_ecommerce_app/models/product_item_model.dart';
//
// enum PaymentState { initial, loading, loaded, error }
//
// class PaymentProvider with ChangeNotifier {
//   List<ProductItemModel> _cartItems = [];
//   PaymentState _state = PaymentState.initial;
//   String _errorMessage = '';
//
//   List<ProductItemModel> get cartItems => _cartItems;
//   PaymentState get state => _state;
//   String get errorMessage => _errorMessage;
//
//   void loadPaymentData() async {
//     _state = PaymentState.loading;
//     notifyListeners();
//
//     try {
//       await Future.delayed(const Duration(seconds: 2));
//       _cartItems = dummyProducts.where((item) => item.isAddedToCart).toList();
//       _state = PaymentState.loaded;
//     } catch (error) {
//       _state = PaymentState.error;
//       _errorMessage = error.toString();
//     }
//     notifyListeners();
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:flutter_ecommerce_app/models/product_item_model.dart';

enum PaymentState { initial, loading, loaded, error }

class PaymentProvider with ChangeNotifier {
  List<ProductItemModel> _cartItems = [];
  PaymentState _state = PaymentState.initial;
  String _errorMessage = '';
  double _subtotal = 0.0;
  double _shippingCost = 10.0; // Fixed shipping cost
  double _total = 0.0;

  List<ProductItemModel> get cartItems => _cartItems;
  PaymentState get state => _state;
  String get errorMessage => _errorMessage;
  double get subtotal => _subtotal;
  double get total => _total;

  void loadPaymentData() async {
    _state = PaymentState.loading;
    notifyListeners();

    try {
      await Future.delayed(const Duration(seconds: 2));
      _cartItems = dummyProducts.where((item) => item.isAddedToCart).toList();
      _calculateTotals();
      _state = PaymentState.loaded;
    } catch (error) {
      _state = PaymentState.error;
      _errorMessage = error.toString();
    }
    notifyListeners();
  }

  void _calculateTotals() {
    _subtotal =
        _cartItems.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
    _total = _subtotal + _shippingCost;
  }
}
