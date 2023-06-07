import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/scrollcontainer_item_model.dart';
import 'package:maharishiji/presentation/profile_posts_two_screen/models/profile_posts_two_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
part 'profile_posts_two_event.dart';
part 'profile_posts_two_state.dart';

class ProfilePostsTwoBloc
    extends Bloc<ProfilePostsTwoEvent, ProfilePostsTwoState> with CodeAutoFill {
  ProfilePostsTwoBloc(ProfilePostsTwoState initialState) : super(initialState) {
    on<ProfilePostsTwoInitialEvent>(_onInitialize);
    on<ChangeOTPEvent>(_changeOTP);
  }

  @override
  codeUpdated() {
    add(ChangeOTPEvent(code: code!));
  }

  _changeOTP(
    ChangeOTPEvent event,
    Emitter<ProfilePostsTwoState> emit,
  ) {
    emit(
        state.copyWith(otpController: TextEditingController(text: event.code)));
  }

  List<ScrollcontainerItemModel> fillScrollcontainerItemList() {
    return List.generate(2, (index) => ScrollcontainerItemModel());
  }

  _onInitialize(
    ProfilePostsTwoInitialEvent event,
    Emitter<ProfilePostsTwoState> emit,
  ) async {
    emit(state.copyWith(otpController: TextEditingController()));
    listenForCode();
    emit(state.copyWith(
        profilePostsTwoModelObj: state.profilePostsTwoModelObj?.copyWith(
            scrollcontainerItemList: fillScrollcontainerItemList())));
  }
}
