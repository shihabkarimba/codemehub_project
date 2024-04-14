import 'package:hive/hive.dart';

import '../../Models/ProductModel/product_model.dart';

class CartService {
  static final Box _cartBox = Hive.box('cart');
  static final Box _cartItems = Hive.box<ProductModel>('cartItems');

  addToCart(ProductModel item) {
    if (_cartItems.containsKey(item.id)) {
      return;
    } else {
      _cartItems.put(item.id, item);
    }
  }

  List<ProductModel?> getCartItems() {
    return _cartItems.values
        .map((dynamic item) => item as ProductModel?)
        .toList();
  }

  void increment(int id) {
    int currentQuantity = _cartBox.get(id, defaultValue: 0);
    currentQuantity++;
    _cartBox.put(id, currentQuantity);
  }

  void decrement(int id) {
    int currentQuantity = _cartBox.get(id, defaultValue: 0);
    currentQuantity--;
    _cartBox.put(id, currentQuantity);
  }
}
