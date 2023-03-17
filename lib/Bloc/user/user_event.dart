abstract class UserEvent {}

class UserLogin extends UserEvent {
  String data;
  UserLogin({required this.data});
}

class CreateAccount extends UserEvent {
  String name;
  String email;
  String password;
  CreateAccount({ required this.name, required this.email, required this.password});
}

class UserLogout extends UserEvent {}