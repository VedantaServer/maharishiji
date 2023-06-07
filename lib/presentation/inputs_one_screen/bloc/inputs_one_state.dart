// ignore_for_file: must_be_immutable

part of 'inputs_one_bloc.dart';

class InputsOneState extends Equatable {
  InputsOneState({this.inputsOneModelObj});

  InputsOneModel? inputsOneModelObj;

  @override
  List<Object?> get props => [
        inputsOneModelObj,
      ];
  InputsOneState copyWith({InputsOneModel? inputsOneModelObj}) {
    return InputsOneState(
      inputsOneModelObj: inputsOneModelObj ?? this.inputsOneModelObj,
    );
  }
}
