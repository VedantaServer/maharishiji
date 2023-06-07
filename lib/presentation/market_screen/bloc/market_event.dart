// ignore_for_file: must_be_immutable

part of 'market_bloc.dart';

@immutable
abstract class MarketEvent extends Equatable {}

class MarketInitialEvent extends MarketEvent {
  @override
  List<Object?> get props => [];
}

///event for OTP auto fill
class ChangeOTPEvent extends MarketEvent {
  ChangeOTPEvent({required this.code});

  String code;

  @override
  List<Object?> get props => [
        code,
      ];
}
