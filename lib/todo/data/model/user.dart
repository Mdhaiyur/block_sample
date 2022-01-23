import 'dart:convert';

import 'package:hive/hive.dart';
part 'user.g.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

@HiveType(typeId: 2)
class User {
  User({
    this.user,
    this.token,
  });

  @HiveField(0)
  UserModel? user;
  @HiveField(1)
  String? token;

  factory User.fromJson(Map<String, dynamic> json) => User(
    user: UserModel.fromJson(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "user": user!.toJson(),
    "token": token,
  };

  @override
  String toString() {
    return 'User{user: $user, token: $token}';
  }
}
@HiveType(typeId: 1)
class UserModel {
  UserModel({
    this.age,
    this.id,
    this.name,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  @HiveField(0)
  int? age;
  @HiveField(1)
  String? id;
  @HiveField(2)
  String? name;
  @HiveField(3)
  String? email;
  @HiveField(4)
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    age: json["age"],
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "age": age,
    "_id": id,
    "name": name,
    "email": email,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };

  @override
  String toString() {
    return 'UserModel{age: $age, id: $id, name: $name, email: $email, createdAt: $createdAt, updatedAt: $updatedAt, v: $v}';
  }
}
