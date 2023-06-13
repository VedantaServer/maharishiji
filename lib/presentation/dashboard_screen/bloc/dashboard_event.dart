// ignore_for_file: must_be_immutable

part of 'dashboard_bloc.dart';

@immutable
abstract class ContentEvent extends Equatable {}

class ContentInitialEvent extends ContentEvent {
  @override
  List<Object?> get props => [];
}

///event for OTP auto fill
class ChangeOTPEvent extends ContentEvent {
  ChangeOTPEvent({required this.code});

  String code;

  @override
  List<Object?> get props => [
        code,
      ];
}
