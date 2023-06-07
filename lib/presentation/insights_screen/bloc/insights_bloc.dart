import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/insights_item_model.dart';
import 'package:maharishiji/presentation/insights_screen/models/insights_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
part 'insights_event.dart';
part 'insights_state.dart';

class InsightsBloc extends Bloc<InsightsEvent, InsightsState>
    with CodeAutoFill {
  InsightsBloc(InsightsState initialState) : super(initialState) {
    on<InsightsInitialEvent>(_onInitialize);
    on<ChangeOTPEvent>(_changeOTP);
  }

  @override
  codeUpdated() {
    add(ChangeOTPEvent(code: code!));
  }

  _changeOTP(
    ChangeOTPEvent event,
    Emitter<InsightsState> emit,
  ) {
    emit(state.copyWith(
      otpController: TextEditingController(text: event.code),
    ));
  }

  List<InsightsItemModel> fillInsightsItemList() {
    return List.generate(6, (index) => InsightsItemModel());
  }

  _onInitialize(
    InsightsInitialEvent event,
    Emitter<InsightsState> emit,
  ) async {
    emit(state.copyWith(
      otpController: TextEditingController(),
    ));
    listenForCode();
    emit(state.copyWith(
        insightsModelObj: state.insightsModelObj?.copyWith(
      insightsItemList: fillInsightsItemList(),
    )));
  }
}
