import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/enrolled_course_entity.dart';

abstract class EnrolledCourseRepository {
  Future <Either<Failure, EnrolledCourseEntity>> getEnrolledCourse();
  Future <Either<Failure, EnrolledCourseEntity>> addEnrolledCourse({required String id});
  Future <Either<Failure, EnrolledCourseEntity>> deleteEnrolledCourse({required String id});
}