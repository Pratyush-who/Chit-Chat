import 'package:firebasechat/core/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(bg,height: 1.sh,width: 1.sw,fit: BoxFit.cover,),
          Center(
          child: Image.asset(
            logo,
            height: 120,
            width: 120,
          ),
        ),
        
        ]
      ),
    );
  }
}
