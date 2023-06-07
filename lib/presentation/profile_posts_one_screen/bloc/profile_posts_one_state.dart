// ignore_for_file: must_be_immutable

part of 'profile_posts_one_bloc.dart';

class ProfilePostsOneState extends Equatable {
  ProfilePostsOneState({
    this.otpController,
    this.profilePostsOneModelObj,
  });

  TextEditingController? otpController;

  ProfilePostsOneModel? profilePostsOneModelObj;

  @override
  List<Object?> get props => [
        otpController,
        profilePostsOneModelObj,
      ];
  ProfilePostsOneState copyWith({
    TextEditingController? otpController,
    ProfilePostsOneModel? profilePostsOneModelObj,
  }) {
    return ProfilePostsOneState(
      otpController: otpController ?? this.otpController,
      profilePostsOneModelObj:
          profilePostsOneModelObj ?? this.profilePostsOneModelObj,
    );
  }
}
