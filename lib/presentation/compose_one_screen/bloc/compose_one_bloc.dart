import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:maharishiji/presentation/compose_one_screen/models/compose_one_model.dart';
part 'compose_one_event.dart';
part 'compose_one_state.dart';

class ComposeOneBloc extends Bloc<ComposeOneEvent, ComposeOneState> {
  ComposeOneBloc(ComposeOneState initialState) : super(initialState) {
    on<ComposeOneInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ComposeOneInitialEvent event,
    Emitter<ComposeOneState> emit,
  ) async {}
}
