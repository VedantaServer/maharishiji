// ignore_for_file: must_be_immutable

part of 'expenses_bloc.dart';

class ExpensesState extends Equatable {
  ExpensesState({this.expensesModelObj});

  ExpensesModel? expensesModelObj;

  @override
  List<Object?> get props => [
        expensesModelObj,
      ];
  ExpensesState copyWith({ExpensesModel? expensesModelObj}) {
    return ExpensesState(
      expensesModelObj: expensesModelObj ?? this.expensesModelObj,
    );
  }
}
