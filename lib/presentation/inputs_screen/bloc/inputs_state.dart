// ignore_for_file: must_be_immutable

part of 'inputs_bloc.dart';

class InputsState extends Equatable {
  InputsState({
    this.checkboxfilledController,
    this.checkboxoptioneController,
    this.isCheckbox = false,
    this.inputsModelObj,
  });

  TextEditingController? checkboxfilledController;

  TextEditingController? checkboxoptioneController;

  InputsModel? inputsModelObj;

  bool isCheckbox;

  @override
  List<Object?> get props => [
        checkboxfilledController,
        checkboxoptioneController,
        isCheckbox,
        inputsModelObj,
      ];
  InputsState copyWith({
    TextEditingController? checkboxfilledController,
    TextEditingController? checkboxoptioneController,
    bool? isCheckbox,
    InputsModel? inputsModelObj,
  }) {
    return InputsState(
      checkboxfilledController:
          checkboxfilledController ?? this.checkboxfilledController,
      checkboxoptioneController:
          checkboxoptioneController ?? this.checkboxoptioneController,
      isCheckbox: isCheckbox ?? this.isCheckbox,
      inputsModelObj: inputsModelObj ?? this.inputsModelObj,
    );
  }
}
