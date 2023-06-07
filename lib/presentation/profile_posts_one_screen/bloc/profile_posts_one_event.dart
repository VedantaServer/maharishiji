// ignore_for_file: must_be_immutable

part of 'profile_posts_one_bloc.dart';

@immutable
abstract class ProfilePostsOneEvent extends Equatable {}

class ProfilePostsOneInitialEvent extends ProfilePostsOneEvent {
  @override
  List<Object?> get props => [];
}

///event for OTP auto fill
class ChangeOTPEvent extends ProfilePostsOneEvent {
  ChangeOTPEvent({required this.code});

  String code;

  @override
  List<Object?> get props => [
        code,
      ];
}
