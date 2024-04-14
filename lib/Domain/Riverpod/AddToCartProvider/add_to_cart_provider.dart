import 'package:codemehub_project/Domain/Models/ProductModel/product_model.dart';
import 'package:codemehub_project/Domain/Repo/CartRepo/cart_repo.dart';
import 'package:codemehub_project/Domain/Riverpod/AddToCartProvider/add_to_cart_state.dart';
import 'package:codemehub_project/Widgets/toast_message.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addToCartProvider = NotifierProvider<AddToCartNotifier, AddToCartState>(
    () => AddToCartNotifier());

class AddToCartNotifier extends Notifier<AddToCartState> {
  final cartRepo = CartService();
  @override
  AddToCartState build() {
    return AddToCartState(cartItems: {});
  }

  void incrementQuantity({required int id}) {
    final updatedQuantity = {...state.cartItems};
    updatedQuantity[id] = (updatedQuantity[id] ?? 0) + 1;
    state = state.copyWith(quantity: updatedQuantity);
    cartRepo.increment(id);
  }

  void decrementQuantity({required int id}) {
    if (state.cartItems.containsKey(id)) {
      final updatedQuantity = {...state.cartItems};
      if (updatedQuantity[id]! > 1) {
        updatedQuantity[id] = updatedQuantity[id]! - 1;
        state = state.copyWith(quantity: updatedQuantity);
      } else {
        updatedQuantity.remove(id);
        state = state.copyWith(quantity: updatedQuantity);
      }
      cartRepo.decrement(id);
    } else {
      // TODO(shihab)NO ITEM IN THE CART
    }
  }

  void addCartItem(ProductModel model) {
    cartRepo.addToCart(model);
    showSnackBar(msg: 'Product added to cart');
  }

  void fetchCartItems() {
    final castState = state;
    final cartItem = cartRepo.getCartItems();
    state = castState.copyWith(cartModels: cartItem);
  }
}
