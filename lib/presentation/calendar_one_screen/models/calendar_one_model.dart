// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'listrectangleth1_item_model.dart';
import 'list1_item_model.dart';

/// This class defines the variables used in the [calendar_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class CalendarOneModel extends Equatable {
  CalendarOneModel({
    this.listrectangleth1ItemList = const [],
    this.list1ItemList = const [],
  });

  List<Listrectangleth1ItemModel> listrectangleth1ItemList;

  List<List1ItemModel> list1ItemList;

  CalendarOneModel copyWith({
    List<Listrectangleth1ItemModel>? listrectangleth1ItemList,
    List<List1ItemModel>? list1ItemList,
  }) {
    return CalendarOneModel(
      listrectangleth1ItemList:
          listrectangleth1ItemList ?? this.listrectangleth1ItemList,
      list1ItemList: list1ItemList ?? this.list1ItemList,
    );
  }

  @override
  List<Object?> get props => [listrectangleth1ItemList, list1ItemList];
}
