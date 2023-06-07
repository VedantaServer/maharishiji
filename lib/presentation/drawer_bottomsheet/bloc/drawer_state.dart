// ignore_for_file: must_be_immutable

part of 'drawer_bloc.dart';

class DrawerState extends Equatable {
  DrawerState({this.drawerModelObj});

  DrawerModel? drawerModelObj;

  @override
  List<Object?> get props => [
        drawerModelObj,
      ];
  DrawerState copyWith({DrawerModel? drawerModelObj}) {
    return DrawerState(
      drawerModelObj: drawerModelObj ?? this.drawerModelObj,
    );
  }
}
