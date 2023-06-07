// ignore_for_file: must_be_immutable

part of 'calendar_one_bloc.dart';

@immutable
abstract class CalendarOneEvent extends Equatable {}

class CalendarOneInitialEvent extends CalendarOneEvent {
  @override
  List<Object?> get props => [];
}

///event for OTP auto fill
class ChangeOTPEvent extends CalendarOneEvent {
  ChangeOTPEvent({required this.code});

  String code;

  @override
  List<Object?> get props => [
        code,
      ];
}
