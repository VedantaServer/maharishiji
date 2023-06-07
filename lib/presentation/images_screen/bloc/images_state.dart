// ignore_for_file: must_be_immutable

part of 'images_bloc.dart';

class ImagesState extends Equatable {
  ImagesState({
    this.otpController,
    this.imagesModelObj,
  });

  TextEditingController? otpController;

  ImagesModel? imagesModelObj;

  @override
  List<Object?> get props => [
        otpController,
        imagesModelObj,
      ];
  ImagesState copyWith({
    TextEditingController? otpController,
    ImagesModel? imagesModelObj,
  }) {
    return ImagesState(
      otpController: otpController ?? this.otpController,
      imagesModelObj: imagesModelObj ?? this.imagesModelObj,
    );
  }
}
