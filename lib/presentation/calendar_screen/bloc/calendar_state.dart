// ignore_for_file: must_be_immutable

part of 'calendar_bloc.dart';

class CalendarState extends Equatable {
  CalendarState({
    this.otpController,
    this.calendarModelObj,
  });

  TextEditingController? otpController;

  CalendarModel? calendarModelObj;

  @override
  List<Object?> get props => [
        otpController,
        calendarModelObj,
      ];
  CalendarState copyWith({
    TextEditingController? otpController,
    CalendarModel? calendarModelObj,
  }) {
    return CalendarState(
      otpController: otpController ?? this.otpController,
      calendarModelObj: calendarModelObj ?? this.calendarModelObj,
    );
  }
}
