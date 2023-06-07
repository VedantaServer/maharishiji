// ignore_for_file: must_be_immutable

part of 'profile_posts_bloc.dart';

@immutable
abstract class ProfilePostsEvent extends Equatable {}

class ProfilePostsInitialEvent extends ProfilePostsEvent {
  @override
  List<Object?> get props => [];
}

///event for OTP auto fill
class ChangeOTPEvent extends ProfilePostsEvent {
  ChangeOTPEvent({required this.code});

  String code;

  @override
  List<Object?> get props => [
        code,
      ];
}
