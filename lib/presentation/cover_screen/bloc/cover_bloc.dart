import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:maharishiji/presentation/cover_screen/models/cover_model.dart';
part 'cover_event.dart';
part 'cover_state.dart';

class CoverBloc extends Bloc<CoverEvent, CoverState> {
  CoverBloc(CoverState initialState) : super(initialState) {
    on<CoverInitialEvent>(_onInitialize);
  }

  _onInitialize(
    CoverInitialEvent event,
    Emitter<CoverState> emit,
  ) async {}
}
