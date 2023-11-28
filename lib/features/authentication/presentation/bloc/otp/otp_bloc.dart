import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/config/color_constants.dart';
import '../../../domain/usecases/auth_usecase.dart';

part 'otp_event.dart';

part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final AuthUseCase _useCase;

  bool isFetching = false;

  OtpBloc({required AuthUseCase useCase})
      : _useCase = useCase,
        super(const UpdateOtpState()) {
    on<UpdateOtpEvent>(_onUpdateOtp);
    on<ConfirmOtpEvent>(_onConfirmOtp);
  }

  void _onUpdateOtp(UpdateOtpEvent event, Emitter<OtpState> emit) {
    if (state is UpdateOtpState) {
      final state = this.state as UpdateOtpState;
      emit(UpdateOtpState(
        email: event.email ?? state.email,
        code: event.code ?? state.code,
        isVerified: event.isVerified ?? state.isVerified,
      ));
    } else {
      emit(UpdateOtpState(
        email: event.email,
        code: event.code,
        isVerified: event.isVerified,
      ));
    }
  }

  Future<void> _onConfirmOtp(
      ConfirmOtpEvent event, Emitter<OtpState> emit) async {
    // Navigator.pushNamed(event.context, DashboardScreen.routeName);

    if (state is UpdateOtpState) {
      isFetching = true;
      var states = state as UpdateOtpState;
      String otp = states.code ?? '';
      String email = states.email ?? '';

      if (otp == '') {
        ScaffoldMessenger.of(event.context).showSnackBar(
          const SnackBar(
            backgroundColor: ColorConstants.errorSnackBar,
            content: Text(
              'Please, input your otp',
              style: TextStyle(color: ColorConstants.errorSnackBarText),
            ),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        if (otp.length == 6) {
          emit(const ErrorOtpState());
          // userRepository.verifyOtp(email, otp).then((value) {
          //   add(UpdateOtpEvent(email: email, code: otp, isVerified: value));
          //   isFetching = false;
          //   if (value == true) {
          //     // event.context
          //     //     .read<BottomNavigationBarBloc>()
          //     //     .add(const ChangeBottomNavigationBarEvent(index: 1));
          //     Navigator.popAndPushNamed(event.context, HomeScreen.routeName);
          //   }
          // });
        } else {
          ScaffoldMessenger.of(event.context).showSnackBar(
            const SnackBar(
              backgroundColor: ColorConstants.errorSnackBar,
              content: Text(
                'Otp must be 6 digits',
                style: TextStyle(color: ColorConstants.errorSnackBarText),
              ),
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
    }
  }
}
