part of 'forget_password_bloc.dart';

abstract class ForgetPasswordState extends Equatable {
  const ForgetPasswordState();
  @override
  List<Object?> get props => [];
}

class ForgetPasswordInitial extends ForgetPasswordState {}

class UpdateForgetPasswordState extends ForgetPasswordState {
  final String? phone;

  const UpdateForgetPasswordState({this.phone});
  @override
  List<Object?> get props => [
    phone,
  ];
}

class SuccessForgetPasswordState extends ForgetPasswordState {
  final String? message;

  const SuccessForgetPasswordState({this.message});

  @override
  List<Object?> get props => [
    message,
  ];
}

class ErrorForgetPasswordState extends ForgetPasswordState {
  final String? message;

  const ErrorForgetPasswordState({this.message});
  @override
  List<Object?> get props => [
    message,
  ];
}