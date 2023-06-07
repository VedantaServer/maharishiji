// ignore_for_file: must_be_immutable

part of 'ios_navigation_bloc.dart';

class IosNavigationState extends Equatable {
  IosNavigationState({
    this.otpController,
    this.iosNavigationModelObj,
  });

  TextEditingController? otpController;

  IosNavigationModel? iosNavigationModelObj;

  @override
  List<Object?> get props => [
        otpController,
        iosNavigationModelObj,
      ];
  IosNavigationState copyWith({
    TextEditingController? otpController,
    IosNavigationModel? iosNavigationModelObj,
  }) {
    return IosNavigationState(
      otpController: otpController ?? this.otpController,
      iosNavigationModelObj:
          iosNavigationModelObj ?? this.iosNavigationModelObj,
    );
  }
}
