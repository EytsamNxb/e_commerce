import 'package:ecommerce/utils/helper.dart';

class ProductModel {
  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  List<String>? tags;
  String? brand;
  String? sku;
  int? weight;
  Dimensions? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  List<Reviews>? reviews;
  String? returnPolicy;
  int? minimumOrderQuantity;
  Meta? meta;
  List<String>? images;
  String? thumbnail;

  ProductModel(
      {this.id,
      this.title,
      this.description,
      this.category,
      this.price,
      this.discountPercentage,
      this.rating,
      this.stock,
      this.tags,
      this.brand,
      this.sku,
      this.weight,
      this.dimensions,
      this.warrantyInformation,
      this.shippingInformation,
      this.availabilityStatus,
      this.reviews,
      this.returnPolicy,
      this.minimumOrderQuantity,
      this.meta,
      this.images,
      this.thumbnail});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = Helper.validateInt(json, "id");
    title = Helper.validateString(json,'title');
    description = Helper.validateString(json, 'description');
    category = Helper.validateString(json, 'category');
    price =  Helper.validateDouble(json, 'price');
    discountPercentage = Helper.validateDouble(json, 'discountPercentage');
    rating = Helper.validateDouble(json, "rating");
    stock = Helper.validateInt(json,'stock');
    tags = json['tags'].cast<String>();
    brand = Helper.validateString(json, 'brand');
    sku = Helper.validateString(json, 'sku');
    weight = Helper.validateInt(json,'weight');
    dimensions = json['dimensions'] != null
        ? Dimensions.fromJson(json['dimensions'])
        : null;
    warrantyInformation = Helper.validateString(json, 'warrantyInformation');
    shippingInformation = Helper.validateString(json, 'shippingInformation');
    availabilityStatus = Helper.validateString(json, 'availabilityStatus');
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
    returnPolicy = Helper.validateString(json, 'returnPolicy');
    minimumOrderQuantity = Helper.validateInt(json, 'minimumOrderQuantity');
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    images = json['images'].cast<String>();
    thumbnail = Helper.validateString(json, 'thumbnail');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['category'] = this.category;
    data['price'] = this.price;
    data['discountPercentage'] = this.discountPercentage;
    data['rating'] = this.rating;
    data['stock'] = this.stock;
    data['tags'] = this.tags;
    data['brand'] = this.brand;
    data['sku'] = this.sku;
    data['weight'] = this.weight;
    if (this.dimensions != null) {
      data['dimensions'] = this.dimensions!.toJson();
    }
    data['warrantyInformation'] = this.warrantyInformation;
    data['shippingInformation'] = this.shippingInformation;
    data['availabilityStatus'] = this.availabilityStatus;
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    data['returnPolicy'] = this.returnPolicy;
    data['minimumOrderQuantity'] = this.minimumOrderQuantity;
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    data['images'] = this.images;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}

class Dimensions {
  double? width;
  double? height;
  double? depth;

  Dimensions({this.width, this.height, this.depth});

  Dimensions.fromJson(Map<String, dynamic> json) {
    width = Helper.validateDouble(json, "width");
    height = Helper.validateDouble(json, "height");
    depth = Helper.validateDouble(json, "depth");
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['width'] = width;
    data['height'] = height;
    data['depth'] = depth;
    return data;
  }
}

class Reviews {
  double? rating;
  String? comment;
  String? date;
  String? reviewerName;
  String? reviewerEmail;

  Reviews(
      {this.rating,
      this.comment,
      this.date,
      this.reviewerName,
      this.reviewerEmail});

  Reviews.fromJson(Map<String, dynamic> json) {
    rating = Helper.validateDouble(json, 'rating');
    comment = Helper.validateString(json, 'comment');
    date = Helper.validateString(json,'date');
    reviewerName = Helper.validateString(json,'reviewerName');
    reviewerEmail = Helper.validateString(json, 'reviewerEmail');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rating'] = rating;
    data['comment'] = comment;
    data['date'] = date;
    data['reviewerName'] = reviewerName;
    data['reviewerEmail'] = reviewerEmail;
    return data;
  }
}

class Meta {
  String? createdAt;
  String? updatedAt;
  String? barcode;
  String? qrCode;

  Meta({this.createdAt, this.updatedAt, this.barcode, this.qrCode});

  Meta.fromJson(Map<String, dynamic> json) {
    createdAt = Helper.validateString(json, 'createdAt');
    updatedAt = Helper.validateString(json, 'updatedAt');
    barcode = Helper.validateString(json,'barcode');
    qrCode = Helper.validateString(json,'qrCode');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['barcode'] = barcode;
    data['qrCode'] = qrCode;
    return data;
  }
}

class ProductResponse {
  List<ProductModel>? products;
  int? total;
  int? skip;
  int? limit;

    ProductResponse.fromJson(Map<String, dynamic> json) {
    products = json['products'];
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }
}