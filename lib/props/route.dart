import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import '../pages/signin_page.dart';
import '../pages/signup_page.dart';

class RouterG {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // route
      case SignupPage.routeName:
        return MaterialPageRoute(builder: (_) => SignupPage());

      // route buat paramater value
      case SigninPage.routeName:
        final args = settings.arguments as LoginScreenArguments;
        return MaterialPageRoute(builder: (_) => SigninPage(data: args.data));

      // route buat paramater value
      case HomePage.routeName:
        final args = settings.arguments as LoginScreenArguments;
        return MaterialPageRoute(builder: (_) => HomePage(data: args.data));

      default:
        return _errorRoute();
    }
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
      ),
      body: Center(
        child: Text('err'),
      ),
    );
  });
}

class LoginScreenArguments {
  final Map data;

  LoginScreenArguments(this.data);
}
