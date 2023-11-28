part of 'enrolled_course_bloc.dart';

abstract class EnrolledCourseState extends Equatable {
  const EnrolledCourseState();

  @override
  List<Object?> get props => [];
}

class EnrolledCourseInitialState extends EnrolledCourseState {
  const EnrolledCourseInitialState();
}

class EnrolledCourseLoadingState extends EnrolledCourseState {
  final String? message;

  const EnrolledCourseLoadingState({this.message});

  @override
  List<Object?> get props => [message,];
}

class EnrolledCourseSuccessState extends EnrolledCourseState {
  final List<EnrolledCourseDataEntity> courses;

  const EnrolledCourseSuccessState({
    required this.courses,
  });
  @override
  List<Object?> get props => [courses];
}

class EnrolledCourseErrorState extends EnrolledCourseState {
  final String error;

  const EnrolledCourseErrorState({
    required this.error,
  });
  @override
  List<Object?> get props => [error];
}
