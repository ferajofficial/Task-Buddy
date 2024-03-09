import 'dart:convert';

class SignInModel {
  final bool? status;
  final String? message;
  final String? id;

  SignInModel({
    this.status,
    this.message,
    this.id, 
  });

  SignInModel copyWith({
    bool? status,
    String? message,
    String? id,
  }) =>
      SignInModel(
        status: status ?? this.status,
        message: message ?? this.message,
        id: id ?? this.id,
      );

  factory SignInModel.fromJson(String str) =>
      SignInModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SignInModel.fromMap(Map<String, dynamic> json) => SignInModel(
        status: json["status"],
        message: json["message"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "id": id,
      };
}
