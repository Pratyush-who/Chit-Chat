import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasechat/core/constants/strings.dart';
import 'package:firebasechat/core/extension/snackbar.dart';
import 'package:firebasechat/core/services/auth_service.dart';
import 'package:firebasechat/ui/screens/auth/signup%20page/signup_view_model.dart';
import 'package:firebasechat/ui/widgets/customButton.dart';
import 'package:firebasechat/ui/widgets/cutsomTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignupViewModel>(
      create: (context) => SignupViewModel(AuthService()),
      child: Consumer<SignupViewModel>(builder: (context, model, _) {
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
                    onChanged: model.setname,
                    hintText: ("Enter Name"),
                    icon: Icons.person,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    onChanged: model.setemail,
                    hintText: ("Enter Email"),
                    icon: Icons.email,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    onChanged: model.setpassword,
                    hintText: ("Enter Password"),
                    isPassword: true,
                    icon: Icons.password,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    onChanged: model.setcnfpassword,
                    hintText: ("Confirm Password"),
                    isPassword: true,
                    icon: Icons.password,
                  ),
                  SizedBox(height: 35),
                  CustomButton(
                    content: "Sign Up",
                    onPressed: () async {
                      try {
                        bool success = await model.Signup();
                        if (success) {
                          context.showSnackbar("Account Created Successfully!");
                        } else {
                          context.showSnackbar(
                              "Login failed. Please check your credentials.");
                        }
                      } on FirebaseAuthException catch (e) {
                        context.showSnackbar(e.message ?? "An error occurred");
                      } catch (e) {
                        context.showSnackbar(e.toString());
                      }
                    },
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
