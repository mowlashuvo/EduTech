part of 'show_hide_password_bloc.dart';

abstract class ShowHidePasswordState extends Equatable {
  const ShowHidePasswordState();

  @override
  List<Object?> get props => [];
}

class ShowPasswordState extends ShowHidePasswordState {}

class HidePasswordState extends ShowHidePasswordState {}
