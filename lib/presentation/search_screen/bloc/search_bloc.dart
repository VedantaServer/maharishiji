import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:maharishiji/presentation/search_screen/models/search_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> with CodeAutoFill {
  SearchBloc(SearchState initialState) : super(initialState) {
    on<SearchInitialEvent>(_onInitialize);
    on<ChangeOTPEvent>(_changeOTP);
  }

  @override
  codeUpdated() {
    add(ChangeOTPEvent(code: code!));
  }

  _changeOTP(
    ChangeOTPEvent event,
    Emitter<SearchState> emit,
  ) {
    emit(state.copyWith(
      otpController: TextEditingController(text: event.code),
    ));
  }

  _onInitialize(
    SearchInitialEvent event,
    Emitter<SearchState> emit,
  ) async {
    emit(state.copyWith(
      searchController: TextEditingController(),
      searchoneController: TextEditingController(),
      searchtwoController: TextEditingController(),
      searchthreeController: TextEditingController(),
      searchfourController: TextEditingController(),
      searchfiveController: TextEditingController(),
      searchsixController: TextEditingController(),
      otpController: TextEditingController(),
    ));
    listenForCode();
  }
}
