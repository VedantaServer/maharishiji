import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:maharishiji/presentation/inputs_screen/models/inputs_model.dart';
part 'inputs_event.dart';
part 'inputs_state.dart';

class InputsBloc extends Bloc<InputsEvent, InputsState> {
  InputsBloc(InputsState initialState) : super(initialState) {
    on<InputsInitialEvent>(_onInitialize);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
  }

  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<InputsState> emit,
  ) {
    emit(state.copyWith(
      isCheckbox: event.value,
    ));
  }

  _onInitialize(
    InputsInitialEvent event,
    Emitter<InputsState> emit,
  ) async {
    emit(state.copyWith(
      checkboxfilledController: TextEditingController(),
      checkboxoptioneController: TextEditingController(),
      isCheckbox: false,
    ));
  }
}
