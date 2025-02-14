import 'package:ecommerce/app/locator.dart';
import 'package:ecommerce/features/authentication/presentation/login/login_provider.dart';
import 'package:ecommerce/features/product/presentation/home/home_provider.dart';
import 'package:ecommerce/features/product/presentation/product_detail/product_detail_provider.dart';
import 'package:ecommerce/shared_preferences/shared_preferences_service.dart';
import 'package:ecommerce/utils/AppColors.dart';
import 'package:ecommerce/features/authentication/presentation/forgot_password/forgot_password.dart';
import 'package:ecommerce/features/product/presentation/home/home_view.dart';
import 'package:ecommerce/views/landing_page.dart';
import 'package:ecommerce/features/authentication/presentation/login/login_view.dart';
import 'package:ecommerce/features/product/presentation/product_detail/product_detail.dart';
import 'package:ecommerce/features/authentication/presentation/signup/signup_view.dart';
import 'package:ecommerce/views/tabbar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<LoginProvider>(create: (_) => LoginProvider()),
      ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
      ChangeNotifierProvider<ProductDetailProvider>(create: (_) => ProductDetailProvider())
    ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final sfService = serviceLocator<SharedPreferencesService>();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Hoo Commerce",
      home: (sfService.token == "" || sfService.token == null)
          ? LoginView()
          : TabbarView(),
      getPages: [
        GetPage(name: '/signup', page: () => SignupView()),
        GetPage(name: '/login', page: () => LoginView()),
        GetPage(name: '/forgotPassword', page: () => ForgotPasswordView()),
        GetPage(name: '/tabbar', page: () => TabbarView()),
        GetPage(name: '/landingPage', page: () => LandingPage())
      ],
    );
  }
}
