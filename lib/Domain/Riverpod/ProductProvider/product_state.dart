import '../../Models/ProductModel/product_model.dart';

sealed class ProductState {
  ProductState();
}

class ProductInitialState extends ProductState {
  ProductInitialState();
}

class ProductLoadingState extends ProductState {
  ProductLoadingState();
}

class ProductLoadedState extends ProductState {
  final List<ProductModel> productList;
  ProductLoadedState({required this.productList});
}

class ProductErrorState extends ProductState {
  ProductErrorState();
}
