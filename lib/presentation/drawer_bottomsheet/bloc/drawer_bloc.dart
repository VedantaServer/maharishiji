import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:maharishiji/presentation/drawer_bottomsheet/models/drawer_model.dart';
part 'drawer_event.dart';
part 'drawer_state.dart';

class DrawerBloc extends Bloc<DrawerEvent, DrawerState> {
  DrawerBloc(DrawerState initialState) : super(initialState) {
    on<DrawerInitialEvent>(_onInitialize);
  }

  _onInitialize(
    DrawerInitialEvent event,
    Emitter<DrawerState> emit,
  ) async {}
}
