import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasechat/ui/screens/auth/login%20page/login.dart';
import 'package:firebasechat/ui/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override 
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        final user = FirebaseAuth.instance.currentUser; // Check if user is logged in

        if (user == null) {
          return const Login();
        } else {
          return const HomeScreen();
        }
      },
    );
  }
}

