part of 'verify_bloc.dart';

abstract class VerifyEvent extends Equatable {
  const VerifyEvent();
  @override
  List<Object?> get props => [];
}

class UpdateVerifyEvent extends VerifyEvent {
  final String? code;

  const UpdateVerifyEvent({this.code});

  @override
  List<Object?> get props => [code];
}

class ConfirmVerifyEvent extends VerifyEvent {
  final String code;
  final String userId;
  final BuildContext context;

  const ConfirmVerifyEvent({required this.code, required this.context, required this.userId});

  @override
  List<Object?> get props => [code, context, userId];
}
