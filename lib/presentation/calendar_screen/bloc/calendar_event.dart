// ignore_for_file: must_be_immutable

part of 'calendar_bloc.dart';

@immutable
abstract class CalendarEvent extends Equatable {}

class CalendarInitialEvent extends CalendarEvent {
  @override
  List<Object?> get props => [];
}

///event for OTP auto fill
class ChangeOTPEvent extends CalendarEvent {
  ChangeOTPEvent({required this.code});

  String code;

  @override
  List<Object?> get props => [
        code,
      ];
}
