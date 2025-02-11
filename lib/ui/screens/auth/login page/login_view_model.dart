import 'package:firebasechat/core/other/base_view.dart';
import 'package:firebasechat/core/services/auth_service.dart';
import 'package:firebasechat/ui/screens/auth/login%20page/login.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends BaseView {
  final AuthService auth;
  LoginViewModel(this.auth);
  String email = "";
  String password = "";

  void setEmail(String value) {
    email = value;
    notifyListeners();
  }

  setPassword(String value) {
    password = value;
    notifyListeners();
  }

  Login() async {
    // auth.signup(email, password)
    try {
      auth.login(email, password);
    } catch (e) {}
  }
}
