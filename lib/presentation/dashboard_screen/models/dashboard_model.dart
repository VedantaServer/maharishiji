// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'dashboard_item_model.dart';

/// This class defines the variables used in the [dashboard_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class DashboardModel extends Equatable {
  DashboardModel({this.contentblocksItemList = const []});

  List<ContentblocksItemModel> contentblocksItemList;

  DashboardModel copyWith({List<ContentblocksItemModel>? contentblocksItemList}) {
    return DashboardModel(
      contentblocksItemList:
          contentblocksItemList ?? this.contentblocksItemList,
    );
  }

  @override
  List<Object?> get props => [contentblocksItemList];
}
