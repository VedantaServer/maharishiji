// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'bars_item_model.dart';
import 'listicon_item_model.dart';

/// This class defines the variables used in the [expenses_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ExpensesModel extends Equatable {
  ExpensesModel({
    this.barsItemList = const [],
    this.listiconItemList = const [],
  });

  List<BarsItemModel> barsItemList;

  List<ListiconItemModel> listiconItemList;

  ExpensesModel copyWith({
    List<BarsItemModel>? barsItemList,
    List<ListiconItemModel>? listiconItemList,
  }) {
    return ExpensesModel(
      barsItemList: barsItemList ?? this.barsItemList,
      listiconItemList: listiconItemList ?? this.listiconItemList,
    );
  }

  @override
  List<Object?> get props => [barsItemList, listiconItemList];
}
