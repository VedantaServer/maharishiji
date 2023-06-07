import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:maharishiji/presentation/images_screen/models/images_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
part 'images_event.dart';
part 'images_state.dart';

class ImagesBloc extends Bloc<ImagesEvent, ImagesState> with CodeAutoFill {
  ImagesBloc(ImagesState initialState) : super(initialState) {
    on<ImagesInitialEvent>(_onInitialize);
    on<ChangeOTPEvent>(_changeOTP);
  }

  @override
  codeUpdated() {
    add(ChangeOTPEvent(code: code!));
  }

  _changeOTP(
    ChangeOTPEvent event,
    Emitter<ImagesState> emit,
  ) {
    emit(
        state.copyWith(otpController: TextEditingController(text: event.code)));
  }

  _onInitialize(
    ImagesInitialEvent event,
    Emitter<ImagesState> emit,
  ) async {
    emit(state.copyWith(otpController: TextEditingController()));
    listenForCode();
    Future.delayed(const Duration(milliseconds: 3000), () {
      NavigatorService.popAndPushNamed(
        AppRoutes.logInScreen,
      );
    });
  }
}
