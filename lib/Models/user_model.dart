class User {
  final String name;
  final String thumbnail;
  final String email;

  User({required this.thumbnail, required this.email, required this.name});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: json['name'], thumbnail: json['thumbnail'], email: json['email']);
  }
}
