part of 'otp_bloc.dart';

abstract class OtpState extends Equatable {
  const OtpState();
  @override
  List<Object?> get props => [];
}

class OtpInitial extends OtpState {}

class UpdateOtpState extends OtpState {
  final String? email;
  final String? code;
  final bool? isVerified;

  const UpdateOtpState({this.email, this.code, this.isVerified,});

  @override
  List<Object?> get props => [email, code, isVerified];
}

class SuccessOtpState extends OtpState {
  final String? message;

  const SuccessOtpState({this.message});

  @override
  List<Object?> get props => [
    message,
  ];
}

class ErrorOtpState extends OtpState {
  final String? message;

  const ErrorOtpState({this.message});
  @override
  List<Object?> get props => [
    message,
  ];
}