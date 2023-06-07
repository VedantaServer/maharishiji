// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'listtwentynine_item_model.dart';
import 'listicon1_item_model.dart';

/// This class defines the variables used in the [calendar_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class CalendarModel extends Equatable {
  CalendarModel({
    this.listtwentynineItemList = const [],
    this.listicon1ItemList = const [],
  });

  List<ListtwentynineItemModel> listtwentynineItemList;

  List<Listicon1ItemModel> listicon1ItemList;

  CalendarModel copyWith({
    List<ListtwentynineItemModel>? listtwentynineItemList,
    List<Listicon1ItemModel>? listicon1ItemList,
  }) {
    return CalendarModel(
      listtwentynineItemList:
          listtwentynineItemList ?? this.listtwentynineItemList,
      listicon1ItemList: listicon1ItemList ?? this.listicon1ItemList,
    );
  }

  @override
  List<Object?> get props => [listtwentynineItemList, listicon1ItemList];
}
