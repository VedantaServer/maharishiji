// ignore_for_file: must_be_immutable

part of 'compose_one_bloc.dart';

@immutable
abstract class ComposeOneEvent extends Equatable {}

class ComposeOneInitialEvent extends ComposeOneEvent {
  @override
  List<Object?> get props => [];
}
