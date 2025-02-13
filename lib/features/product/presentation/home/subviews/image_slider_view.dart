import 'package:ecommerce/utils/AppColors.dart';
import 'package:flutter/material.dart';

class ImageSliderView extends StatefulWidget {
  ImageSliderView({super.key});

  @override
  State<ImageSliderView> createState() => _ImageSliderViewState();
}

class _ImageSliderViewState extends State<ImageSliderView> {
  final List<String> imagePaths = [
    "assets/images/img_1.jpg",
    "assets/images/img_2.jpg",
    "assets/images/img_3.jpg"
  ];
  int _activePage = 0;

  // late List<Widget> _pages;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 4,
          child: PageView.builder(
              itemCount: imagePaths.length,
              onPageChanged: (value) => setState(() {
                    _activePage = value;
                  }),
              itemBuilder: (context, index) {
                final imagePath = imagePaths[index];
                return _placeHolder(context, imagePath);
              }),
        ),
        Container(
          color: Colors.transparent,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                  imagePaths.length,
                  (index) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: CircleAvatar(
                          radius: 4,
                          backgroundColor: _activePage == index
                              ? Appcolors.PrimaryColor
                              : Colors.grey,
                        ),
                      ))),
        )
      ],
    );
  }

  Widget _placeHolder(BuildContext context, String path) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Image.asset(
          path,
          fit: BoxFit.cover,
        ));
  }
}
