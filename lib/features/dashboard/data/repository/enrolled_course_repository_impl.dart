import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/enrolled_course_entity.dart';
import '../../domain/repository/enrolled_course_repository.dart';
import '../data_sources/enrolled_course_remote_data_source.dart';

class EnrolledCourseRepositoryImpl implements EnrolledCourseRepository {
  final EnrolledCourseRemoteDataSource _remoteDataSource;


  const EnrolledCourseRepositoryImpl({required EnrolledCourseRemoteDataSource remoteDataSource}) : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, EnrolledCourseEntity>> getEnrolledCourse() async {
    try {
      final result = await _remoteDataSource.getEnrolledCourse();
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, EnrolledCourseEntity>> addEnrolledCourse({required String id}) async {
    try {
      final result = await _remoteDataSource.addEnrolledCourse(id: id);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, EnrolledCourseEntity>> deleteEnrolledCourse({required String id}) async {
    try {
      final result = await _remoteDataSource.deleteEnrolledCourse(id: id);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

}