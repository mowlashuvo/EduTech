
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'show_hide_password_event.dart';
part 'show_hide_password_state.dart';

class ShowHidePasswordBloc extends Bloc<ShowHidePasswordEvent, ShowHidePasswordState> {
  ShowHidePasswordBloc() : super(HidePasswordState()) {
    on<ShowPasswordEvent>(_onShowPassword);
    on<HidePasswordEvent>(_onHidePassword);
  }
  void _onShowPassword(ShowPasswordEvent event, Emitter<ShowHidePasswordState> emit){
    emit(ShowPasswordState());
  }
  void _onHidePassword(HidePasswordEvent event, Emitter<ShowHidePasswordState> emit){
    emit(HidePasswordState());
  }
}
