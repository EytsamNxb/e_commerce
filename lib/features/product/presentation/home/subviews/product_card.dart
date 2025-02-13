
import 'dart:ui';

import 'package:ecommerce/features/product/domain/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  ProductCard({
    super.key,
    required this.product
  });
  Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        color: Colors.white60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Image.network(product.thumbnail)// FadeInImage.assetNetwork(placeholder: "assets/loading.gif", image: "")
              ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 5,
              children: [
                Text(
                 product.title,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                ),
                Text(
                  product.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                Text(
                  "Rs${product.price}",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                ),
                Text(
                  "${product.rating} Reviews",
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 10.0,
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}