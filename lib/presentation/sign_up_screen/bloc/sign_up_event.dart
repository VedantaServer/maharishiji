// ignore_for_file: must_be_immutable

part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent extends Equatable {}

class SignUpInitialEvent extends SignUpEvent {
  @override
  List<Object?> get props => [];
}
