import 'dart:ffi';

import 'package:ecommerce/features/product/data/DTOs/product_pagination_dto.dart';
import 'package:ecommerce/features/product/data/network_routes/routes.dart';
import 'package:ecommerce/features/product/data/response_models/ProductCategoryModel.dart';
import 'package:ecommerce/features/product/data/response_models/product_model.dart';
import 'package:ecommerce/network/url_request.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

abstract class ProductRepositoryType {
  Future<List<ProductCategoryModel>> fetchCategories();
  Future<(List<ProductModel>, int)> fetchProducts(int? offset);
  Future<ProductModel> productDetail(int id);
}

class ProductRepository implements ProductRepositoryType {
   final _request = UrlRequest();
  @override
  Future<List<ProductCategoryModel>> fetchCategories() async {
    final routeInput = RouterInput();
    final json = await _request.makeNetworkRequest(CategoriesRoute(), routeInput);
    List<ProductCategoryModel> catList = List.empty(growable: true);
    for(var category in json) {
      var pCategory = ProductCategoryModel.fromJson(category);
     // print(pCategory.name);
      catList.add(pCategory);
    }
    return Future.value(catList);
  }
  
  @override
  Future<(List<ProductModel>, int)> fetchProducts(int? offset) async {
    final paginationDto = ProductPaginationDto(limit: 15, skip: offset ?? 0);
     final routeInput = RouterInput(queryParameters: paginationDto.toJson());
    final json = await _request.makeNetworkRequest(ProductsRoute(), routeInput);
    final jsonProducts = json['products'];
    List<ProductModel> products = List.empty(growable: true);
    for(var prod in jsonProducts) {
      var product = ProductModel.fromJson(prod);
      products.add(product);
    }
    int totalcount = json['total'];
    return Future.value((products, totalcount));
  }

  @override
  Future<ProductModel> productDetail(int id) async {
    final routeInput = RouterInput();
    final json = await _request.makeNetworkRequest(ProductDetailRoute(id), routeInput);
   // final jsonProduct = json['products'];
    var product = ProductModel.fromJson(json);
    return Future.value(product);
  }

}