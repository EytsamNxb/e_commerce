import 'package:ecommerce/network/base_route.dart';

import 'package:ecommerce/network/base_route.dart';

abstract class Routes {}

class CategoriesRoute extends Routes implements BaseRoute {
  @override
  String get path => "/products/categories";

  @override
  HttpMethod get method => HttpMethod.get;

  @override
  Map<String, dynamic>? get authHeaders => null;
}

class ProductsRoute extends Routes implements BaseRoute {
  @override
  String get path => "/products";

  @override
  HttpMethod get method => HttpMethod.get;

  @override
  Map<String, dynamic>? get authHeaders => null;
}

class ProductDetailRoute extends Routes implements BaseRoute {
  int id;
  ProductDetailRoute(this.id);

  @override
  String get path => "/products/$id";

  @override
  HttpMethod get method => HttpMethod.get;

  @override
  Map<String, dynamic>? get authHeaders => null;
}