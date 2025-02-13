import 'package:ecommerce/features/authentication/application/auth_service.dart';
import 'package:ecommerce/features/authentication/data/auth_repository.dart';
import 'package:ecommerce/features/authentication/domain/user.dart';
import 'package:ecommerce/network/network_error.dart';
import 'package:ecommerce/views/tabbar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';

class LoginProvider with ChangeNotifier {
  User? user;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final service = AuthService(authRepository: AuthRepository());
  bool isLoading = false;

  login() {
    if (username.text == "" || password.text == "") {
      return;
    }
    isLoading = true;
    notifyListeners();
    service.loginWithUsernameAndPassword(username.text, password.text).then(
        (value) {
      print(value.email);
      isLoading = false;
      notifyListeners();
      Get.to(TabbarView());
    }, onError: (error, stacktrace) {
      // In case of decoding error
         isLoading = false;
      notifyListeners();
      if (error is FormatException) {
        print("Decoding Error: ${error.message}");
      } else if (error is NetworkError) {
        // In case of network error
        final appError = error;
        print(appError.message);
      }
    });
  }
}
