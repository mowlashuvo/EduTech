import 'dart:convert';

import '../../domain/entities/enrolled_course_entity.dart';

class EnrolledCourseModel {
  final bool? status;
  final String? message;
  final List<EnrolledCourseDataModel>? data;
  final int? total;

  EnrolledCourseModel({
    this.status,
    this.message,
    this.data,
    this.total,
  });

  EnrolledCourseEntity toEntity() =>
      EnrolledCourseEntity(
        status: status,
        message: message,
        data: data== null ? [] : List<EnrolledCourseDataEntity>.from(data!.map((x) => x.toEntity())),
        total: total,
      );

  factory EnrolledCourseModel.fromRawJson(String str) => EnrolledCourseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EnrolledCourseModel.fromJson(Map<String, dynamic> json) => EnrolledCourseModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<EnrolledCourseDataModel>.from(json["data"]!.map((x) => EnrolledCourseDataModel.fromJson(x))),
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "total": total,
  };
}

class EnrolledCourseDataModel {
  final String? name;
  final String? image;

  EnrolledCourseDataModel({
    this.name,
    this.image,
  });

  EnrolledCourseDataEntity toEntity() =>
      EnrolledCourseDataEntity(
        name: name,
        image: image,
      );

  factory EnrolledCourseDataModel.fromRawJson(String str) => EnrolledCourseDataModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EnrolledCourseDataModel.fromJson(Map<String, dynamic> json) => EnrolledCourseDataModel(
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
  };
}
