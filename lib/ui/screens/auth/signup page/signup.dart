import 'package:firebasechat/core/constants/strings.dart';
import 'package:firebasechat/ui/widgets/customButton.dart';
import 'package:firebasechat/ui/widgets/cutsomTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

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
                'Create Your Account!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Please Provide Your Details',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              SizedBox(
                height: 40,
              ),
              CustomTextField(
                onChanged: (p0) {},
                hintText: ("Enter Name"),
                icon: Icons.person,
              ),
              SizedBox(
                height: 15,
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
              SizedBox(
                height: 15,
              ),
              CustomTextField(
                onChanged: (p0) {},
                hintText: ("Confirm Password"),
                isPassword: true,
                icon: Icons.password,
              ),
              SizedBox(height: 35),
              CustomButton(
                content: "Sign Up",
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
                    'Already have an account?',
                    style: TextStyle(fontSize: 16),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, login);
                    },
                    child: Text(
                      'Login',
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
