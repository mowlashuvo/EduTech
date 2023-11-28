part of 'forget_password_bloc.dart';

abstract class ForgetPasswordEvent extends Equatable {
  const ForgetPasswordEvent();
  @override
  List<Object?> get props => [];
}

class UpdateForgetPasswordEvent extends ForgetPasswordEvent {
  final String? phone;

  const UpdateForgetPasswordEvent({this.phone,});

  @override
  List<Object?> get props => [phone];

}

class ConfirmForgetPasswordEvent extends ForgetPasswordEvent {
  final String phone;
  final BuildContext context;

  const ConfirmForgetPasswordEvent({required this.phone, required this.context});

  @override
  List<Object?> get props => [phone, context];

}
