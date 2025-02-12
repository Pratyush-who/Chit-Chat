import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<User?> login(String email, String password) async {
  try {
    final userCredential = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (userCredential.user != null) {
      log("User logged in..!!");
      return userCredential.user;
    }
  } on FirebaseAuthException catch (e) {
    log(e.message!);
    rethrow; // Rethrow the exception to handle it in the ViewModel
  } catch (e) {
    log(e.toString());
    rethrow; // Rethrow the exception to handle it in the ViewModel
  }
  return null; // Explicitly return null if login fails
}

  Future<void> logout() async {
    try {
      await auth.signOut();
    } catch (e) {
      log(e.toString());
    }
  }

  Future<User?> signup(String email, String password) async {
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (userCredential.user != null) {
        log("User Created..!!");
        return userCredential.user;
      }
    } on FirebaseAuthException catch (e) {
      log(e.message!);
      rethrow;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
    return null;
  }
}
