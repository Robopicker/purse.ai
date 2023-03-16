import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purse_ai_app/Bloc/loginState.dart';

enum loginAction { login, logut }
class loginBloc extends Bloc<loginAction, loginState> {
  loginBloc() : super(loginState(isLoggedIn: false, phoneNumber: 0, password: '')) {
    on((event, emit) => emit(getRes(event)));
    void login(data) => emit(data);
  }

  getRes(event) {
    print(event);
    switch (event) {
      case loginAction.login:
        return new loginState(isLoggedIn: true, phoneNumber: 0, password: '0');
      case loginAction.logut:
        return event.value;
    }
  }
}