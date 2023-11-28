part of 'show_hide_password_bloc.dart';

abstract class ShowHidePasswordEvent extends Equatable {

  @override
  List<Object?> get props => [];
}

class ShowPasswordEvent extends ShowHidePasswordEvent {}

class HidePasswordEvent extends ShowHidePasswordEvent {}
