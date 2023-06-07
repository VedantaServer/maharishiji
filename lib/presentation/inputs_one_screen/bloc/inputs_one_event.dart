// ignore_for_file: must_be_immutable

part of 'inputs_one_bloc.dart';

@immutable
abstract class InputsOneEvent extends Equatable {}

class InputsOneInitialEvent extends InputsOneEvent {
  @override
  List<Object?> get props => [];
}
