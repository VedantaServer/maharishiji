// ignore_for_file: must_be_immutable

part of 'profile_posts_two_bloc.dart';

@immutable
abstract class ProfilePostsTwoEvent extends Equatable {}

class ProfilePostsTwoInitialEvent extends ProfilePostsTwoEvent {
  @override
  List<Object?> get props => [];
}

///event for OTP auto fill
class ChangeOTPEvent extends ProfilePostsTwoEvent {
  ChangeOTPEvent({required this.code});

  String code;

  @override
  List<Object?> get props => [
        code,
      ];
}
