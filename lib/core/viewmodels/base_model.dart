import 'package:flutter/material.dart';
import 'package:unit_test/core/enums/view_states.dart';

class BaseModel extends ChangeNotifier {
  ViewState _viewState = ViewState.idle;

  ViewState get viewState => _viewState;

  void changeState(ViewState viewState) {
    _viewState = viewState;
    notifyListeners();
  }
}
