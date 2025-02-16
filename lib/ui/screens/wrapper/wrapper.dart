import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasechat/ui/screens/auth/login%20page/login.dart';
import 'package:firebasechat/ui/screens/bottomnav/bottom_nav.dart';
import 'package:firebasechat/ui/screens/home/home_screen.dart';
import 'package:firebasechat/ui/screens/other/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        final user = FirebaseAuth.instance.currentUser;

        if (user == null) {
          return const Login();
        } else {
          return FutureBuilder(
            future: userProvider.loadUser(user.uid), // 🔄 Wait for data
            builder: (context, userSnapshot) {
              // if (userSnapshot.connectionState == ConnectionState.waiting) {
              //   return const Scaffold(
              //     body: Center(child: CircularProgressIndicator()), // ⏳ Show loading
              //   );
              // }
              return BottomNav();
            },
          );
        }
      },
    );
  }
}
