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
// class SignInModel {
//   bool? status;
//   String? message;
//   String? id;

//   SignInModel({this.status, this.message, this.id});

//   // bool? get status => status;
//   // set status(bool? status) => status = status;
//   // String? get message => message;
//   // set message(String? message) => message = message;
//   // String? get id => id;
//   // set id(String? id) => id = id;

//   SignInModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'] as bool?;
//     message = json['message'] as String?;
//     id = json['id'] as String?;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     data['message'] = message;
//     data['id'] = id;
//     return data;
//   }
// }
