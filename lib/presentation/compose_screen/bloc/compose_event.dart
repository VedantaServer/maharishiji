// ignore_for_file: must_be_immutable

part of 'compose_bloc.dart';

@immutable
abstract class ComposeEvent extends Equatable {}

class ComposeInitialEvent extends ComposeEvent {
  @override
  List<Object?> get props => [];
}
