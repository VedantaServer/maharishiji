// ignore_for_file: must_be_immutable

part of 'ios_status_bar_bloc.dart';

class IosStatusBarState extends Equatable {
  IosStatusBarState({this.iosStatusBarModelObj});

  IosStatusBarModel? iosStatusBarModelObj;

  @override
  List<Object?> get props => [
        iosStatusBarModelObj,
      ];
  IosStatusBarState copyWith({IosStatusBarModel? iosStatusBarModelObj}) {
    return IosStatusBarState(
      iosStatusBarModelObj: iosStatusBarModelObj ?? this.iosStatusBarModelObj,
    );
  }
}
