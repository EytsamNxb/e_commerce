class Product {
  int id;
  String title;
  String description;
  String category;
  double price;
  double discountPercentage;
  double rating;
  String thumbnail;
  String sku;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.thumbnail,
    required this.sku
  });
}