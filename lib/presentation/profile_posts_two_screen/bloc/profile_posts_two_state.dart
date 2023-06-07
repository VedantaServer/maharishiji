// ignore_for_file: must_be_immutable

part of 'profile_posts_two_bloc.dart';

class ProfilePostsTwoState extends Equatable {
  ProfilePostsTwoState({
    this.otpController,
    this.profilePostsTwoModelObj,
  });

  TextEditingController? otpController;

  ProfilePostsTwoModel? profilePostsTwoModelObj;

  @override
  List<Object?> get props => [
        otpController,
        profilePostsTwoModelObj,
      ];
  ProfilePostsTwoState copyWith({
    TextEditingController? otpController,
    ProfilePostsTwoModel? profilePostsTwoModelObj,
  }) {
    return ProfilePostsTwoState(
      otpController: otpController ?? this.otpController,
      profilePostsTwoModelObj:
          profilePostsTwoModelObj ?? this.profilePostsTwoModelObj,
    );
  }
}
