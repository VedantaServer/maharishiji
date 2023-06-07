// ignore_for_file: must_be_immutable

part of 'images_one_bloc.dart';

@immutable
abstract class ImagesOneEvent extends Equatable {}

class ImagesOneInitialEvent extends ImagesOneEvent {
  @override
  List<Object?> get props => [];
}

///event for OTP auto fill
class ChangeOTPEvent extends ImagesOneEvent {
  ChangeOTPEvent({required this.code});

  String code;

  @override
  List<Object?> get props => [
        code,
      ];
}
