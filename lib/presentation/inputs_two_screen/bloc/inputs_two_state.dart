// ignore_for_file: must_be_immutable

part of 'inputs_two_bloc.dart';

class InputsTwoState extends Equatable {
  InputsTwoState({
    this.nameController,
    this.searchController,
    this.groupfortytwoController,
    this.radioselectedController,
    this.inputsTwoModelObj,
  });

  TextEditingController? nameController;

  TextEditingController? searchController;

  TextEditingController? groupfortytwoController;

  TextEditingController? radioselectedController;

  InputsTwoModel? inputsTwoModelObj;

  @override
  List<Object?> get props => [
        nameController,
        searchController,
        groupfortytwoController,
        radioselectedController,
        inputsTwoModelObj,
      ];
  InputsTwoState copyWith({
    TextEditingController? nameController,
    TextEditingController? searchController,
    TextEditingController? groupfortytwoController,
    TextEditingController? radioselectedController,
    InputsTwoModel? inputsTwoModelObj,
  }) {
    return InputsTwoState(
      nameController: nameController ?? this.nameController,
      searchController: searchController ?? this.searchController,
      groupfortytwoController:
          groupfortytwoController ?? this.groupfortytwoController,
      radioselectedController:
          radioselectedController ?? this.radioselectedController,
      inputsTwoModelObj: inputsTwoModelObj ?? this.inputsTwoModelObj,
    );
  }
}
