import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasechat/core/enums/enums.dart';
import 'package:firebasechat/core/other/base_view.dart';
import 'package:firebasechat/core/services/auth_service.dart';
import 'package:flutter/material.dart';

class SignupViewModel extends BaseView {
  final AuthService auth;

  SignupViewModel(this.auth);

  String name = "";
  String email = "";
  String password = "";
  String cnfpassword = "";

  void setname(String value) {
    name = value;
    notifyListeners();
  }

  void setemail(String value) {
    email = value;
    notifyListeners();
  }

  void setpassword(String value) {
    password = value;
    notifyListeners();
  }

  void setcnfpassword(String value) {
    cnfpassword = value;
    notifyListeners();
  }

  Future<bool> Signup() async {
    setstate(ViewState.loading);
    try {
      if (password != cnfpassword) {
        debugPrint("Passwords do not match");
        setstate(ViewState.idle);
        return false;
      }

      User? user = await auth.signup(email, password);
      setstate(ViewState.idle);
      return user != null;
    } on FirebaseAuthException catch (e) {
      debugPrint("FirebaseAuthException: ${e.message}");
      setstate(ViewState.idle);
      return false;
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
      setstate(ViewState.idle);
      return false;
    }
  }
}
