import 'package:ecommerce/features/product/domain/product.dart';
import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  ReviewCard({super.key, required this.review});
  Review? review;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(review?.reviewer ?? ""),
            subtitle: Text(review?.comment ?? ""),
          ),
          ListTile(
            title: Text(review?.date.toString() ?? ""),
          ),
        ],
      ),
    );
  }
}