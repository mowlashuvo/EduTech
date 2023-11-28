part of 'otp_bloc.dart';

abstract class OtpEvent extends Equatable {
  const OtpEvent();

  @override
  List<Object?> get props => [];
}

class UpdateOtpEvent extends OtpEvent {
  final String? email;
  final String? code;
  final bool? isVerified;

  const UpdateOtpEvent({this.email, this.code, this.isVerified,});

  @override
  List<Object?> get props => [email, code, isVerified];
}

class ConfirmOtpEvent extends OtpEvent {
  final BuildContext context;

  const ConfirmOtpEvent(this.context);

  @override
  List<Object?> get props => [context];
}
