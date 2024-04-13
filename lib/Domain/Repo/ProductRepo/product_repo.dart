import 'dart:convert';

import 'package:codemehub_project/Utils/Constants/endpoints.dart';
import 'package:http/http.dart' as http;
import '../../Models/ProductModel/product_model.dart';

class ProductService {
  Future<List<ProductModel>?> fetchProduct() async {
    try {
      final response = await http.get(Uri.parse(AppEndpoints.product));

      final responseData = jsonDecode(response.body);
      List<ProductModel> productList = [];
      for (var product in responseData) {
        ProductModel model = ProductModel.fromJson(product);
        productList.add(model);
      }
      return productList;
    } catch (e) {
      return null;
    }
  }
}
