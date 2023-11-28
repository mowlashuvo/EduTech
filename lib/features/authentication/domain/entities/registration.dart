import 'package:equatable/equatable.dart';

class RegistrationEntity extends Equatable {
  final String? name;
  final String? email;
  final String? mobile;
  final String? password;
  final String? confirmPassword;

  const RegistrationEntity({
    this.name,
    this.email,
    this.mobile,
    this.password,
    this.confirmPassword,
  });

  @override
  List<Object?> get props => [
    name,
    email,
    mobile,
    password,
    confirmPassword,
  ];


}
