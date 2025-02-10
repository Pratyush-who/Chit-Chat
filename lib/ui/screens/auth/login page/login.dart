import 'package:firebasechat/core/constants/strings.dart';
import 'package:firebasechat/ui/widgets/customButton.dart';
import 'package:firebasechat/ui/widgets/cutsomTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 1.sw * 0.05, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              90.verticalSpace,
              Text(
                'Login!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Please Log in to Your Account',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              SizedBox(
                height: 40,
              ),
              CustomTextField(
                onChanged: (p0) {},
                hintText: ("Enter Email"),
                icon: Icons.email,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextField(
                onChanged: (p0) {},
                hintText: ("Enter Password"),
                isPassword: true,
                icon: Icons.password,
              ),
              SizedBox(height: 35),
              CustomButton(
                content: "Sign In",
                onPressed: () {},
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an Account?",
                    style: TextStyle(fontSize: 16),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, signup);
                    },
                    child: Text(
                      'Signup',
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
