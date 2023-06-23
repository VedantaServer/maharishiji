import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:maharishiji/presentation/log_in_screen/models/log_in_model.dart';
part 'log_in_event.dart';
part 'log_in_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  LogInBloc(LogInState initialState) : super(initialState) {
    on<LogInInitialEvent>(_onInitialize);
  }
  _onInitialize(
    LogInInitialEvent event,
    Emitter<LogInState> emit,
  ) async {
    emit(state.copyWith(
      //default values only for testing. make sure to remove it before production
      //mahagroup1008@gmail.com
      //123456
      emailController: TextEditingController(text: 'mahagroup1008@gmail.com'),
      passwordController: TextEditingController(text: '123456'),
    ));
  }
}
