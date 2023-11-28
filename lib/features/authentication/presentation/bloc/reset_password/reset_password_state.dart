part of 'reset_password_bloc.dart';

abstract class ResetPasswordState extends Equatable {
  const ResetPasswordState();
  @override
  List<Object?> get props => [];
}

class ResetPasswordInitial extends ResetPasswordState {}

class UpdateResetPasswordState extends ResetPasswordState {

  final String? password;
  final String? confirmPassword;

  const UpdateResetPasswordState({this.password, this.confirmPassword});

  @override
  List<Object?> get props => [password, confirmPassword];
}

class SuccessResetPasswordState extends ResetPasswordState {
  final String? message;

  const SuccessResetPasswordState({this.message});

  @override
  List<Object?> get props => [message];
}

class ErrorResetPasswordState extends ResetPasswordState {
  final String? message;

  const ErrorResetPasswordState({this.message});

  @override
  List<Object?> get props => [message];
}