import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:maharishiji/presentation/profile_photos_screen/models/profile_photos_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
part 'profile_photos_event.dart';
part 'profile_photos_state.dart';

class ProfilePhotosBloc extends Bloc<ProfilePhotosEvent, ProfilePhotosState>
    with CodeAutoFill {
  ProfilePhotosBloc(ProfilePhotosState initialState) : super(initialState) {
    on<ProfilePhotosInitialEvent>(_onInitialize);
    on<ChangeOTPEvent>(_changeOTP);
  }

  @override
  codeUpdated() {
    add(ChangeOTPEvent(code: code!));
  }

  _changeOTP(
    ChangeOTPEvent event,
    Emitter<ProfilePhotosState> emit,
  ) {
    emit(state.copyWith(
      otpController: TextEditingController(text: event.code),
    ));
  }

  _onInitialize(
    ProfilePhotosInitialEvent event,
    Emitter<ProfilePhotosState> emit,
  ) async {
    emit(state.copyWith(
      otpController: TextEditingController(),
    ));
    listenForCode();
  }
}
