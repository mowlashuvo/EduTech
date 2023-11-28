
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'show_hide_confirm_password_event.dart';
part 'show_hide_confirm_password_state.dart';

class ShowHideConfirmPasswordBloc extends Bloc<ShowHideConfirmPasswordEvent, ShowHideConfirmPasswordState> {
  ShowHideConfirmPasswordBloc() : super(HideConfirmPasswordState()) {
    on<ShowConfirmPasswordEvent>(_onShowConfirmPassword);
    on<HideConfirmPasswordEvent>(_onHideConfirmPassword);
  }
  void _onShowConfirmPassword(ShowConfirmPasswordEvent event, Emitter<ShowHideConfirmPasswordState> emit){
    emit(ShowConfirmPasswordState());
  }
  void _onHideConfirmPassword(HideConfirmPasswordEvent event, Emitter<ShowHideConfirmPasswordState> emit){
    emit(HideConfirmPasswordState());
  }
}
