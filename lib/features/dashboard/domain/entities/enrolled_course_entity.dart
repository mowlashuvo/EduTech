import 'package:equatable/equatable.dart';

class EnrolledCourseEntity extends Equatable {
  final bool? status;
  final String? message;
  final List<EnrolledCourseDataEntity>? data;
  final int? total;

  const EnrolledCourseEntity({
    this.status,
    this.message,
    this.data,
    this.total,
  });

  @override
  List<Object?> get props => [status, message, data, total];
}

class EnrolledCourseDataEntity extends Equatable {
  final String? name;
  final String? image;

  const EnrolledCourseDataEntity({
    this.name,
    this.image,
  });

  @override
  List<Object?> get props => [name, image];
}
