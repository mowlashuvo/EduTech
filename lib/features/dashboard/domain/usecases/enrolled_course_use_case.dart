import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/enrolled_course_entity.dart';
import '../repository/enrolled_course_repository.dart';

class EnrolledCourseUseCase {
  final EnrolledCourseRepository _repository;

  const EnrolledCourseUseCase({required EnrolledCourseRepository repository}) : _repository = repository;

  Future<Either<Failure, EnrolledCourseEntity>> execute() {
    return _repository.getEnrolledCourse();
  }

  Future<Either<Failure, EnrolledCourseEntity>> post({required String id}) {
    return _repository.addEnrolledCourse(id: id);
  }

  Future<Either<Failure, EnrolledCourseEntity>> delete({required String id}) {
    return _repository.deleteEnrolledCourse(id: id);
  }
}
