// ignore_for_file: must_be_immutable

part of 'log_in_bloc.dart';

@immutable
abstract class LogInEvent extends Equatable {}

class LogInInitialEvent extends LogInEvent {
  @override
  List<Object?> get props => [];
}
