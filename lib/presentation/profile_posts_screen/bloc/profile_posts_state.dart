// ignore_for_file: must_be_immutable

part of 'profile_posts_bloc.dart';

class ProfilePostsState extends Equatable {
  ProfilePostsState({
    this.otpController,
    this.profilePostsModelObj,
  });

  TextEditingController? otpController;

  ProfilePostsModel? profilePostsModelObj;

  @override
  List<Object?> get props => [
        otpController,
        profilePostsModelObj,
      ];
  ProfilePostsState copyWith({
    TextEditingController? otpController,
    ProfilePostsModel? profilePostsModelObj,
  }) {
    return ProfilePostsState(
      otpController: otpController ?? this.otpController,
      profilePostsModelObj: profilePostsModelObj ?? this.profilePostsModelObj,
    );
  }
}
