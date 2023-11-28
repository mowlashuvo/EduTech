import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../../core/config/constant.dart';
import '../../../../../core/config/show_message.dart';
import '../../../../home/presentation/pages/home_screen.dart';
import '../../../data/data_sources/google_signin.dart';
import '../../../domain/usecases/auth_usecase.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthUseCase _useCase;
  bool isFetching = false;

  LoginBloc({required AuthUseCase useCase})
      : _useCase = useCase,
        super(const UpdateLoginState()) {
    on<UpdateLoginEvent>(_onUpdateLogin);
    on<ConfirmLoginEvent>(_onConfirmLogin);
  }

  void _onUpdateLogin(UpdateLoginEvent event, Emitter<LoginState> emit) {
    if (state is UpdateLoginState) {
      final state = this.state as UpdateLoginState;
      emit(UpdateLoginState(
        email: event.email ?? state.email,
        password: event.password ?? state.password,
        isRememberMe: event.isRememberMe ?? state.isRememberMe,
      ));
    } else {
      emit(UpdateLoginState(
        email: event.email,
        password: event.password,
        isRememberMe: event.isRememberMe,
      ));
    }
  }

  Future<void> _onConfirmLogin(
      ConfirmLoginEvent event, Emitter<LoginState> emit) async {
    if (event.loginMethod == 'google') {
      final user = await GoogleSignInApi.login();
      if (user != null) {
        emit(const ErrorLoginState(message: 'Login....'));
        final result = await _useCase.googleUser(
            email: user.email, name: user.displayName ?? 'User Name');
        result.fold((failure) {
          emit(ErrorLoginState(message: failure.message));
        }, (data) {
          var box = GetStorage();
          if (true) {
            // RememberMe
            box.write(Constant.apiToken, data.data!.token ?? '');
          }
          box.write(Constant.userId, data.data!.user!.id.toString() ?? '');
          box.write(Constant.role, data.data!.user!.roleId.toString() ?? '');
          Navigator.pushReplacementNamed(event.context, HomeScreen.routeName);
          emit(SuccessLoginState(message: data.message));
        });
      } else {
        ShowMessage.errorToast(
            message: 'Something went wrong, Please try again');
      }
    } else {
      if (state is UpdateLoginState) {
        var states = state as UpdateLoginState;
        String email = states.email ?? '';
        String password = states.password ?? '';
        bool isRememberMe = states.isRememberMe ?? true;

        if (validateEmail(email) && validatePassword(password)) {
          emit(const ErrorLoginState(message: 'Login....'));
          final result = await _useCase.login(email: email, password: password);
          result.fold((failure) {
            emit(ErrorLoginState(message: failure.message));
          }, (data) {
            var box = GetStorage();
            if (isRememberMe) {
              box.write(Constant.apiToken, data.data!.token ?? '');
            }
            box.write(Constant.userId, data.data!.user!.id.toString() ?? '');
            box.write(Constant.role, data.data!.user!.roleId.toString() ?? '');
            Navigator.pushReplacementNamed(event.context, HomeScreen.routeName);

            ShowMessage.successToast(
                message: data.message??'Success');
            emit(SuccessLoginState(message: data.message));
          });
        } else if (!validateEmail(email)) {
          ShowMessage.errorToast(
              message: 'Please, Provide valid email and try again');
        } else if (!validatePassword(password)) {
          ShowMessage.errorToast(
              message: 'Please, Provide valid password and try again');
        }
      }
    }
  }

  bool validatePassword(String password) {
    // Check if the password meets the following criteria:
    // - At least 8 characters long
    // - Contains at least one uppercase letter
    // - Contains at least one lowercase letter
    // - Contains at least one digit
    // - Contains at least one special character

    final RegExp passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]{8,}$',
    );

    return passwordRegex.hasMatch(password);
  }

  bool validateEmail(String email) {
    // Define a regular expression for a valid email address
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    // Check if the provided email matches the regular expression
    return emailRegex.hasMatch(email);
  }
}
