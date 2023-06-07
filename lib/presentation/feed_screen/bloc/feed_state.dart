// ignore_for_file: must_be_immutable

part of 'feed_bloc.dart';

class FeedState extends Equatable {
  FeedState({
    this.searchController,
    this.otpController,
    this.feedModelObj,
  });

  TextEditingController? searchController;

  TextEditingController? otpController;

  FeedModel? feedModelObj;

  @override
  List<Object?> get props => [
        searchController,
        otpController,
        feedModelObj,
      ];
  FeedState copyWith({
    TextEditingController? searchController,
    TextEditingController? otpController,
    FeedModel? feedModelObj,
  }) {
    return FeedState(
      searchController: searchController ?? this.searchController,
      otpController: otpController ?? this.otpController,
      feedModelObj: feedModelObj ?? this.feedModelObj,
    );
  }
}
