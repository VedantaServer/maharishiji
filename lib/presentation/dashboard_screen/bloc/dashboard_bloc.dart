import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/dashboard_item_model.dart';
import 'package:maharishiji/presentation/dashboard_screen/models/dashboard_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState>
    with CodeAutoFill {
  DashboardBloc(DashboardState initialState) : super(initialState) {
    on<ContentInitialEvent>(_onInitialize);
    on<ChangeOTPEvent>(_changeOTP);
    on<NetworkStatusMonitor>(_monitorNetwork);
  }

  @override
  codeUpdated() {
    add(ChangeOTPEvent(code: code!));
  }

  _networkChanged(
      NetworkStatusChanged event, Emitter<DashboardState> emit) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    emit(state.copyWith(
        networkStatus: connectivityResult == ConnectivityResult.none
            ? 'NoInternet'
            : 'Internet'));
  }

  _monitorNetwork(
      NetworkStatusMonitor event, Emitter<DashboardState> emit) async {
    ConnectivityResult _connectionStatus = ConnectivityResult.none;
    final Connectivity _connectivity = Connectivity();
    _connectivity.onConnectivityChanged.listen((event) {
      emit(state.copyWith(
          networkStatus:
              event == ConnectivityResult.none ? 'NoInternet' : 'Internet'));
    });
  }

  _changeOTP(
    ChangeOTPEvent event,
    Emitter<DashboardState> emit,
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
    Emitter<DashboardState> emit,
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
