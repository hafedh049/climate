class UserModel {
  String uid;
  String password;
  String email;
  String username;

  UserModel({required this.uid, required this.password, required this.email, required this.username});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(uid: json['uid'] as String, password: json['password'] as String, email: json['email'] as String, username: json['username'] as String);
  }

  Map<String, dynamic> toJson() => <String, String>{'uid': uid, 'password': password, 'email': email, 'username': username};
}
