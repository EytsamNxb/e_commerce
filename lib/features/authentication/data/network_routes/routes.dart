import 'package:ecommerce/network/base_route.dart';

enum Routes implements BaseRoute {
  login, signup, forgotPassword;

  @override
  String get path {
     switch (this) {
      case Routes.login:
      return "/auth/login";
      case Routes.signup:
      return "auth/signup";
      case Routes.forgotPassword:
      return "auth/forgotPassword";
    }
  }

  @override
  HttpMethod get method {
    switch (this) {
      case login:
      return HttpMethod.post;
      case signup:
      return HttpMethod.post;
      case forgotPassword:
      return HttpMethod.post;
    }
  }

  @override
  Map<String, dynamic>? get authHeaders {
   return null;
  }

}