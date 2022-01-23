// To parse this JSON data, do
//
//     final todoModel = todoModelFromJson(jsonString);

import 'dart:convert';

TodoModel todoModelFromJson(String str) => TodoModel.fromJson(json.decode(str));

String todoModelToJson(TodoModel data) => json.encode(data.toJson());

class TodoModel {
  TodoModel({
    this.count,
    this.data,
  });

  int? count;
  List<Todo>? data;

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
    count: json["count"],
    data: List<Todo>.from(json["data"].map((x) => Todo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Todo {
  Todo({
    this.completed,
    this.id,
    this.description,
    this.owner,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  bool? completed;
  String? id;
  String? description;
  String? owner;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
    completed: json["completed"],
    id: json["_id"],
    description: json["description"],
    owner: json["owner"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "completed": completed,
    "_id": id,
    "description": description,
    "owner": owner,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
    "__v": v,
  };
}
