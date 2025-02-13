class ProductCategoryModel {
  String? slug;
  String? name;
  String? url;

  ProductCategoryModel({this.slug, this.name, this.url});

  ProductCategoryModel.fromJson(dynamic json) :
    slug = json['slug'],
    name = json['name'],
    url = json['url'];
  
  static ProductCategoryModel fromJsonTo(dynamic json) {
    // try {
    // return  ProductCategoryModel(slug :json['slug'],
    // name : json['name'],
    // url : json['url']);
    // } catch(ex) {
    //   print(ex.toString());
    //   return null;
    // }
     return  ProductCategoryModel(slug :json['slug'],
    name : json['name'],
    url : json['url']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['slug'] = slug;
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}