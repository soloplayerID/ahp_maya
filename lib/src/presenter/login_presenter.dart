// ignore_for_file: avoid_print

import '../model/login_model.dart';
import '../state/login_state.dart';

abstract class LoginPresenterAbstract {
  set view(LoginState view) {}
  void loginClicked() {}
}

class LoginPresenter implements LoginPresenterAbstract {
  final LoginModel _loginModel = LoginModel();
  late LoginState _loginState;

  @override
  void loginClicked() {}

  @override
  set view(LoginState view) {
    _loginState = view;
    _loginState.refreshData(_loginModel);
  }
}
