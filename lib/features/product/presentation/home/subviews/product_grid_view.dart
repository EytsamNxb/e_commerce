import 'package:ecommerce/features/product/domain/product.dart';
import 'package:ecommerce/features/product/presentation/home/home_view.dart';
import 'package:ecommerce/features/product/presentation/home/subviews/product_card.dart';
import 'package:flutter/material.dart';

class ProductsGridView extends StatelessWidget {
  ProductsGridView({super.key, required this.products, required this.onProductTapped});
  List<Product> products;
  final void Function(int) onProductTapped;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height) / 2;
    final double itemWidth = size.width / 2;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 400 * (products.length / 2), //multiply (array count / 2) by height of card
          child: GridView.count(
            childAspectRatio: 0.45, //(itemWidth / itemHeight),
            primary: false,
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            physics: NeverScrollableScrollPhysics(),
            children: products
                  .map((product) => GestureDetector(
                    onTap: () {
                      onProductTapped(product.id);
                    },
                    child:ProductCard(product: product)
                  ))
                  .toList(),
          ),
        ),
      ],
    );
  }
}