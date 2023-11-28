part of 'registration_bloc.dart';

abstract class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object?> get props => [];
}

class RegistrationInitial extends RegistrationState {}

class UpdateRegistrationState extends RegistrationState {
  final String? name;
  final String? email;
  final String? mobile;
  final String? password;
  final String? confirmPassword;
  final bool? isAgree;

  const UpdateRegistrationState({
    this.name,
    this.email,
    this.mobile,
    this.password,
    this.confirmPassword,
    this.isAgree,
  });

  @override
  List<Object?> get props => [
        name,
        email,
        mobile,
        password,
        confirmPassword,
        isAgree,
      ];
}

class SuccessRegistrationState extends RegistrationState {
  final String? message;

  const SuccessRegistrationState({this.message});

  @override
  List<Object?> get props => [
        message,
      ];
}

class ErrorRegistrationState extends RegistrationState {
  final String? message;

  const ErrorRegistrationState({this.message});

  @override
  List<Object?> get props => [
        message,
      ];
}
