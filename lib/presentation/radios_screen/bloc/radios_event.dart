// ignore_for_file: must_be_immutable

part of 'radios_bloc.dart';

@immutable
abstract class RadiosEvent extends Equatable {}

class RadiosInitialEvent extends RadiosEvent {
  @override
  List<Object?> get props => [];
}

///event for OTP auto fill
class ChangeOTPEvent extends RadiosEvent {
  ChangeOTPEvent({required this.code});

  String code;

  @override
  List<Object?> get props => [
        code,
      ];
}
