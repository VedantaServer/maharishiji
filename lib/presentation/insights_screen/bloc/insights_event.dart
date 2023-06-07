// ignore_for_file: must_be_immutable

part of 'insights_bloc.dart';

@immutable
abstract class InsightsEvent extends Equatable {}

class InsightsInitialEvent extends InsightsEvent {
  @override
  List<Object?> get props => [];
}

///event for OTP auto fill
class ChangeOTPEvent extends InsightsEvent {
  ChangeOTPEvent({required this.code});

  String code;

  @override
  List<Object?> get props => [
        code,
      ];
}
