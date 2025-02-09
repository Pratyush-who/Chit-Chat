import 'package:firebasechat/core/constants/strings.dart';
import 'package:firebasechat/ui/screens/splashscreens/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteUtils {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      // case home:
      //   return MaterialPageRoute(builder: (context) => HomeScreen());
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
