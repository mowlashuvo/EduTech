import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/login.dart';
import '../entities/registration.dart';

abstract class AuthRepository {
  Future <Either<Failure, LoginEntity>> getUser({required String email, required String password});
  Future <Either<Failure, LoginEntity>> addUser({required RegistrationEntity registration});
  Future <Either<Failure, LoginEntity>> googleUser({required String email, required String name});
  Future <Either<Failure, String>> deleteUser({required String id});
}