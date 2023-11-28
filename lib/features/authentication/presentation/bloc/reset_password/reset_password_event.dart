part of 'reset_password_bloc.dart';

abstract class ResetPasswordEvent extends Equatable {
  const ResetPasswordEvent();
  @override
  List<Object?> get props => [];
}

class UpdateResetPasswordEvent extends ResetPasswordEvent {

  final String? password;
  final String? confirmPassword;

  const UpdateResetPasswordEvent({this.password, this.confirmPassword});

  @override
  List<Object?> get props => [password, confirmPassword];
}

class ConfirmResetPasswordEvent extends ResetPasswordEvent {

  final String password;
  final String confirmPassword;
  final String userId;
  final BuildContext context;

  const ConfirmResetPasswordEvent({required this.password, required this.confirmPassword, required this.userId, required this.context});

  @override
  List<Object?> get props => [password, confirmPassword, userId, context];
}
