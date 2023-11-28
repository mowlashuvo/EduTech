import 'dart:async';
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../../core/config/color_constants.dart';
import '../../../../../core/config/constant.dart';
import '../../../../../core/config/show_message.dart';
import '../../../../home/presentation/pages/home_screen.dart';
import '../../../domain/entities/registration.dart';
import '../../../domain/repository/auth_repository.dart';
import '../../../domain/usecases/auth_usecase.dart';
import '../../pages/verify/verify_screen.dart';

part 'registration_event.dart';

part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final AuthUseCase _useCase;

  bool isFetching = false;

  RegistrationBloc({required AuthUseCase useCase})
      : _useCase = useCase,
        super(const UpdateRegistrationState()) {
    on<UpdateRegistrationEvent>(_onUpdateRegistration);
    on<ConfirmRegistrationEvent>(_onConfirmRegistration);
  }

  void _onUpdateRegistration(
      UpdateRegistrationEvent event, Emitter<RegistrationState> emit) {
    if (state is UpdateRegistrationState) {
      final state = this.state as UpdateRegistrationState;

      String? name = event.name ?? state.name;
      String? email = event.email ?? state.email;
      String? mobile = event.mobile ?? state.mobile;
      String? password = event.password ?? state.password;
      String? confirmPassword = event.confirmPassword ?? state.confirmPassword;
      emit(UpdateRegistrationState(
        name: name,
        email: email,
        mobile: mobile,
        password: password,
        confirmPassword: confirmPassword,
        isAgree: event.isAgree ?? state.isAgree,
      ));
    } else {
      emit(UpdateRegistrationState(
        name: event.name,
        email: event.email,
        mobile: event.mobile,
        password: event.password,
        confirmPassword: event.confirmPassword,
        isAgree: event.isAgree,
      ));
    }
  }

  Future<void> _onConfirmRegistration(
      ConfirmRegistrationEvent event, Emitter<RegistrationState> emit) async {
    if (state is UpdateRegistrationState) {
      var states = state as UpdateRegistrationState;
      RegistrationEntity registration = RegistrationEntity(
        name: states.name ?? '',
        email: states.email ?? '',
        mobile: states.mobile ?? '',
        password: states.password ?? '',
        confirmPassword: states.confirmPassword ?? '',
      );
      if (validateFirstName(registration.name??'') && validateEmail(registration.email ?? '') &&
          validatePassword(registration.password ?? '') && validateConfirmPassword(registration.confirmPassword??'', registration.password??'')) {
        emit(const ErrorRegistrationState(message: 'Signup...'));
        final result = await _useCase.registration(registration: registration);
        result.fold((failure) {
          emit(ErrorRegistrationState(message: failure.message));
        }, (data) {
          emit(SuccessRegistrationState(message: data.message));
          var box = GetStorage();
          if (true) {
            box.write(Constant.apiToken, data.data!.token ?? '');
          }
          box.write(Constant.userId, data.data!.user!.id.toString() ?? '');
          box.write(Constant.role, data.data!.user!.roleId.toString() ?? '');
          Navigator.pushReplacementNamed(event.context, HomeScreen.routeName);

          ShowMessage.successToast(
              message: data.message??'Success');
          emit(SuccessRegistrationState(message: data.message));
        });
      } else if (!validateFirstName(registration.name ?? '')) {
        ShowMessage.errorToast(
            message: 'Please, Provide valid name and try again');
      } else if (!validateEmail(registration.email ?? '')) {
        ShowMessage.errorToast(
            message: 'Please, Provide valid email and try again');
      } else if (!validateConfirmPassword(registration.confirmPassword??'', registration.password??'')) {
        ShowMessage.errorToast(
            message: 'Password does not match!');
      } else if (!validatePassword(registration.password ?? '')) {
        ShowMessage.errorToast(
            message: 'Please, Provide valid password and try again');
      }
    }
  }

  bool validateFirstName(String firstName) {
    // Check if the first name is not empty
    return firstName.isNotEmpty;
  }

  bool validateConfirmPassword(String confirmPassword, String password) {
    // Check if the first name is not empty
    return confirmPassword==password;
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
