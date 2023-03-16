import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purse_ai_app/Bloc/user/userEvent.dart';
import 'package:purse_ai_app/Bloc/user/userState.dart';

class userBloc extends Bloc<userEvent, userState> {
  userBloc() : super(userState(isLoggedIn: false, name: '',email: '', password: '' )) {
    on((event, emit) => emit(getRes(event)));
  }

  getRes(event) {
     if (event is login) {
      print(event.data);
      return new userState(isLoggedIn: true, name: state.name, email: state.email, password: state.password);
    } else if (event is createAccount) {
      print(event);
      return new userState(isLoggedIn: false, name: event.name ,email: event.email, password: event.password);
    }
    else if (event is logout) {
      return new userState(isLoggedIn: false, name: '', password: '', email: '');
    }
  }
}