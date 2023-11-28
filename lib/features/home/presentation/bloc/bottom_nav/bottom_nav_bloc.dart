import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'bottom_nav_event.dart';
part 'bottom_nav_state.dart';

class BottomNavigationBarBloc extends Bloc<BottomNavigationBarEvent, BottomNavigationBarState> {
  BottomNavigationBarBloc() : super(BottomNavigationBarState.initial()){
   on<ChangeBottomNavigationBarEvent>(_changeTab);
  }
  void _changeTab(ChangeBottomNavigationBarEvent event, Emitter<BottomNavigationBarState> emit) {
    int index = event.index;
    emit(BottomNavigationBarState(tabIndex: index));
  }
}