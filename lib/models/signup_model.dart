import 'dart:convert';

class SignUpModel {
  final String? message;
  final User? user;

  SignUpModel({
    this.message,
    this.user,
  });

  SignUpModel copyWith({
    String? message,
    User? user,
  }) =>
      SignUpModel(
        message: message ?? this.message,
        user: user ?? this.user,
      );

  factory SignUpModel.fromJson(String str) =>
      SignUpModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SignUpModel.fromMap(Map<String, dynamic> json) => SignUpModel(
        message: json["message"],
        user: json["user"] == null ? null : User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "user": user?.toMap(),
      };
}

class User {
  final String? name;
  final String? email;
  final String? password;
  final String? id;

  User({
    this.name,
    this.email,
    this.password,
    this.id,
  });

  User copyWith({
    String? name,
    String? email,
    String? password,
    String? id,
  }) =>
      User(
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        id: id ?? this.id,
      );

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        id: json["_id"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
        "password": password,
        "_id": id,
      };
}
