// ignore_for_file: must_be_immutable

part of 'inputs_two_bloc.dart';

@immutable
abstract class InputsTwoEvent extends Equatable {}

class InputsTwoInitialEvent extends InputsTwoEvent {
  @override
  List<Object?> get props => [];
}
