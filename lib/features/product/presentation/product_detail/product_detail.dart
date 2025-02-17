import 'package:ecommerce/custom_widgets/loader.dart';
import 'package:ecommerce/features/product/domain/product.dart';
import 'package:ecommerce/features/product/presentation/home/home_provider.dart';
import 'package:ecommerce/features/product/presentation/product_detail/product_detail_provider.dart';
import 'package:ecommerce/features/product/presentation/product_detail/subviews/review_card.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail({super.key, required this.id});
  int id;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  late ProductDetailProvider provider;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<ProductDetailProvider>(context, listen: false);
    Future.microtask(() {
      provider.getProductDetail(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Product Detail"),
        ),
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child:
                  Consumer<ProductDetailProvider>(
                      builder: (context, provider, child) {
                if (provider.isLoading) {
                  return Center(
                    child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 10),              
                    child: CircularProgressIndicator(
                      color: Colors.blueAccent,
                    ),
                                    ),
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      Container(
                        height: 200,
                        alignment: Alignment.center, // This is needed
                        child: Image.network(
                          provider.product?.images?.first ?? "",
                          fit: BoxFit.cover,
                          //  width: 300,
                        ),
                      ),
                      Text(
                        provider.product?.title ?? "",
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                      Text(provider.product?.brand ?? ""),
                       Text(
                        "${provider.product?.rating ?? 0.0} Reviews",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.normal, color: Colors.grey.shade700),
                      ),
                          Text("Rs ${provider.product?.price.toString() ?? ""}",
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.black)),
                      Column(
                        spacing: 5,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Product Details",
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          Text(provider.product?.description ?? ""),
                        ],
                      ),
                      Text("Category: ${provider.product?.tags?.join(", ")}",),
                       Text(
                            "Reviews",
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                           Expanded(
                            child: Padding(
                                padding: EdgeInsets.fromLTRB(30, 20, 10, 0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: provider.product!.reviews!.map((review) => ReviewCard(review: review)).toList(),
                                )),
                          )
                    ],
                  );
                }
              }))),
        ));
  }
}
