import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/login.dart';
import '../../domain/entities/registration.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_sources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;


  const AuthRepositoryImpl({required AuthRemoteDataSource remoteDataSource}) : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, LoginEntity>> getUser({required String email, required String password}) async {
    try {
      final result = await _remoteDataSource.getUser(email: email, password: password);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, LoginEntity>> googleUser({required String email, required String name}) async {
    try {
      final result = await _remoteDataSource.googleUser();
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, LoginEntity>> addUser({required RegistrationEntity registration}) async {
    try {
      final result = await _remoteDataSource.addUser(registration: registration);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, String>> deleteUser({required String id}) async {
    try {
      final result = await _remoteDataSource.deleteUser(id: id);
      return const Right('result.toEntity()');
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

}