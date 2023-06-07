// ignore_for_file: must_be_immutable

part of 'ios_status_bar_bloc.dart';

@immutable
abstract class IosStatusBarEvent extends Equatable {}

class IosStatusBarInitialEvent extends IosStatusBarEvent {
  @override
  List<Object?> get props => [];
}
