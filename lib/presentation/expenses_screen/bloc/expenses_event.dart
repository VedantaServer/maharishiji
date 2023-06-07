// ignore_for_file: must_be_immutable

part of 'expenses_bloc.dart';

@immutable
abstract class ExpensesEvent extends Equatable {}

class ExpensesInitialEvent extends ExpensesEvent {
  @override
  List<Object?> get props => [];
}
