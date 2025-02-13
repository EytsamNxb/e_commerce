import 'dart:async';

import 'package:ecommerce/custom_widgets/app_textfield.dart';
import 'package:ecommerce/custom_widgets/loader.dart';
import 'package:ecommerce/custom_widgets/search_bar.dart';
import 'package:ecommerce/features/product/presentation/home/home_provider.dart';
import 'package:ecommerce/features/product/presentation/home/subviews/header_view.dart';
import 'package:ecommerce/features/product/presentation/home/subviews/image_slider_view.dart';
import 'package:ecommerce/features/product/presentation/home/subviews/product_categories_view.dart';
import 'package:ecommerce/features/product/presentation/home/subviews/product_grid_view.dart';
import 'package:ecommerce/utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    HomeProvider homeProvider =
        Provider.of<HomeProvider>(context, listen: false);
    Future.microtask(() {
    // homeProvider.fetchCategories();
    // homeProvider.fetchProducts();
    homeProvider.fetchCategoriesAndProducts();
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, child) {
      if (provider.isLoading) {
         return Loader(opacity: 0.0,);
      } else {
      return LayoutBuilder(
        builder: (context, viewportConstraints) {
          return Scaffold(
              body: SafeArea(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: viewportConstraints.maxHeight),
                    child: Column(
                      //  spacing: 20,
                      children: [
                        HeaderView(),
                        SizedBox(
                          height: 20,
                        ),
                        AppTextfield(
                          hintText: "Search any product",
                          controller: TextEditingController(),
                          leadingIcon: Icons.search,
                          trailingIcon: Icons.mic_none_rounded,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "All Featured",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26),
                            ),
                            Row(
                              spacing: 5,
                              children: [
                                ButtonWithImageView(
                                  title: "Sort",
                                  icon: Icons.sort,
                                  onTap: () {},
                                ),
                                ButtonWithImageView(
                                  title: "Filter",
                                  icon: Icons.filter_alt_outlined,
                                  onTap: () {},
                                )
                              ],
                            ),
                          ],
                        ),
                        //  SizedBox(height: 10,),
                       // CategoriesView(categories: provider.categories),
                        ImageSliderView(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 35,
                              child: TextButton.icon(
                                onPressed: () {},
                                label: Text(
                                  "View all",
                                  style: TextStyle(color: Colors.white),
                                ),
                                icon: Icon(
                                  Icons.arrow_forward_sharp,
                                  color: Colors.white,
                                ),
                                style: ButtonStyle(
                                    shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8.0))),
                                    backgroundColor: WidgetStatePropertyAll<Color>(
                                        Appcolors.PrimaryColor)),
                                iconAlignment: IconAlignment.end,
                              ),
                            )
                          ],
                        ),
                        ProductsGridView(products: provider.products,)
                      ],
                    ),
                  ),
                ),
              )
              ),
            );
        }
      );
      }
    }
    );
  }
}

class ButtonWithImageView extends StatelessWidget {
  const ButtonWithImageView(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});
  final String title;
  final IconData icon;
  final Callback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onTap,
      label: Text(title),
      icon: Icon(icon),
      style: ButtonStyle(
          shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
          backgroundColor: WidgetStatePropertyAll<Color>(Colors.white)),
      iconAlignment: IconAlignment.end,
    );
  }
}
