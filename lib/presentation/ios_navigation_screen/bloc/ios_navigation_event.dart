// ignore_for_file: must_be_immutable

part of 'ios_navigation_bloc.dart';

@immutable
abstract class IosNavigationEvent extends Equatable {}

class IosNavigationInitialEvent extends IosNavigationEvent {
  @override
  List<Object?> get props => [];
}

///event for OTP auto fill
class ChangeOTPEvent extends IosNavigationEvent {
  ChangeOTPEvent({required this.code});

  String code;

  @override
  List<Object?> get props => [
        code,
      ];
}
