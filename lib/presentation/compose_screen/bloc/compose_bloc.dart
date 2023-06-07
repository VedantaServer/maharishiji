import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:maharishiji/presentation/compose_screen/models/compose_model.dart';
part 'compose_event.dart';
part 'compose_state.dart';

class ComposeBloc extends Bloc<ComposeEvent, ComposeState> {
  ComposeBloc(ComposeState initialState) : super(initialState) {
    on<ComposeInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ComposeInitialEvent event,
    Emitter<ComposeState> emit,
  ) async {}
}
