import '../../Models/ProductModel/product_model.dart';

class AddToCartState {
  Map<int, int> cartItems;
  List<ProductModel?>? cartModels;
  AddToCartState({
    required this.cartItems,
    this.cartModels,
  });
  AddToCartState copyWith({
    Map<int, int>? quantity,
    List<ProductModel?>? cartModels,
  }) {
    return AddToCartState(
      cartItems: quantity ?? this.cartItems,
      cartModels: cartModels ?? this.cartModels,
    );
  }
}

// class addtocartinitialstate extends addtocartstate {
//   addtocartinitialstate();
// }
//
// class addtocartloadingstate extends addtocartstate {
//   addtocartloadingstate();
// }
//
// class addtocartloadedstate extends addtocartstate {
//   map<int, int> quantity;
//   addtocartloadedstate({required this.quantity});
// }
//
// class addtocarterrorstate extends addtocartstate {
//   addtocarterrorstate();
// }
