import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:maharishiji/presentation/ios_navigation_screen/models/ios_navigation_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
part 'ios_navigation_event.dart';
part 'ios_navigation_state.dart';

class IosNavigationBloc extends Bloc<IosNavigationEvent, IosNavigationState>
    with CodeAutoFill {
  IosNavigationBloc(IosNavigationState initialState) : super(initialState) {
    on<IosNavigationInitialEvent>(_onInitialize);
    on<ChangeOTPEvent>(_changeOTP);
  }

  @override
  codeUpdated() {
    add(ChangeOTPEvent(code: code!));
  }

  _changeOTP(
    ChangeOTPEvent event,
    Emitter<IosNavigationState> emit,
  ) {
    emit(state.copyWith(
      otpController: TextEditingController(text: event.code),
    ));
  }

  _onInitialize(
    IosNavigationInitialEvent event,
    Emitter<IosNavigationState> emit,
  ) async {
    emit(state.copyWith(
      otpController: TextEditingController(),
    ));
    listenForCode();
  }
}
