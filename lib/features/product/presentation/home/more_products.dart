import 'package:ecommerce/custom_widgets/loader.dart';
import 'package:ecommerce/features/product/presentation/home/home_provider.dart';
import 'package:ecommerce/features/product/presentation/home/subviews/product_card.dart';
import 'package:ecommerce/features/product/presentation/home/subviews/product_grid_view.dart';
import 'package:ecommerce/features/product/presentation/product_detail/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

class MoreProductsView extends StatefulWidget {
  const MoreProductsView({super.key});

  @override
  State<MoreProductsView> createState() => _MoreProductsViewState();
}

class _MoreProductsViewState extends State<MoreProductsView> {
  ScrollController _scrollController = ScrollController();
  late HomeProvider homeProvider;
  @override
  void initState() {
    super.initState();
     homeProvider =
        Provider.of<HomeProvider>(context, listen: false);
    Future.microtask(() {
      homeProvider.fetchProducts();
    });
    _scrollController.addListener(_loadMoreData);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadMoreData() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (homeProvider.offset < homeProvider.totalProducts) {
        homeProvider.offset += 10;
        homeProvider.fetchProducts();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, child) {
      if (provider.isLoading) {
        return Loader(
          opacity: 0.0,
        );
      } else {
        return Scaffold(
          appBar: AppBar(
            title: Text("More Products"),
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: GridView.count(
              childAspectRatio: 0.45, //(itemWidth / itemHeight),
              primary: false,
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: provider.products
                  .map((product) => GestureDetector(
                    onTap: () {
                      Get.to(() => ProductDetail(id: product.id));
                    },
                    child:ProductCard(product: product)
                  ))
                  .toList(),
            ),
          ),
        );
      }
    });
  }
}
