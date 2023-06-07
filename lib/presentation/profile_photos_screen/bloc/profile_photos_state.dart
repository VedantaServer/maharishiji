// ignore_for_file: must_be_immutable

part of 'profile_photos_bloc.dart';

class ProfilePhotosState extends Equatable {
  ProfilePhotosState({
    this.otpController,
    this.profilePhotosModelObj,
  });

  TextEditingController? otpController;

  ProfilePhotosModel? profilePhotosModelObj;

  @override
  List<Object?> get props => [
        otpController,
        profilePhotosModelObj,
      ];
  ProfilePhotosState copyWith({
    TextEditingController? otpController,
    ProfilePhotosModel? profilePhotosModelObj,
  }) {
    return ProfilePhotosState(
      otpController: otpController ?? this.otpController,
      profilePhotosModelObj:
          profilePhotosModelObj ?? this.profilePhotosModelObj,
    );
  }
}
