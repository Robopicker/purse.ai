import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class UserState {
  bool isLoggedIn;
  String name;
  String email;
  String password;
  UserState(
      {required this.isLoggedIn,
      required this.name,
      required this.password,
      required this.email});
  factory UserState.fromJson(Map<String, dynamic> json) {
    return UserState(
        isLoggedIn: json['isLoggedIn'],
        name: json['name'],
        email: json['email'],
        password: json['password']);
  }
  Map<String, dynamic> toJson() {
    return {
      'isLoggedIn': isLoggedIn,
      'name': name,
      'email': email,
      'password': password
    };
  }
}
