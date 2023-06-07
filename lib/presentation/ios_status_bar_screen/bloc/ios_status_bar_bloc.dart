import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:maharishiji/presentation/ios_status_bar_screen/models/ios_status_bar_model.dart';
part 'ios_status_bar_event.dart';
part 'ios_status_bar_state.dart';

class IosStatusBarBloc extends Bloc<IosStatusBarEvent, IosStatusBarState> {
  IosStatusBarBloc(IosStatusBarState initialState) : super(initialState) {
    on<IosStatusBarInitialEvent>(_onInitialize);
  }

  _onInitialize(
    IosStatusBarInitialEvent event,
    Emitter<IosStatusBarState> emit,
  ) async {}
}
