abstract class userEvent {}

class login extends userEvent {
  String data;
  login({required this.data});
}

class createAccount extends userEvent {
  String name;
  String email;
  String password;
  createAccount({ required this.name, required this.email, required this.password});
}

class logout extends userEvent {}