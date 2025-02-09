import 'package:firebasechat/core/enums/enums.dart';
import 'package:flutter/material.dart';

class BaseView extends ChangeNotifier {
  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  StepState(ViewState state) {
    _state = state;
    notifyListeners();
  }
}
