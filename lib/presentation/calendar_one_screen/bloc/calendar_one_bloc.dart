import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/listrectangleth1_item_model.dart';
import '../models/list1_item_model.dart';
import 'package:maharishiji/presentation/calendar_one_screen/models/calendar_one_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
part 'calendar_one_event.dart';
part 'calendar_one_state.dart';

class CalendarOneBloc extends Bloc<CalendarOneEvent, CalendarOneState>
    with CodeAutoFill {
  CalendarOneBloc(CalendarOneState initialState) : super(initialState) {
    on<CalendarOneInitialEvent>(_onInitialize);
    on<ChangeOTPEvent>(_changeOTP);
  }

  @override
  codeUpdated() {
    add(ChangeOTPEvent(code: code!));
  }

  _changeOTP(
    ChangeOTPEvent event,
    Emitter<CalendarOneState> emit,
  ) {
    emit(state.copyWith(
      otpController: TextEditingController(text: event.code),
    ));
  }

  List<Listrectangleth1ItemModel> fillListrectangleth1ItemList() {
    return List.generate(4, (index) => Listrectangleth1ItemModel());
  }

  List<List1ItemModel> fillList1ItemList() {
    return List.generate(4, (index) => List1ItemModel());
  }

  _onInitialize(
    CalendarOneInitialEvent event,
    Emitter<CalendarOneState> emit,
  ) async {
    emit(state.copyWith(
      otpController: TextEditingController(),
    ));
    listenForCode();
    emit(state.copyWith(
        calendarOneModelObj: state.calendarOneModelObj?.copyWith(
      listrectangleth1ItemList: fillListrectangleth1ItemList(),
      list1ItemList: fillList1ItemList(),
    )));
  }
}
