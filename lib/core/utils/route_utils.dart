import 'package:firebasechat/core/constants/strings.dart';
import 'package:firebasechat/ui/screens/auth/login%20page/login.dart';
import 'package:firebasechat/ui/screens/auth/signup%20page/signup.dart';
import 'package:firebasechat/ui/screens/home/home_screen.dart';
import 'package:firebasechat/ui/screens/splashscreens/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteUtils {

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case signup:
        return MaterialPageRoute(builder: (context) => Signup());
      case login:
        return MaterialPageRoute(builder: (context) => Login());
      case home:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('Route Not Found..!!'),
            ),
          ),
        );
    }
  }
}
