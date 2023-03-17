import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purse_ai_app/Bloc/user/user_event.dart';
import 'package:purse_ai_app/Bloc/user/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc()
      : super(UserState(isLoggedIn: false, name: '', email: '', password: '')) {
    on((event, emit) => emit(getRes(event)));
  }

  getRes(event) {
    if (event is UserLogin) {
      return UserState(
          isLoggedIn: true,
          name: state.name,
          email: state.email,
          password: state.password);
    } else if (event is CreateAccount) {
      return UserState(
          isLoggedIn: false,
          name: event.name,
          email: event.email,
          password: event.password);
    } else if (event is UserLogout) {
      return UserState(isLoggedIn: false, name: '', password: '', email: '');
    }
  }
}
