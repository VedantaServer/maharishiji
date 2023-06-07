import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/profileposts1_item_model.dart';
import 'package:maharishiji/presentation/profile_posts_one_screen/models/profile_posts_one_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
part 'profile_posts_one_event.dart';
part 'profile_posts_one_state.dart';

class ProfilePostsOneBloc
    extends Bloc<ProfilePostsOneEvent, ProfilePostsOneState> with CodeAutoFill {
  ProfilePostsOneBloc(ProfilePostsOneState initialState) : super(initialState) {
    on<ProfilePostsOneInitialEvent>(_onInitialize);
    on<ChangeOTPEvent>(_changeOTP);
  }

  @override
  codeUpdated() {
    add(ChangeOTPEvent(code: code!));
  }

  _changeOTP(
    ChangeOTPEvent event,
    Emitter<ProfilePostsOneState> emit,
  ) {
    emit(
        state.copyWith(otpController: TextEditingController(text: event.code)));
  }

  List<Profileposts1ItemModel> fillProfileposts1ItemList() {
    return List.generate(3, (index) => Profileposts1ItemModel());
  }

  _onInitialize(
    ProfilePostsOneInitialEvent event,
    Emitter<ProfilePostsOneState> emit,
  ) async {
    emit(state.copyWith(otpController: TextEditingController()));
    listenForCode();
    emit(state.copyWith(
        profilePostsOneModelObj: state.profilePostsOneModelObj
            ?.copyWith(profileposts1ItemList: fillProfileposts1ItemList())));
  }
}
