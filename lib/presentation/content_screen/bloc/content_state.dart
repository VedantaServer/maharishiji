// ignore_for_file: must_be_immutable

part of 'content_bloc.dart';

class ContentState extends Equatable {
  ContentState({
    this.searchController,
    this.otpController,
    this.contentModelObj,
  });

  TextEditingController? searchController;

  TextEditingController? otpController;

  ContentModel? contentModelObj;

  @override
  List<Object?> get props => [
        searchController,
        otpController,
        contentModelObj,
      ];
  ContentState copyWith({
    TextEditingController? searchController,
    TextEditingController? otpController,
    ContentModel? contentModelObj,
  }) {
    return ContentState(
      searchController: searchController ?? this.searchController,
      otpController: otpController ?? this.otpController,
      contentModelObj: contentModelObj ?? this.contentModelObj,
    );
  }
}
