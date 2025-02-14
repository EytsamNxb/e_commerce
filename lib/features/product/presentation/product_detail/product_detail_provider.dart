import 'package:ecommerce/features/product/application/product_service.dart';
import 'package:ecommerce/features/product/data/product_repository.dart';
import 'package:ecommerce/features/product/domain/product.dart';
import 'package:flutter/material.dart';

class ProductDetailProvider extends ChangeNotifier {
  bool isLoading = false;
  Product? product;
  final _service = ProductService(ProductRepository());

  getProductDetail(int id) {
    isLoading = true;
    notifyListeners();
    _service.productDetail(id).then((value) {
      product = value;
      isLoading = false;
      notifyListeners();
    }, onError: (error, stackTrace) {
      print(error);
    });
  }
}