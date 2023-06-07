// ignore_for_file: must_be_immutable

part of 'inputs_bloc.dart';

@immutable
abstract class InputsEvent extends Equatable {}

class InputsInitialEvent extends InputsEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing checkbox
class ChangeCheckBoxEvent extends InputsEvent {
  ChangeCheckBoxEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}
