import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/feed_item_model.dart';
import 'package:maharishiji/presentation/feed_screen/models/feed_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:http/http.dart' as http;
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

  Future getAllFeeds() async {
    List<FeedItemModel> feedList;
    String userUrl = 'https://maharishiji.net/news-and-events/json/min/20/0/20';
    String username = "mahagroup1008@gmail.com";
    String password =  "123456";
    String basicAuth =
        'Basic ' + base64.encode(utf8.encode('$username:$password'));
    final response = await http.get(
      Uri.parse('https://maharishiji.net/news-and-events/json/min/20/1/2'),
      headers: <String, String>{'authorization': basicAuth}
    );
    print("body,"+response.body);
    if (response.statusCode == 200) {
      FeedItemModel feeds = FeedItemModel.fromJson(jsonDecode(response.body[0]));
      List<dynamic> parsedListJson = jsonDecode(response.body);
      List<FeedItemModel> itemsList
          = List<FeedItemModel>.from(parsedListJson.map<FeedItemModel>((dynamic i) => FeedItemModel.fromJson(i)));
      emit(state.copyWith(
          feedModelObj: state.feedModelObj?.copyWith(
            feedItemList: itemsList,
          )));
      print('Data Emitted'+ itemsList.toString());
    } else {
      throw Exception(response.reasonPhrase);
    }

  }

  List<FeedItemModel> fillFeedItemList() {
    return List.generate(3, (index) => FeedItemModel());
  }

  _onInitialize(

    FeedInitialEvent event,
    Emitter<FeedState> emit,
  ) async {

    //getAllFeeds();

    emit(state.copyWith(
      searchController: TextEditingController(),
      otpController: TextEditingController(),
    ));
    emit(state.copyWith(
        feedModelObj: state.feedModelObj?.copyWith(
          feedItemList: itemsList,
        )));
  }
}
