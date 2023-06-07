// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'profileposts1_item_model.dart';

/// This class defines the variables used in the [profile_posts_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ProfilePostsOneModel extends Equatable {
  ProfilePostsOneModel({this.profileposts1ItemList = const []});

  List<Profileposts1ItemModel> profileposts1ItemList;

  ProfilePostsOneModel copyWith(
      {List<Profileposts1ItemModel>? profileposts1ItemList}) {
    return ProfilePostsOneModel(
      profileposts1ItemList:
          profileposts1ItemList ?? this.profileposts1ItemList,
    );
  }

  @override
  List<Object?> get props => [profileposts1ItemList];
}
