// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'scrollcontainer_item_model.dart';

/// This class defines the variables used in the [profile_posts_two_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ProfilePostsTwoModel extends Equatable {
  ProfilePostsTwoModel({this.scrollcontainerItemList = const []});

  List<ScrollcontainerItemModel> scrollcontainerItemList;

  ProfilePostsTwoModel copyWith(
      {List<ScrollcontainerItemModel>? scrollcontainerItemList}) {
    return ProfilePostsTwoModel(
      scrollcontainerItemList:
          scrollcontainerItemList ?? this.scrollcontainerItemList,
    );
  }

  @override
  List<Object?> get props => [scrollcontainerItemList];
}
