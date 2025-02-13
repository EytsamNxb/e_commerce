import 'package:ecommerce/custom_widgets/loader.dart';
import 'package:ecommerce/features/authentication/presentation/login/login_provider.dart';
import 'package:ecommerce/utils/AppColors.dart';
import 'package:ecommerce/features/authentication/presentation/forgot_password/forgot_password.dart';
import 'package:ecommerce/features/authentication/presentation/signup/signup_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, provider, child) {
        return Stack(
            children: [
              Scaffold(
                body: SafeArea(
                  child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: 20,
                    children: [
                      Text(
                        "Welcome \nBack!",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 36),
                      ),
                      TextField(
                        controller: provider.username,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            focusColor: Colors.white,
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(
                                    color: Appcolors.PrimaryColor, width: 1.0)),
                            hintText: "Email",
                            prefixIcon: Icon(Icons.email, color: Colors.black54)),
                      ),
                      Column(
                        spacing: 5.0,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextField(
                            controller: provider.password,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2.0),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5.0))),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5.0)),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 1.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5.0)),
                                      borderSide: BorderSide(
                                          color: Appcolors.PrimaryColor,
                                          width: 1.0)),
                                  hintText: "Password",
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.black54,
                                  ),
                                  suffixIcon: Icon(Icons.remove_red_eye,
                                      color: Colors.black54))),
                          TextButton(
                              onPressed: () {
                                Get.to(ForgotPasswordView());
                              },
                              child: Text("Forget Password?",
                                  style: TextStyle(color: Appcolors.PrimaryColor))),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                provider.login();
                              },
                              style: ButtonStyle(
                                  minimumSize: WidgetStatePropertyAll<Size>(
                                      Size.fromHeight(50.0)),
                                  shape: WidgetStatePropertyAll<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8.0),
                                          side: BorderSide(color: Colors.red))),
                                  backgroundColor: WidgetStatePropertyAll<Color>(
                                      Appcolors.PrimaryColor)),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              )),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 10,
                        children: [
                          Text("- OR Continue with",
                              style:
                                  TextStyle(color: Colors.black54, fontSize: 14)),
                          RichText(
                            text: TextSpan(
                              text: 'Create An Account ',
                              style: TextStyle(color: Colors.black54),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Sign Up',
                                    style: TextStyle(
                                        color: Appcolors.PrimaryColor,
                                        decoration: TextDecoration.underline,
                                        decorationColor: Appcolors.PrimaryColor,
                                        fontWeight: FontWeight.bold),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => Get.off(() => SignupView())),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                              ),
                ),
              ),
            provider.isLoading ? Loader() : Container()
            ]
          );
      },
    );
  }
}
