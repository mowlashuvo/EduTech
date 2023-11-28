part of 'show_hide_confirm_password_bloc.dart';

abstract class ShowHideConfirmPasswordState extends Equatable {
  const ShowHideConfirmPasswordState();

  @override
  List<Object?> get props => [];
}

class ShowConfirmPasswordState extends ShowHideConfirmPasswordState {}

class HideConfirmPasswordState extends ShowHideConfirmPasswordState {}
