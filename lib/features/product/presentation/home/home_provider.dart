import 'dart:async';

import 'package:ecommerce/features/product/application/product_service.dart';
import 'package:ecommerce/features/product/data/product_repository.dart';
import 'package:ecommerce/features/product/domain/category.dart';
import 'package:ecommerce/features/product/domain/product.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  bool isLoading = false;
  final _service = ProductService(ProductRepository());
  List<ProductCategory> categories = List.empty(growable: true);
  List<Product> products = List.empty(growable: true);
  fetchCategories() {
    _service.fetchCategoriesListing().then((value) {
      categories = value;
      notifyListeners();
    }, onError: (error, stackTrace) {
      print(error);
    });
  }

  fetchProducts() {
    _service.fetchProducts().then((value) {
      value;
    }, onError: (error, stackTrace) {
      print(error);
    });
  }

  fetchCategoriesAndProducts() async {
    isLoading = true;
    notifyListeners();
    try {
      List responses = await Future.wait(
          [_service.fetchCategoriesListing(), _service.fetchProducts()]);
      print(responses);
      products = responses[1];
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
      print(e.toString());
    }
  }
}
