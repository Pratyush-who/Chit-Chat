import 'package:firebasechat/core/services/auth_service.dart';
import 'package:firebasechat/core/services/db_services.dart';
import 'package:firebasechat/ui/screens/home/home_view_model.dart';
import 'package:firebasechat/ui/screens/other/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(dbServices()),
      child: Consumer<HomeViewModel>(builder: (context, model, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
          ),
          body: Center(
            child: Consumer<UserProvider>(
              builder: (context, userProvider, _) {
                if (userProvider.user == null) {
                  return const CircularProgressIndicator();
                }
                return InkWell(
                  onTap: () {
                    AuthService().logout();
                  },
                  child: Text(userProvider.user
                      .toString()),
                      
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
