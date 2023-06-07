// ignore_for_file: must_be_immutable

part of 'congratulations_bloc.dart';

@immutable
abstract class CongratulationsEvent extends Equatable {}

class CongratulationsInitialEvent extends CongratulationsEvent {
  @override
  List<Object?> get props => [];
}
