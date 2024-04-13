import 'package:codemehub_project/Domain/Repo/ProductRepo/product_repo.dart';
import 'package:codemehub_project/Domain/Riverpod/ProductProvider/product_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productProvider =
    NotifierProvider<ProductNotifier, ProductState>(() => ProductNotifier());

class ProductNotifier extends Notifier<ProductState> {
  final productService = ProductService();
  @override
  ProductState build() {
    return ProductInitialState();
  }

  Future<void> fetchProducts() async {
    state = ProductLoadingState();
    final res = await productService.fetchProduct();
    if (res == null) {
      state = ProductErrorState();
      return;
    }
    state = ProductLoadedState(
      productList: res,
    );
  }
}
