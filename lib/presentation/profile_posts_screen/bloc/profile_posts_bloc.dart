import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/profileposts_item_model.dart';
import 'package:maharishiji/presentation/profile_posts_screen/models/profile_posts_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
part 'profile_posts_event.dart';
part 'profile_posts_state.dart';

class ProfilePostsBloc extends Bloc<ProfilePostsEvent, ProfilePostsState>
    with CodeAutoFill {
  ProfilePostsBloc(ProfilePostsState initialState) : super(initialState) {
    on<ProfilePostsInitialEvent>(_onInitialize);
    on<ChangeOTPEvent>(_changeOTP);
  }

  @override
  codeUpdated() {
    add(ChangeOTPEvent(code: code!));
  }

  _changeOTP(
    ChangeOTPEvent event,
    Emitter<ProfilePostsState> emit,
  ) {
    emit(state.copyWith(
      otpController: TextEditingController(text: event.code),
    ));
  }

  List<ProfilepostsItemModel> fillProfilepostsItemList() {
    return List.generate(3, (index) => ProfilepostsItemModel());
  }

  _onInitialize(
    ProfilePostsInitialEvent event,
    Emitter<ProfilePostsState> emit,
  ) async {
    emit(state.copyWith(
      otpController: TextEditingController(),
    ));
    listenForCode();
    emit(state.copyWith(
        profilePostsModelObj: state.profilePostsModelObj?.copyWith(
      profilepostsItemList: fillProfilepostsItemList(),
    )));
  }
}
