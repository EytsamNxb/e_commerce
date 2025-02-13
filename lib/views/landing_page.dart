import 'package:ecommerce/utils/AppColors.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          "assets/images/landing_cover.png",
          fit: BoxFit.fill,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              // color: Colors.black.withAlpha(80),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[Colors.black87, Colors.black26]
                    ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 40, 40, 50),
                child: Column(
                  spacing: 20,
                  children: [
                    Text(
                      "You want\nAuthentic, here \nyou Go!",
                      style: TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.normal,
                          fontSize: 28.0,
                          decoration: TextDecoration.none),
                    ),
                    Text("Find it here, buy it now!",
                        style: TextStyle(
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                            decoration: TextDecoration.none)),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            minimumSize: WidgetStatePropertyAll<Size>(
                                Size.fromHeight(50.0)),
                            shape:
                                WidgetStatePropertyAll<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        side: BorderSide(color: Colors.red))),
                            backgroundColor: WidgetStatePropertyAll<Color>(
                                Appcolors.PrimaryColor)),
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ))
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
