import 'dart:async';

import 'package:firebasechat/core/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, wrapper);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          bg,
          height: 1.sh,
          width: 1.sw,
          fit: BoxFit.cover,
        ),
        Center(
          child: Image.asset(
            logo,
            height: 120,
            width: 120,
          ),
        ),
      ]),
    );
  }
}
