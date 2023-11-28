part of 'show_hide_confirm_password_bloc.dart';

abstract class ShowHideConfirmPasswordEvent extends Equatable {

  @override
  List<Object?> get props => [];
}

class ShowConfirmPasswordEvent extends ShowHideConfirmPasswordEvent {}

class HideConfirmPasswordEvent extends ShowHideConfirmPasswordEvent {}
