import 'package:codemehub_project/Domain/Models/ProductModel/product_model.dart';
import 'package:codemehub_project/Domain/Riverpod/ProductProvider/product_provider.dart';
import 'package:codemehub_project/Domain/Riverpod/ProductProvider/product_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Widgets/product_widget.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    return switch (ref.watch(productProvider)) {
      ProductLoadedState(productList: final productList) => GridView.count(
          physics: const AlwaysScrollableScrollPhysics(),
          crossAxisCount: 2,
          children: [
            ...List.generate(
              productList.length,
              (index) {
                final product = productList[index];
                return ProductWidget(product: product);
              },
            ),
          ],
        ),
      ProductLoadingState() => const Center(
          child: Text('Loading...'),
        ),
      _ => const Center(
          child: Text('Something went wrong'),
        ),
    };
  }
}
