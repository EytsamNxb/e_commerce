class ProductPaginationDto {
  int limit;
  int skip;

  ProductPaginationDto({required this.limit, required this.skip});
   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['limit'] = limit;
    data['skip'] = skip;
    return data;
  }
}