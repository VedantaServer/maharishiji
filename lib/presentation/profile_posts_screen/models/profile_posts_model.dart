// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'profileposts_item_model.dart';

/// This class defines the variables used in the [profile_posts_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ProfilePostsModel extends Equatable {
  ProfilePostsModel({this.profilepostsItemList = const []});

  List<ProfilepostsItemModel> profilepostsItemList;

  ProfilePostsModel copyWith(
      {List<ProfilepostsItemModel>? profilepostsItemList}) {
    return ProfilePostsModel(
      profilepostsItemList: profilepostsItemList ?? this.profilepostsItemList,
    );
  }

  @override
  List<Object?> get props => [profilepostsItemList];
}
