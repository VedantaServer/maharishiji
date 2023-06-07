// ignore_for_file: must_be_immutable

part of 'cover_bloc.dart';

@immutable
abstract class CoverEvent extends Equatable {}

class CoverInitialEvent extends CoverEvent {
  @override
  List<Object?> get props => [];
}
