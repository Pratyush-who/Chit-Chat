import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasechat/core/models/user_models.dart';
import 'package:firebasechat/core/other/base_view.dart';
import 'package:firebasechat/core/services/db_services.dart';

class ChatListViewmodel extends BaseView {
  final dbServices _db;
  final User? _currentUser;
  final _usersController = StreamController<List<UserModel>>.broadcast();

  ChatListViewmodel(this._db, this._currentUser) {
    fetchUser();
  }

  Stream<List<UserModel>> get usersStream => _usersController.stream;

  Future<void> fetchUser() async {
    try {
      if (_currentUser == null) return;
      
      final res = await _db.fetchUsers(_currentUser!.uid);
      if (res != null) {
        final users = res.map((e) => UserModel.fromMap(e)).toList();
        _usersController.add(users);
        notifyListeners();
      }
    } catch (e) {
      log("Error fetching User: $e");
      _usersController.addError(e);
    }
  }

  @override
  void dispose() {
    _usersController.close();
    super.dispose();
  }
}