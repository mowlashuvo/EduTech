part of 'verify_bloc.dart';

abstract class VerifyState extends Equatable {
  const VerifyState();
  @override
  List<Object?> get props => [];
}

class VerifyInitial extends VerifyState {}

class UpdateVerifyState extends VerifyState {
  final String? code;

  const UpdateVerifyState({this.code});

  @override
  List<Object?> get props => [code];

}

class SuccessVerifyState extends VerifyState {
  final String? message;

  const SuccessVerifyState({this.message});

  @override
  List<Object?> get props => [
    message,
  ];
}

class ErrorVerifyState extends VerifyState {
  final String? message;

  const ErrorVerifyState({this.message});
  @override
  List<Object?> get props => [
    message,
  ];
}