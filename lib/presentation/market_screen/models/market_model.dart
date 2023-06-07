// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'listrectangleth_item_model.dart';
import 'list_item_model.dart';
import 'list_one_item_model.dart';

/// This class defines the variables used in the [market_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class MarketModel extends Equatable {
  MarketModel({
    this.listrectanglethItemList = const [],
    this.listItemList = const [],
    this.listOneItemList = const [],
  });

  List<ListrectanglethItemModel> listrectanglethItemList;

  List<ListItemModel> listItemList;

  List<ListOneItemModel> listOneItemList;

  MarketModel copyWith({
    List<ListrectanglethItemModel>? listrectanglethItemList,
    List<ListItemModel>? listItemList,
    List<ListOneItemModel>? listOneItemList,
  }) {
    return MarketModel(
      listrectanglethItemList:
          listrectanglethItemList ?? this.listrectanglethItemList,
      listItemList: listItemList ?? this.listItemList,
      listOneItemList: listOneItemList ?? this.listOneItemList,
    );
  }

  @override
  List<Object?> get props =>
      [listrectanglethItemList, listItemList, listOneItemList];
}
