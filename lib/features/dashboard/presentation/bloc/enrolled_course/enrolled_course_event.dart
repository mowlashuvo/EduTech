part of 'enrolled_course_bloc.dart';

abstract class EnrolledCourseEvent extends Equatable {
  const EnrolledCourseEvent();

  @override
  List<Object?> get props => [];
}

class EnrolledCourseLoadingEvent extends EnrolledCourseEvent {}

class EnrolledCourseLoadEvent extends EnrolledCourseEvent {}

class AddEnrolledCourseLoadEvent extends EnrolledCourseEvent {
  final String id;

  const AddEnrolledCourseLoadEvent({required this.id});
}

class DeleteEnrolledCourseLoadEvent extends EnrolledCourseEvent {
  final String id;

  const DeleteEnrolledCourseLoadEvent({required this.id});
}

class EnrolledCourseSuccessEvent extends EnrolledCourseEvent {
  final List<EnrolledCourseDataEntity> products;

  const EnrolledCourseSuccessEvent(this.products);

  @override
  List<Object?> get props => [products];
}