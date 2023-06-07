// ignore_for_file: must_be_immutable

part of 'profile_photos_bloc.dart';

@immutable
abstract class ProfilePhotosEvent extends Equatable {}

class ProfilePhotosInitialEvent extends ProfilePhotosEvent {
  @override
  List<Object?> get props => [];
}

///event for OTP auto fill
class ChangeOTPEvent extends ProfilePhotosEvent {
  ChangeOTPEvent({required this.code});

  String code;

  @override
  List<Object?> get props => [
        code,
      ];
}
