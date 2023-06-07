// ignore_for_file: must_be_immutable

part of 'market_one_bloc.dart';

class MarketOneState extends Equatable {
  MarketOneState({
    this.messageController,
    this.marketOneModelObj,
  });

  TextEditingController? messageController;

  MarketOneModel? marketOneModelObj;

  @override
  List<Object?> get props => [
        messageController,
        marketOneModelObj,
      ];
  MarketOneState copyWith({
    TextEditingController? messageController,
    MarketOneModel? marketOneModelObj,
  }) {
    return MarketOneState(
      messageController: messageController ?? this.messageController,
      marketOneModelObj: marketOneModelObj ?? this.marketOneModelObj,
    );
  }
}
