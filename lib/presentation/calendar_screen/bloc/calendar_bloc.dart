import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/listtwentynine_item_model.dart';
import '../models/listicon1_item_model.dart';
import 'package:maharishiji/presentation/calendar_screen/models/calendar_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState>
    with CodeAutoFill {
  CalendarBloc(CalendarState initialState) : super(initialState) {
    on<CalendarInitialEvent>(_onInitialize);
    on<ChangeOTPEvent>(_changeOTP);
  }

  @override
  codeUpdated() {
    add(ChangeOTPEvent(code: code!));
  }

  _changeOTP(
    ChangeOTPEvent event,
    Emitter<CalendarState> emit,
  ) {
    emit(state.copyWith(
      otpController: TextEditingController(text: event.code),
    ));
  }

  List<ListtwentynineItemModel> fillListtwentynineItemList() {
    return List.generate(5, (index) => ListtwentynineItemModel());
  }

  List<Listicon1ItemModel> fillListicon1ItemList() {
    return List.generate(4, (index) => Listicon1ItemModel());
  }

  _onInitialize(
    CalendarInitialEvent event,
    Emitter<CalendarState> emit,
  ) async {
    emit(state.copyWith(
      otpController: TextEditingController(),
    ));
    listenForCode();
    emit(state.copyWith(
        calendarModelObj: state.calendarModelObj?.copyWith(
      listtwentynineItemList: fillListtwentynineItemList(),
      listicon1ItemList: fillListicon1ItemList(),
    )));
  }
}
