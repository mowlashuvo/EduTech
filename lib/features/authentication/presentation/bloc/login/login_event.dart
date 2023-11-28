part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object?> get props => [];
}

class UpdateLoginEvent extends LoginEvent {
  final String? email;
  final String? password;
  final bool? isRememberMe;

  const UpdateLoginEvent({this.email, this.password, this.isRememberMe});

  @override
  List<Object?> get props => [email, password, isRememberMe];
}

class ConfirmLoginEvent extends LoginEvent {
  final String loginMethod;
  // final String password;
  // final bool isRememberMe;
  final BuildContext context;

  const ConfirmLoginEvent({required this.loginMethod, /*required this.password, required this.isRememberMe,*/ required this.context});

  @override
  List<Object?> get props => [loginMethod,/* password, isRememberMe,*/ context];
}
