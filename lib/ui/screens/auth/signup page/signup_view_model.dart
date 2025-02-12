import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasechat/core/other/base_view.dart';
import 'package:firebasechat/core/services/auth_service.dart';
import 'package:firebasechat/ui/screens/auth/signup%20page/signup.dart';
import 'package:flutter/material.dart';

class SignupViewModel extends BaseView {
  final AuthService auth;

   SignupViewModel(this.auth);

  String name = "";
  String password = "";
  String cnfpassword = "";
  String email = "";

  void setname(String value) {
    email = value;
    notifyListeners();
  }

  void setemail(String value) {
    email = value;
    notifyListeners();
  }

  void setpassword(String value) {
    email = value;
    notifyListeners();
  }

  setcnfpassword(String value) {
    password = value;
    notifyListeners();
  }

  Signup() async {
     try {
    User? user = await auth.signup(email, password);
    if (user != null) {
      return true; // Success
    } else {
      return false; // Failure
    }
  } on FirebaseAuthException catch (e) {
    debugPrint("FirebaseAuthException: ${e.message}");
    rethrow;
  } catch (e) {
    debugPrint("Error: ${e.toString()}");
    rethrow;
  }
  }
}
