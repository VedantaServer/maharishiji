// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'insights_item_model.dart';

/// This class defines the variables used in the [insights_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class InsightsModel extends Equatable {
  InsightsModel({this.insightsItemList = const []});

  List<InsightsItemModel> insightsItemList;

  InsightsModel copyWith({List<InsightsItemModel>? insightsItemList}) {
    return InsightsModel(
      insightsItemList: insightsItemList ?? this.insightsItemList,
    );
  }

  @override
  List<Object?> get props => [insightsItemList];
}
