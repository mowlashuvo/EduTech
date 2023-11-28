import 'dart:async';
import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/config/color_constants.dart';
import '../../../domain/repository/auth_repository.dart';
import '../../pages/reset_password/reset_password_screen.dart';

part 'verify_event.dart';
part 'verify_state.dart';

class VerifyBloc extends Bloc<VerifyEvent, VerifyState> {
  final AuthRepository userRepository;

  bool isFetching = false;

  VerifyBloc({required this.userRepository})
      : super(const UpdateVerifyState()) {
    on<UpdateVerifyEvent>(_onUpdateVerify);
    on<ConfirmVerifyEvent>(_onConfirmVerify);
  }

  void _onUpdateVerify(UpdateVerifyEvent event, Emitter<VerifyState> emit) {
    // String code = '${event.code}';
    if (state is UpdateVerifyState) {
      final state = this.state as UpdateVerifyState;
      emit(UpdateVerifyState(
        code: event.code ?? state.code,
      ));
    } else {
      emit(UpdateVerifyState(code: event.code));
    }
  }

  Future<void> _onConfirmVerify(
      ConfirmVerifyEvent event, Emitter<VerifyState> emit) async {
    emit(const ErrorVerifyState());
    await verifyUser(event).then((message) {
      if (message is String) {
        var body = jsonDecode(message);
        // Navigator.pushReplacementNamed(
        //     event.context, ResetPasswordScreen.routeName,
        //     arguments: '2550');
        if (body['status_code'] == '200') {
          Navigator.pushReplacementNamed(
              event.context, ResetPasswordScreen.routeName,
              arguments: body['user_id']);
        } else {
          ScaffoldMessenger.of(event.context).showSnackBar(
            SnackBar(
              backgroundColor: ColorConstants.errorSnackBar,
              content: Text(
                jsonDecode(message)['message'],
                style: const TextStyle(color: ColorConstants.errorSnackBarText),
              ),
              action: SnackBarAction(
                label: 'Try Again',
                textColor: ColorConstants.errorSnackBarText,
                onPressed: () {},
              ),
              duration: const Duration(seconds: 2),
            ),
          );
        }
      }
      add(UpdateVerifyEvent(
        code: event.code,
      ));
    });
  }

  Future<Object> verifyUser(ConfirmVerifyEvent event) async {
    // Object message = await userRepository.verifyUser(event.code, event.userId);
    return 'message';
  }
}
