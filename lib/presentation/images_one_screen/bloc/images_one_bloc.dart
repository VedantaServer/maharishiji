import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:maharishiji/presentation/images_one_screen/models/images_one_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
part 'images_one_event.dart';
part 'images_one_state.dart';

class ImagesOneBloc extends Bloc<ImagesOneEvent, ImagesOneState>
    with CodeAutoFill {
  ImagesOneBloc(ImagesOneState initialState) : super(initialState) {
    on<ImagesOneInitialEvent>(_onInitialize);
    on<ChangeOTPEvent>(_changeOTP);
  }

  @override
  codeUpdated() {
    add(ChangeOTPEvent(code: code!));
  }

  _changeOTP(
    ChangeOTPEvent event,
    Emitter<ImagesOneState> emit,
  ) {
    emit(state.copyWith(
      otpController: TextEditingController(text: event.code),
    ));
  }

  _onInitialize(
    ImagesOneInitialEvent event,
    Emitter<ImagesOneState> emit,
  ) async {
    emit(state.copyWith(
      otpController: TextEditingController(),
    ));
    listenForCode();
  }
}
