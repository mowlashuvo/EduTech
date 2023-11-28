import 'dart:convert';

import '../../domain/entities/login.dart';

class LoginModel {
  final bool? status;
  final String? message;
  final LoginDataModel? data;
  final int? total;

  LoginModel({
    this.status,
    this.message,
    this.data,
    this.total,
  });

  LoginEntity toEntity() =>
      LoginEntity(
        status: status,
        message: message,
        data: data!.toEntity(),
        total: total,
      );

  factory LoginModel.fromRawJson(String str) => LoginModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : LoginDataModel.fromJson(json["data"]),
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
    "total": total,
  };
}

class LoginDataModel {
  final String? token;
  final UserModel? user;

  LoginDataModel({
    this.token,
    this.user,
  });

  LoginDataEntity toEntity() =>
      LoginDataEntity(
        token: token,
        user: user!.toEntity(),
      );

  factory LoginDataModel.fromRawJson(String str) => LoginDataModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginDataModel.fromJson(Map<String, dynamic> json) => LoginDataModel(
    token: json["token"],
    user: json["user"] == null ? null : UserModel.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "user": user?.toJson(),
  };
}

class UserModel {
  final int? id;
  final String? roleId;
  final String? name;
  final String? email;

  UserModel({
    this.id,
    this.roleId,
    this.name,
    this.email,
  });

  UserEntity toEntity() =>
      UserEntity(
        id: id,
        roleId: roleId,
        name: name,
        email: email,
      );

  factory UserModel.fromRawJson(String str) => UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    roleId: json["role_id"],
    name: json["name"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "role_id": roleId,
    "name": name,
    "email": email,
  };
}
