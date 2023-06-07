import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:maharishiji/presentation/market_one_screen/models/market_one_model.dart';
part 'market_one_event.dart';
part 'market_one_state.dart';

class MarketOneBloc extends Bloc<MarketOneEvent, MarketOneState> {
  MarketOneBloc(MarketOneState initialState) : super(initialState) {
    on<MarketOneInitialEvent>(_onInitialize);
  }

  _onInitialize(
    MarketOneInitialEvent event,
    Emitter<MarketOneState> emit,
  ) async {
    emit(state.copyWith(
      messageController: TextEditingController(),
    ));
  }
}
