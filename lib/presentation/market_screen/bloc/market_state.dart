// ignore_for_file: must_be_immutable

part of 'market_bloc.dart';

class MarketState extends Equatable {
  MarketState({
    this.searchController,
    this.otpController,
    this.marketModelObj,
  });

  TextEditingController? searchController;

  TextEditingController? otpController;

  MarketModel? marketModelObj;

  @override
  List<Object?> get props => [
        searchController,
        otpController,
        marketModelObj,
      ];
  MarketState copyWith({
    TextEditingController? searchController,
    TextEditingController? otpController,
    MarketModel? marketModelObj,
  }) {
    return MarketState(
      searchController: searchController ?? this.searchController,
      otpController: otpController ?? this.otpController,
      marketModelObj: marketModelObj ?? this.marketModelObj,
    );
  }
}
