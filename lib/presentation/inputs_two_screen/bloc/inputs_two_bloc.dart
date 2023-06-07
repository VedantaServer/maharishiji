import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:maharishiji/presentation/inputs_two_screen/models/inputs_two_model.dart';
part 'inputs_two_event.dart';
part 'inputs_two_state.dart';

class InputsTwoBloc extends Bloc<InputsTwoEvent, InputsTwoState> {
  InputsTwoBloc(InputsTwoState initialState) : super(initialState) {
    on<InputsTwoInitialEvent>(_onInitialize);
  }

  _onInitialize(
    InputsTwoInitialEvent event,
    Emitter<InputsTwoState> emit,
  ) async {
    emit(state.copyWith(
      nameController: TextEditingController(),
      searchController: TextEditingController(),
      groupfortytwoController: TextEditingController(),
      radioselectedController: TextEditingController(),
    ));
  }
}
