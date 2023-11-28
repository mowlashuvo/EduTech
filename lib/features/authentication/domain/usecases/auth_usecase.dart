import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/login.dart';
import '../entities/registration.dart';
import '../repository/auth_repository.dart';

class AuthUseCase {
  final AuthRepository _repository;

  const AuthUseCase({required AuthRepository repository}) : _repository = repository;

  Future<Either<Failure, LoginEntity>> login({required String email, required String password}) {
    return _repository.getUser(email: email, password: password);
  }

  Future<Either<Failure, LoginEntity>> googleUser({required String email, required String name}) {
    return _repository.googleUser(email: email, name: name);
  }

  Future<Either<Failure, LoginEntity>> registration({required RegistrationEntity registration}) {
    return _repository.addUser(registration: registration);
  }

  Future<Either<Failure, String>> delete({required String id}) {
    return _repository.deleteUser(id: id);
  }
}
