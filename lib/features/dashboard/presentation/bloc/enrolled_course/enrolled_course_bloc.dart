import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/enrolled_course_entity.dart';
import '../../../domain/usecases/enrolled_course_use_case.dart';

part 'enrolled_course_event.dart';

part 'enrolled_course_state.dart';

class EnrolledCourseBloc
    extends Bloc<EnrolledCourseEvent, EnrolledCourseState> {
  final EnrolledCourseUseCase _useCase;

  EnrolledCourseBloc({
    required EnrolledCourseUseCase useCase,
  })  : _useCase = useCase,
        super(const EnrolledCourseInitialState()) {
    on<EnrolledCourseLoadEvent>(_onLoadEnrolledCourse);
    on<AddEnrolledCourseLoadEvent>(_onLoadAddEnrolledCourse);
    on<DeleteEnrolledCourseLoadEvent>(_onLoadDeleteEnrolledCourse);
  }

  Future<void> _onLoadEnrolledCourse(
    EnrolledCourseLoadEvent event,
    Emitter<EnrolledCourseState> emit,
  ) async {
    emit(const EnrolledCourseLoadingState(message: 'Loading Enrolled Course'));
    final result = await _useCase.execute();
    result.fold((failure) {
      emit(EnrolledCourseErrorState(error: failure.message));
    }, (data) {
      emit(EnrolledCourseSuccessState(courses: data.data!));
    });
  }

  Future<void> _onLoadAddEnrolledCourse(
      AddEnrolledCourseLoadEvent event,
    Emitter<EnrolledCourseState> emit,
  ) async {
    emit(const EnrolledCourseLoadingState(message: 'Loading Enrolled Course'));
    final result = await _useCase.post(id: event.id);
    result.fold((failure) {
      emit(EnrolledCourseErrorState(error: failure.message));
    }, (data) {
      emit(EnrolledCourseSuccessState(courses: data.data!));
    });
  }

  Future<void> _onLoadDeleteEnrolledCourse(
      DeleteEnrolledCourseLoadEvent event,
    Emitter<EnrolledCourseState> emit,
  ) async {
    emit(const EnrolledCourseLoadingState(message: 'Loading Enrolled Course'));
    final result = await _useCase.delete(id: event.id);
    result.fold((failure) {
      emit(EnrolledCourseErrorState(error: failure.message));
    }, (data) {
      emit(EnrolledCourseSuccessState(courses: data.data!));
    });
  }
}
