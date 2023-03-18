import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:purse_ai_app/Bloc/user/user_event.dart';
import 'package:purse_ai_app/Bloc/user/user_state.dart';

@JsonSerializable()
class UserBloc extends HydratedBloc<UserEvent, UserState> {
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

  @override
  UserState? fromJson(Map<String, dynamic> json) {
    return UserState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(UserState state) {
    return state.toJson();
  }
}
