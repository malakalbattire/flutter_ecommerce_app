import 'package:flutter_ecommerce_app/models/product_item_model.dart';

abstract class HomeServices {
  Future<List<ProductItemModel>> getProducts();
}

// class HomeServicesImpl implements HomeServices {
//   @override
//  // Future<List<ProductItemModel>> getProducts() async {}
// }
