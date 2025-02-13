import 'package:ecommerce/custom_widgets/app_textfield.dart';
import 'package:ecommerce/utils/AppColors.dart';
import 'package:ecommerce/features/authentication/presentation/signup/signup_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 20,
            children: [
              Text(
                "Forgot \npassword?",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 36),
              ),
              AppTextfield(hintText: "Email", 
              controller: TextEditingController(), 
              leadingIcon: Icons.email,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                      onPressed: () {
                       
                      },
                      style: ButtonStyle(
                          minimumSize:
                              WidgetStatePropertyAll<Size>(Size.fromHeight(50.0)),
                          shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  side: BorderSide(color: Colors.red))),
                          backgroundColor: WidgetStatePropertyAll<Color>(
                              Appcolors.PrimaryColor)),
                      child: Text(
                        "Submit",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
