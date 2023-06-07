import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:maharishiji/presentation/congratulations_screen/models/congratulations_model.dart';
part 'congratulations_event.dart';
part 'congratulations_state.dart';

class CongratulationsBloc
    extends Bloc<CongratulationsEvent, CongratulationsState> {
  CongratulationsBloc(CongratulationsState initialState) : super(initialState) {
    on<CongratulationsInitialEvent>(_onInitialize);
  }

  _onInitialize(
    CongratulationsInitialEvent event,
    Emitter<CongratulationsState> emit,
  ) async {}
}
