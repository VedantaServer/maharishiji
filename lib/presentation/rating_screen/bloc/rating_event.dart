// ignore_for_file: must_be_immutable

part of 'rating_bloc.dart';

@immutable
abstract class RatingEvent extends Equatable {}

class RatingInitialEvent extends RatingEvent {
  @override
  List<Object?> get props => [];
}
