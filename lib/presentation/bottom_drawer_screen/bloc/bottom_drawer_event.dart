// ignore_for_file: must_be_immutable

part of 'bottom_drawer_bloc.dart';

@immutable
abstract class BottomDrawerEvent extends Equatable {}

class BottomDrawerInitialEvent extends BottomDrawerEvent {
  @override
  List<Object?> get props => [];
}
