part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object?> get props => [];
}

class UpdateRegistrationEvent extends RegistrationEvent {
  final String? name;
  final String? email;
  final String? mobile;
  final String? password;
  final String? confirmPassword;
  final bool? isAgree;

  const UpdateRegistrationEvent({
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

class ConfirmRegistrationEvent extends RegistrationEvent {
  final BuildContext context;

  const ConfirmRegistrationEvent({
    required this.context,
  });

  @override
  List<Object?> get props => [
        context,
      ];
}
