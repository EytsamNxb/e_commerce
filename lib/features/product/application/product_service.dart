import 'package:ecommerce/app/locator.dart';
import 'package:ecommerce/features/product/data/product_repository.dart';
import 'package:ecommerce/features/product/domain/category.dart';
import 'package:ecommerce/features/product/domain/product.dart';
import 'package:ecommerce/features/product/presentation/product_detail/product_detail.dart';
import 'package:ecommerce/shared_preferences/shared_preferences_service.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class ProductService {
  final ProductRepositoryType _productRepository;
  ProductService(this._productRepository);
  
  final sfService = serviceLocator<SharedPreferencesService>();

  Future<List<ProductCategory>> fetchCategoriesListing() async {
    final response = await _productRepository.fetchCategories();
    List<ProductCategory> categories = List.empty(growable: true); 
    for(var category in response) {
      var pCat = ProductCategory(name: category.name!, imageUrl: category.url!);
      categories.add(pCat);
    }
    return categories;
  }

  Future<(List<Product>, int)> fetchProducts(int? offset) async {
    final response = await _productRepository.fetchProducts(offset);
    List<Product> products = List.empty(growable: true);
    for(var prod in response.$1) {
      var product = Product(id: prod.id!, 
      title: prod.title!, 
      description: prod.description!,
      category: prod.category!, 
      price: prod.price!, 
      discountPercentage: prod.discountPercentage!, 
      rating: prod.rating!, 
      thumbnail: prod.thumbnail!, 
      sku: prod.sku!);
      products.add(product);
    }
    return (products, response.$2);
  }

  Future<Product> productDetail(int id) async {
    final response = await _productRepository.productDetail(id);
    var product = Product(id: response.id!, 
    title: response.title!, 
    description: response.description!,
    category: response.category!, 
    price: response.price!, 
    discountPercentage: response.discountPercentage!, 
    rating: response.rating!, 
    thumbnail: response.thumbnail!, 
    sku: response.sku!,
    images: response.images,
    returnPolicy: response.returnPolicy,
    shippingInformation: response.shippingInformation,
    tags: response.tags,
    brand: response.brand
    );
    return product;
  }
}