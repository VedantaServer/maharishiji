// ignore_for_file: must_be_immutable

part of 'compose_bloc.dart';

class ComposeState extends Equatable {
  ComposeState({this.composeModelObj});

  ComposeModel? composeModelObj;

  @override
  List<Object?> get props => [
        composeModelObj,
      ];
  ComposeState copyWith({ComposeModel? composeModelObj}) {
    return ComposeState(
      composeModelObj: composeModelObj ?? this.composeModelObj,
    );
  }
}
