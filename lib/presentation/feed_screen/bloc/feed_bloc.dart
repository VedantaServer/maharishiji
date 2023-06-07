import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/feed_item_model.dart';
import 'package:maharishiji/presentation/feed_screen/models/feed_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
part 'feed_event.dart';
part 'feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> with CodeAutoFill {
  FeedBloc(FeedState initialState) : super(initialState) {
    on<FeedInitialEvent>(_onInitialize);
    on<ChangeOTPEvent>(_changeOTP);
  }

  @override
  codeUpdated() {
    add(ChangeOTPEvent(code: code!));
  }

  _changeOTP(
    ChangeOTPEvent event,
    Emitter<FeedState> emit,
  ) {
    emit(state.copyWith(
      otpController: TextEditingController(text: event.code),
    ));
  }

  List<FeedItemModel> fillFeedItemList() {
    return List.generate(4, (index) => FeedItemModel());
  }

  _onInitialize(
    FeedInitialEvent event,
    Emitter<FeedState> emit,
  ) async {
    emit(state.copyWith(
      searchController: TextEditingController(),
      otpController: TextEditingController(),
    ));
    listenForCode();
    emit(state.copyWith(
        feedModelObj: state.feedModelObj?.copyWith(
      feedItemList: fillFeedItemList(),
    )));
  }
}
