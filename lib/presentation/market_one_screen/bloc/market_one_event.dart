// ignore_for_file: must_be_immutable

part of 'market_one_bloc.dart';

@immutable
abstract class MarketOneEvent extends Equatable {}

class MarketOneInitialEvent extends MarketOneEvent {
  @override
  List<Object?> get props => [];
}
