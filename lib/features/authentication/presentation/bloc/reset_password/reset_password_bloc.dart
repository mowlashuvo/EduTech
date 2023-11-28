import 'dart:async';
import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/config/color_constants.dart';
import '../../../domain/usecases/auth_usecase.dart';
import '../../pages/login/login_screen.dart';

part 'reset_password_event.dart';

part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final AuthUseCase _useCase;

  bool isFetching = false;

  ResetPasswordBloc({required AuthUseCase useCase})
      : _useCase = useCase,
        super(const UpdateResetPasswordState()) {
    on<UpdateResetPasswordEvent>(_onUpdateResetPassword);
    on<ConfirmResetPasswordEvent>(_onConfirmResetPassword);
  }

  void _onUpdateResetPassword(
      UpdateResetPasswordEvent event, Emitter<ResetPasswordState> emit) {
    if (state is UpdateResetPasswordState) {
      final state = this.state as UpdateResetPasswordState;
      emit(UpdateResetPasswordState(
        password: event.password ?? state.password,
        confirmPassword: event.confirmPassword ?? state.confirmPassword,
      ));
    } else {
      emit(UpdateResetPasswordState(
        password: event.password,
        confirmPassword: event.confirmPassword,
      ));
    }
  }

  Future<void> _onConfirmResetPassword(
      ConfirmResetPasswordEvent event, Emitter<ResetPasswordState> emit) async {
    emit(const ErrorResetPasswordState());
    await resetPassword(event).then((message) {
      if (message is String) {
        var body = jsonDecode(message);

        if (body['status_code'] == '200') {
          Navigator.pushReplacementNamed(event.context, LoginScreen.routeName);
        } else {
          ScaffoldMessenger.of(event.context).showSnackBar(
            SnackBar(
              backgroundColor: ColorConstants.snackBar,
              content: Text(
                body['message'],
                style: const TextStyle(color: ColorConstants.snackBarText),
              ),
              action: SnackBarAction(
                label: 'Try Again',
                textColor: ColorConstants.snackBarText,
                onPressed: () {},
              ),
              duration: const Duration(seconds: 2),
            ),
          );
        }
      }
      add(UpdateResetPasswordEvent(
        password: event.password,
        confirmPassword: event.confirmPassword,
      ));
    });
  }

  Future<Object> resetPassword(ConfirmResetPasswordEvent event) async {
    // Object message = await userRepository.resetPassword(
    //     event.password, event.confirmPassword, event.userId);
    return 'message';
  }
}
