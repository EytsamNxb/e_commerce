import 'package:ecommerce/features/product/domain/category.dart';
import 'package:flutter/material.dart';

class CategoriesView extends StatelessWidget {
  CategoriesView({super.key, required this.categories});
  List<ProductCategory> categories;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 100,
            child: ListView.builder(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                ProductCategory category = categories[index];
                return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _circleView(category),
                    );
                }
            ),
          ),
        ),
      ],
    );
  }

  Widget _circleView(ProductCategory category) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('assets/images/dummy_avatar.jpg'),
        ),
        Text(category.name)
      ],
    );
  }
}