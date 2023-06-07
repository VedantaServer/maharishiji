import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:maharishiji/presentation/radios_screen/models/radios_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
part 'radios_event.dart';
part 'radios_state.dart';

class RadiosBloc extends Bloc<RadiosEvent, RadiosState> with CodeAutoFill {
  RadiosBloc(RadiosState initialState) : super(initialState) {
    on<RadiosInitialEvent>(_onInitialize);
    on<ChangeOTPEvent>(_changeOTP);
  }

  @override
  codeUpdated() {
    add(ChangeOTPEvent(code: code!));
  }

  _changeOTP(
    ChangeOTPEvent event,
    Emitter<RadiosState> emit,
  ) {
    emit(state.copyWith(
      otpController: TextEditingController(text: event.code),
    ));
  }

  _onInitialize(
    RadiosInitialEvent event,
    Emitter<RadiosState> emit,
  ) async {
    emit(state.copyWith(
      radioselectedController: TextEditingController(),
      grouptwentyseveController: TextEditingController(),
      radioselectedController1: TextEditingController(),
      groupthirtyoneController: TextEditingController(),
      groupthirtythreController: TextEditingController(),
      radioselectedController2: TextEditingController(),
      otpController: TextEditingController(),
    ));
    listenForCode();
  }
}
