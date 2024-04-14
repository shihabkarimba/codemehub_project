import 'package:codemehub_project/Domain/Models/ProductModel/product_model.dart';
import 'package:codemehub_project/Domain/Repo/CartRepo/cart_repo.dart';
import 'package:codemehub_project/Domain/Riverpod/AddToCartProvider/add_to_cart_provider.dart';
import 'package:codemehub_project/Screens/Pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Domain/Riverpod/AddToCartProvider/add_to_cart_state.dart';
import '../Views/product_details_view.dart';

class ProductDetailsPage extends ConsumerStatefulWidget {
  final ProductModel productModel;
  const ProductDetailsPage({
    super.key,
    required this.productModel,
  });

  @override
  ConsumerState<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends ConsumerState<ProductDetailsPage> {
  final cartService = CartService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ProductDetailsView(
        productModel: widget.productModel,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 30, left: 30, right: 30),
        child: SizedBox(
          height: 180,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      ref
                          .read(addToCartProvider.notifier)
                          .decrementQuantity(id: widget.productModel.id ?? 0);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(30)),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.purple)),
                    child: Padding(
                        padding: EdgeInsets.all(14),
                        child: switch (ref.watch(addToCartProvider)) {
                          AddToCartState(cartItems: final quantity) =>
                            Text('${quantity[widget.productModel.id] ?? 0}')
                        }),
                  ),
                  const SizedBox(width: 20),
                  InkWell(
                    onTap: () {
                      ref
                          .read(addToCartProvider.notifier)
                          .incrementQuantity(id: widget.productModel.id ?? 0);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(30)),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    ref
                        .read(addToCartProvider.notifier)
                        .addCartItem(widget.productModel);
                  },
                  child: Text('Add to cart'),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartPage(),
                      ),
                    );
                  },
                  child: Text('Go to cart'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
