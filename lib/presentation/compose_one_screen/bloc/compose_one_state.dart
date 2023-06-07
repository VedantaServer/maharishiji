// ignore_for_file: must_be_immutable

part of 'compose_one_bloc.dart';

class ComposeOneState extends Equatable {
  ComposeOneState({this.composeOneModelObj});

  ComposeOneModel? composeOneModelObj;

  @override
  List<Object?> get props => [
        composeOneModelObj,
      ];
  ComposeOneState copyWith({ComposeOneModel? composeOneModelObj}) {
    return ComposeOneState(
      composeOneModelObj: composeOneModelObj ?? this.composeOneModelObj,
    );
  }
}
