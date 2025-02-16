import 'package:firebasechat/core/other/base_view.dart';

class BottomNavViewmodel extends BaseView {
  int currInd = 1;
  int get currIndex => currInd;
  setIndex(int value) {
    if (currInd != value) {
      currInd = value;
      notifyListeners();
    }
  }
}
