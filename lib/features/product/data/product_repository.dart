import 'package:ecommerce/features/product/data/DTOs/product_pagination_dto.dart';
import 'package:ecommerce/features/product/data/network_routes/routes.dart';
import 'package:ecommerce/features/product/data/response_models/ProductCategoryModel.dart';
import 'package:ecommerce/features/product/data/response_models/product_model.dart';
import 'package:ecommerce/network/url_request.dart';

abstract class ProductRepositoryType {
  Future<List<ProductCategoryModel>> fetchCategories();
  Future<List<ProductModel>> fetchProducts();
}

class ProductRepository implements ProductRepositoryType {
   final _request = UrlRequest();
  @override
  Future<List<ProductCategoryModel>> fetchCategories() async {
    final routeInput = RouterInput();
    final json = await _request.makeNetworkRequest(Routes.categories, routeInput);
    List<ProductCategoryModel> catList = List.empty(growable: true);
    for(var category in json) {
      var pCategory = ProductCategoryModel.fromJson(category);
     // print(pCategory.name);
      catList.add(pCategory);
    }
    return Future.value(catList);
  }
  
  @override
  Future<List<ProductModel>> fetchProducts() async {
    final paginationDto = ProductPaginationDto(limit: 10, skip: 0);
     final routeInput = RouterInput(queryParameters: paginationDto.toJson());
    final json = await _request.makeNetworkRequest(Routes.products, routeInput);
    final jsonProducts = json['products'];
    List<ProductModel> products = List.empty(growable: true);
    for(var prod in jsonProducts) {
      var product = ProductModel.fromJson(prod);
      products.add(product);
    }
    return Future.value(products);
  }

}