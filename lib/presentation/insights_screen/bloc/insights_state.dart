// ignore_for_file: must_be_immutable

part of 'insights_bloc.dart';

class InsightsState extends Equatable {
  InsightsState({
    this.otpController,
    this.insightsModelObj,
  });

  TextEditingController? otpController;

  InsightsModel? insightsModelObj;

  @override
  List<Object?> get props => [
        otpController,
        insightsModelObj,
      ];
  InsightsState copyWith({
    TextEditingController? otpController,
    InsightsModel? insightsModelObj,
  }) {
    return InsightsState(
      otpController: otpController ?? this.otpController,
      insightsModelObj: insightsModelObj ?? this.insightsModelObj,
    );
  }
}
