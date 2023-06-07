import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/contentblocks_item_model.dart';
import 'package:maharishiji/presentation/content_screen/models/content_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
part 'content_event.dart';
part 'content_state.dart';

class ContentBloc extends Bloc<ContentEvent, ContentState> with CodeAutoFill {
  ContentBloc(ContentState initialState) : super(initialState) {
    on<ContentInitialEvent>(_onInitialize);
    on<ChangeOTPEvent>(_changeOTP);
  }

  @override
  codeUpdated() {
    add(ChangeOTPEvent(code: code!));
  }

  _changeOTP(
    ChangeOTPEvent event,
    Emitter<ContentState> emit,
  ) {
    emit(state.copyWith(
      otpController: TextEditingController(text: event.code),
    ));
  }

  List<ContentblocksItemModel> fillContentblocksItemList() {
    return List.generate(2, (index) => ContentblocksItemModel());
  }

  _onInitialize(
    ContentInitialEvent event,
    Emitter<ContentState> emit,
  ) async {
    emit(state.copyWith(
      searchController: TextEditingController(),
      otpController: TextEditingController(),
    ));
    listenForCode();
    emit(state.copyWith(
        contentModelObj: state.contentModelObj?.copyWith(
      contentblocksItemList: fillContentblocksItemList(),
    )));
  }
}
