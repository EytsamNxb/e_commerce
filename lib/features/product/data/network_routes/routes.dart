import 'package:ecommerce/network/base_route.dart';

enum Routes implements BaseRoute {
  categories, products;

  @override
  String get path {
     switch (this) {
      case categories:
      return "/products/categories";
      case products:
      return "/products";
    }
  }

  @override
  HttpMethod get method {
    switch (this) {
      case categories:
      return HttpMethod.get;
      case products:
      return HttpMethod.get;
    }
  }

  @override
  Map<String, dynamic>? get authHeaders {
   return null;
  }

}