import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasechat/core/enums/enums.dart';
import 'package:firebasechat/core/models/user_models.dart';
import 'package:firebasechat/core/other/base_view.dart';
import 'package:firebasechat/core/services/db_services.dart';

class HomeViewModel extends BaseView {
  final dbServices db;

  UserModel? _currentUser;

  UserModel? get currentUser => _currentUser;

  HomeViewModel(this.db, String uid) {
    fetchUserData(uid);
  }

  fetchUserData(String uid) async {
    setstate(ViewState.loading);
    final res = await db.loadUser(uid);
    if (res != null) {
      _currentUser = UserModel.fromMap(res);
    }
    setstate(ViewState.idle);
  }
}
