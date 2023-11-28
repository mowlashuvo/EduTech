import 'dart:async';
import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/config/color_constants.dart';
import '../../../../../core/screen.dart';
import '../../../data/repository/auth_repository.dart';
import '../../../domain/usecases/auth_usecase.dart';

part 'forget_password_event.dart';

part 'forget_password_state.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  final AuthUseCase _useCase;

  ForgetPasswordBloc({required AuthUseCase useCase})
      : _useCase = useCase,
        super(const UpdateForgetPasswordState()) {
    on<UpdateForgetPasswordEvent>(_onUpdateForgetPassword);
    on<ConfirmForgetPasswordEvent>(_onConfirmForgetPassword);
  }

  void _onUpdateForgetPassword(
      UpdateForgetPasswordEvent event, Emitter<ForgetPasswordState> emit) {
    if (state is UpdateForgetPasswordState) {
      final state = this.state as UpdateForgetPasswordState;
      emit(UpdateForgetPasswordState(
        phone: event.phone ?? state.phone,
      ));
    } else {
      emit(UpdateForgetPasswordState(
        phone: event.phone,
      ));
    }
  }

  Future<void> _onConfirmForgetPassword(ConfirmForgetPasswordEvent event,
      Emitter<ForgetPasswordState> emit) async {
    emit(const ErrorForgetPasswordState());

    // await updateUser(event).then((message) {
    //   if (message is String) {
    //     var body = jsonDecode(message);
    //
    //     if (body['message'] == 'Verify Code Sent Successfully') {
    //       ScaffoldMessenger.of(event.context).showSnackBar(
    //         SnackBar(
    //           backgroundColor: ColorConstants.snackBar,
    //           content: Text(
    //             body['message'],
    //             style: const TextStyle(color: ColorConstants.snackBarText),
    //           ),
    //           duration: const Duration(seconds: 2),
    //         ),
    //       );
    //       Navigator.pushNamed(event.context, VerifyScreen.routeName,
    //           arguments: body['user_id']);
    //     } else {
    //       ScaffoldMessenger.of(event.context).showSnackBar(
    //         SnackBar(
    //           backgroundColor: ColorConstants.errorSnackBar,
    //           content: Text(
    //             body['message'],
    //             style: const TextStyle(color: ColorConstants.errorSnackBarText),
    //           ),
    //           action: SnackBarAction(
    //             label: 'Try Again',
    //             textColor: ColorConstants.errorSnackBarText,
    //             onPressed: () {},
    //           ),
    //           duration: const Duration(seconds: 2),
    //         ),
    //       );
    //     }
    //   }
    //   add(UpdateForgetPasswordEvent(
    //     phone: event.phone,
    //   ));
    // });
  }

  // Future<Object> updateUser(ConfirmForgetPasswordEvent event) async {
  //   Object message = await userRepository.updateUser(event.phone);
  //   return message;
  // }
}
