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
  List<String>? images;
  String? returnPolicy;
  String? shippingInformation;
  List<String>? tags;
  String? brand;
  List<Review>? reviews;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.thumbnail,
    required this.sku,
    this.images,
    this.returnPolicy,
    this.shippingInformation,
    this.tags,
    this.brand,
    this.reviews
  });
}

class Review {
  String reviewer;
  String comment;
  String date;

  Review({
    required this.reviewer,
    required this.comment,
    required this.date
  });
}