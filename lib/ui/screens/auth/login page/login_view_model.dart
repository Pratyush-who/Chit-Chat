import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasechat/core/enums/enums.dart';
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

  // void startLoading() {
  //   setstate(ViewState.loading);
  // }

  // void endLoading() {
  //   setstate(ViewState.idle);
  // }

  setPassword(String value) {
    password = value;
    notifyListeners();
  }

  Future<bool> Login() async {
    setstate(ViewState.loading);
    try {
      User? user = await auth.login(email, password);
      if (user != null) {
        return true; // Success
      } 
      else {
        return false; // Failure
      }
    } on FirebaseAuthException catch (e) {
      debugPrint("FirebaseAuthException: ${e.message}");
      setstate(ViewState.idle);
      rethrow;
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
      setstate(ViewState.idle);
      rethrow;
    }
  }
}
