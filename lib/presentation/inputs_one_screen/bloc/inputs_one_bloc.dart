import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:maharishiji/presentation/inputs_one_screen/models/inputs_one_model.dart';
part 'inputs_one_event.dart';
part 'inputs_one_state.dart';

class InputsOneBloc extends Bloc<InputsOneEvent, InputsOneState> {
  InputsOneBloc(InputsOneState initialState) : super(initialState) {
    on<InputsOneInitialEvent>(_onInitialize);
  }

  _onInitialize(
    InputsOneInitialEvent event,
    Emitter<InputsOneState> emit,
  ) async {}
}
