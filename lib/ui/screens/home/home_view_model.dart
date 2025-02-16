import 'package:firebasechat/core/other/base_view.dart';
import 'package:firebasechat/core/services/db_services.dart';

class HomeViewModel extends BaseView {
  final dbServices db;

  HomeViewModel(
    this.db,
  );
}
