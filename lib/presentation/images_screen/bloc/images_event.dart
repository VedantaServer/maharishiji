// ignore_for_file: must_be_immutable

part of 'images_bloc.dart';

@immutable
abstract class ImagesEvent extends Equatable {}

class ImagesInitialEvent extends ImagesEvent {
  @override
  List<Object?> get props => [];
}

///event for OTP auto fill
class ChangeOTPEvent extends ImagesEvent {
  ChangeOTPEvent({required this.code});

  String code;

  @override
  List<Object?> get props => [
        code,
      ];
}
