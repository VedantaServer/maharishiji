// ignore_for_file: must_be_immutable

part of 'calendar_one_bloc.dart';

class CalendarOneState extends Equatable {
  CalendarOneState({
    this.otpController,
    this.calendarOneModelObj,
  });

  TextEditingController? otpController;

  CalendarOneModel? calendarOneModelObj;

  @override
  List<Object?> get props => [
        otpController,
        calendarOneModelObj,
      ];
  CalendarOneState copyWith({
    TextEditingController? otpController,
    CalendarOneModel? calendarOneModelObj,
  }) {
    return CalendarOneState(
      otpController: otpController ?? this.otpController,
      calendarOneModelObj: calendarOneModelObj ?? this.calendarOneModelObj,
    );
  }
}
