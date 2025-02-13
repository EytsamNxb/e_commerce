import 'package:ecommerce/custom_widgets/app_textfield.dart';
import 'package:ecommerce/utils/AppColors.dart';
import 'package:ecommerce/features/authentication/presentation/login/login_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:go_router/go_router.dart';

class SignupView extends StatelessWidget {
   SignupView({
    super.key,
  });

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cPasswordController = TextEditingController();

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
                  "Create an account",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 36),
                ),
             AppTextfield(hintText: "Email", controller: emailController, leadingIcon: Icons.email,),
                     AppTextfield(hintText: "Password", controller: passwordController, leadingIcon: Icons.lock, trailingIcon: Icons.remove_red_eye,),
                Column(
                  spacing: 5.0,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AppTextfield(hintText: "Confirm Password", controller: cPasswordController, leadingIcon: Icons.lock, trailingIcon: Icons.remove_red_eye,),
                    // TextButton(
                    //     onPressed: () {},
                    //     child: Text("Forget Password?",
                    //         style: TextStyle(color: Appcolors.PrimaryColor))),
                  ],
                ),
                 SizedBox(height: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
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
                          "Create Account",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        )),
                  ],
                ),
                SizedBox(height: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 10,
                  children: [
                    Text("- OR Continue with",
                        style: TextStyle(color: Colors.black54, fontSize: 14)),
                    RichText(
                      text: TextSpan(
                        text: 'I Already Have an Account ',
                        style:  TextStyle(color: Colors.black54),
                        children:  <TextSpan>[
                          TextSpan(
                              text: 'Login',
                              style: TextStyle(color: Appcolors.PrimaryColor,
                               decoration: TextDecoration.underline, decorationColor: Appcolors.PrimaryColor, 
                               fontWeight: FontWeight.bold),
                               recognizer: TapGestureRecognizer()..onTap = () => Get.off(() => LoginView())
                               ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
      ),
    );
  }
}
