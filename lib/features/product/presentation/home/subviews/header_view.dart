import 'package:flutter/material.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 20,
        ),
        Row(
          spacing: 10,
          children: [
            Image.asset("assets/images/logo.png"),
            Text(
              "Stylish",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                  color: Colors.blue),
            ),
          ],
        ),
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('assets/images/dummy_avatar.jpg'),
        )
      ],
    );
  }
}