// ignore_for_file: must_be_immutable

part of 'feed_bloc.dart';

@immutable
abstract class FeedEvent extends Equatable {}

class FeedInitialEvent extends FeedEvent {
  @override
  List<Object?> get props => [];
}

///event for OTP auto fill
class ChangeOTPEvent extends FeedEvent {
  ChangeOTPEvent({required this.code});

  String code;

  @override
  List<Object?> get props => [
        code,
      ];
}
