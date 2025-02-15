import 'package:firebasechat/core/enums/enums.dart';
import 'package:firebasechat/core/services/auth_service.dart';
import 'package:firebasechat/core/services/db_services.dart';
import 'package:firebasechat/ui/screens/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.uid});
  final String uid;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(dbServices(), uid),
      child: Consumer<HomeViewModel>(builder: (context, model, _) {
        return Scaffold(
          // <-- Add this
          appBar: AppBar(title: Text('Home')), // Optional
          body: Center(
            child: model.state == ViewState.loading
                ? CircularProgressIndicator()
                : InkWell(
                    onTap: () {
                      AuthService().logout();
                    },
                    child: Text(model.currentUser.toString()),
                  ),
          ),
        );
      }),
    );
  }
}
