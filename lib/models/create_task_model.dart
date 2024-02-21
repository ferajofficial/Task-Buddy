import 'dart:convert';

class CreateTaskModel {
  final String? message;
  final Task? task;

  CreateTaskModel({
    this.message,
    this.task,
  });

  CreateTaskModel copyWith({
    String? message,
    Task? task,
  }) =>
      CreateTaskModel(
        message: message ?? this.message,
        task: task ?? this.task,
      );

  factory CreateTaskModel.fromJson(String str) =>
      CreateTaskModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreateTaskModel.fromMap(Map<String, dynamic> json) => CreateTaskModel(
        message: json["message"],
        task: json["task"] == null ? null : Task.fromMap(json["task"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "task": task?.toMap(),
      };
}

class Task {
  final String? title;
  final String? description;
  final String? priority;
  final DateTime? startDate;
  final DateTime? dueDate;
  final List<String>? emails;
  final String? status;
  final String? id;
  final int? v;

  Task({
    this.title,
    this.description,
    this.priority,
    this.startDate,
    this.dueDate,
    this.emails,
    this.status,
    this.id,
    this.v,
  });

  Task copyWith({
    String? title,
    String? description,
    String? priority,
    DateTime? startDate,
    DateTime? dueDate,
    List<String>? emails,
    String? status,
    String? id,
    int? v,
  }) =>
      Task(
        title: title ?? this.title,
        description: description ?? this.description,
        priority: priority ?? this.priority,
        startDate: startDate ?? this.startDate,
        dueDate: dueDate ?? this.dueDate,
        emails: emails ?? this.emails,
        status: status ?? this.status,
        id: id ?? this.id,
        v: v ?? this.v,
      );

  factory Task.fromJson(String str) => Task.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Task.fromMap(Map<String, dynamic> json) => Task(
        title: json["title"],
        description: json["description"],
        priority: json["priority"],
        startDate: json["startDate"] == null
            ? null
            : DateTime.parse(json["startDate"]),
        dueDate:
            json["dueDate"] == null ? null : DateTime.parse(json["dueDate"]),
        emails: json["emails"] == null
            ? []
            : List<String>.from(json["emails"]!.map((x) => x)),
        status: json["status"],
        id: json["_id"],
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "description": description,
        "priority": priority,
        "startDate": startDate?.toIso8601String(),
        "dueDate": dueDate?.toIso8601String(),
        "emails":
            emails == null ? [] : List<dynamic>.from(emails!.map((x) => x)),
        "status": status,
        "_id": id,
        "__v": v,
      };
}
