import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_cart_api_and_ui/model/product_model.dart';

class HomeScreenController with ChangeNotifier {
  List<ProductModel> productModel = [];
  List categoriesList = ["All"];
  bool isLoading = false;
  List productList = [];

  Future<void> getCategories() async {
     categoriesList = ["All"];
    

    isLoading = true;
    notifyListeners();
    var url = Uri.parse('https://fakestoreapi.com/products/categories');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      categoriesList.addAll(jsonDecode(response.body));

      log(categoriesList.toString());
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> getProductList() async {
    var url = Uri.parse('https://fakestoreapi.com/products');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      productList = productModelFromJson(response.body);
    }
  }
}
