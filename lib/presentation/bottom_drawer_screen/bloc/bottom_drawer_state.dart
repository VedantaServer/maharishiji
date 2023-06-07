// ignore_for_file: must_be_immutable

part of 'bottom_drawer_bloc.dart';

class BottomDrawerState extends Equatable {
  BottomDrawerState({this.bottomDrawerModelObj});

  BottomDrawerModel? bottomDrawerModelObj;

  @override
  List<Object?> get props => [
        bottomDrawerModelObj,
      ];
  BottomDrawerState copyWith({BottomDrawerModel? bottomDrawerModelObj}) {
    return BottomDrawerState(
      bottomDrawerModelObj: bottomDrawerModelObj ?? this.bottomDrawerModelObj,
    );
  }
}
