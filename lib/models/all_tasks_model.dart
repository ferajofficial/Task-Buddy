import 'dart:convert';

class AllTaskModel {
  final String? message;
  final List<Task>? tasks;

  AllTaskModel({
    this.message,
    this.tasks,
  });

  AllTaskModel copyWith({
    String? message,
    List<Task>? tasks,
  }) =>
      AllTaskModel(
        message: message ?? this.message,
        tasks: tasks ?? this.tasks,
      );

  factory AllTaskModel.fromJson(String str) =>
      AllTaskModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AllTaskModel.fromMap(Map<String, dynamic> json) => AllTaskModel(
        message: json["message"],
        tasks: json["tasks"] == null
            ? []
            : List<Task>.from(json["tasks"]!.map((x) => Task.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "tasks": tasks == null
            ? []
            : List<dynamic>.from(tasks!.map((x) => x.toMap())),
      };
}

class Task {
  final String? status;
  final String? id;
  final String? title;
  final String? description;
  final String? priority;
  final DateTime? startDate;
  final DateTime? dueDate;
  final List<String>? emails;
  final int? v;

  Task({
    this.status,
    this.id,
    this.title,
    this.description,
    this.priority,
    this.startDate,
    this.dueDate,
    this.emails,
    this.v,
  });

  Task copyWith({
    String? status,
    String? id,
    String? title,
    String? description,
    String? priority,
    DateTime? startDate,
    DateTime? dueDate,
    List<String>? emails,
    int? v,
  }) =>
      Task(
        status: status ?? this.status,
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        priority: priority ?? this.priority,
        startDate: startDate ?? this.startDate,
        dueDate: dueDate ?? this.dueDate,
        emails: emails ?? this.emails,
        v: v ?? this.v,
      );

  factory Task.fromJson(String str) => Task.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Task.fromMap(Map<String, dynamic> json) => Task(
        status: json["status"],
        id: json["_id"],
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
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "_id": id,
        "title": title,
        "description": description,
        "priority": priority,
        "startDate": startDate?.toIso8601String(),
        "dueDate": dueDate?.toIso8601String(),
        "emails":
            emails == null ? [] : List<dynamic>.from(emails!.map((x) => x)),
        "__v": v,
      };
}
