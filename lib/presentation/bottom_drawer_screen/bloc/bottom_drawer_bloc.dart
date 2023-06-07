import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:maharishiji/presentation/bottom_drawer_screen/models/bottom_drawer_model.dart';
part 'bottom_drawer_event.dart';
part 'bottom_drawer_state.dart';

class BottomDrawerBloc extends Bloc<BottomDrawerEvent, BottomDrawerState> {
  BottomDrawerBloc(BottomDrawerState initialState) : super(initialState) {
    on<BottomDrawerInitialEvent>(_onInitialize);
  }

  _onInitialize(
    BottomDrawerInitialEvent event,
    Emitter<BottomDrawerState> emit,
  ) async {}
}
