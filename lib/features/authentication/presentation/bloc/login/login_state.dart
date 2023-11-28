part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class UpdateLoginState extends LoginState {
  final String? email;
  final String? password;
  final bool? isRememberMe;

  const UpdateLoginState({this.email, this.password, this.isRememberMe});
  @override
  List<Object?> get props => [
    email,
    password,
    isRememberMe,
  ];
}

class SuccessLoginState extends LoginState {
  final String? message;

  const SuccessLoginState({this.message});

  @override
  List<Object?> get props => [
    message,
  ];
}

class ErrorLoginState extends LoginState {
  final String? message;

  const ErrorLoginState({this.message});
  @override
  List<Object?> get props => [
    message,
  ];
}