import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:maharishiji/presentation/rating_screen/models/rating_model.dart';
part 'rating_event.dart';
part 'rating_state.dart';

class RatingBloc extends Bloc<RatingEvent, RatingState> {
  RatingBloc(RatingState initialState) : super(initialState) {
    on<RatingInitialEvent>(_onInitialize);
  }

  _onInitialize(
    RatingInitialEvent event,
    Emitter<RatingState> emit,
  ) async {}
}
