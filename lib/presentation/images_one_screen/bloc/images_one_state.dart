// ignore_for_file: must_be_immutable

part of 'images_one_bloc.dart';

class ImagesOneState extends Equatable {
  ImagesOneState({
    this.otpController,
    this.imagesOneModelObj,
  });

  TextEditingController? otpController;

  ImagesOneModel? imagesOneModelObj;

  @override
  List<Object?> get props => [
        otpController,
        imagesOneModelObj,
      ];
  ImagesOneState copyWith({
    TextEditingController? otpController,
    ImagesOneModel? imagesOneModelObj,
  }) {
    return ImagesOneState(
      otpController: otpController ?? this.otpController,
      imagesOneModelObj: imagesOneModelObj ?? this.imagesOneModelObj,
    );
  }
}
