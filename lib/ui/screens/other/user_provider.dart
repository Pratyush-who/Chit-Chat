import 'package:firebasechat/core/models/user_models.dart';
import 'package:firebasechat/core/services/db_services.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  final dbServices database;
  UserProvider(this.database);

  UserModel? currentUser;

  UserModel? get user => currentUser;

  loadUser(String uid) async {
    print("Fetching user data for UID: $uid"); 
    final userData = await database.loadUser(uid);

    if (userData != null) {
      print("User data fetched: $userData");
      currentUser = UserModel.fromMap(userData);
      notifyListeners();
    } else {
      print("No user data found for UID: $uid");
    }
  }
  clearUser() { 
    currentUser = null;
    notifyListeners();
  }
}
