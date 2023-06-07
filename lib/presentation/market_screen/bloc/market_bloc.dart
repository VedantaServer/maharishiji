import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/listrectangleth_item_model.dart';
import '../models/list_item_model.dart';
import '../models/list_one_item_model.dart';
import 'package:maharishiji/presentation/market_screen/models/market_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
part 'market_event.dart';
part 'market_state.dart';

class MarketBloc extends Bloc<MarketEvent, MarketState> with CodeAutoFill {
  MarketBloc(MarketState initialState) : super(initialState) {
    on<MarketInitialEvent>(_onInitialize);
    on<ChangeOTPEvent>(_changeOTP);
  }

  @override
  codeUpdated() {
    add(ChangeOTPEvent(code: code!));
  }

  _changeOTP(
    ChangeOTPEvent event,
    Emitter<MarketState> emit,
  ) {
    emit(state.copyWith(
      otpController: TextEditingController(text: event.code),
    ));
  }

  List<ListrectanglethItemModel> fillListrectanglethItemList() {
    return List.generate(4, (index) => ListrectanglethItemModel());
  }

  List<ListItemModel> fillListItemList() {
    return List.generate(4, (index) => ListItemModel());
  }

  List<ListOneItemModel> fillListOneItemList() {
    return List.generate(3, (index) => ListOneItemModel());
  }

  _onInitialize(
    MarketInitialEvent event,
    Emitter<MarketState> emit,
  ) async {
    emit(state.copyWith(
      searchController: TextEditingController(),
      otpController: TextEditingController(),
    ));
    listenForCode();
    emit(state.copyWith(
        marketModelObj: state.marketModelObj?.copyWith(
      listrectanglethItemList: fillListrectanglethItemList(),
      listItemList: fillListItemList(),
      listOneItemList: fillListOneItemList(),
    )));
  }
}
