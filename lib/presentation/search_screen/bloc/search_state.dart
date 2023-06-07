// ignore_for_file: must_be_immutable

part of 'search_bloc.dart';

class SearchState extends Equatable {
  SearchState({
    this.searchController,
    this.searchoneController,
    this.searchtwoController,
    this.searchthreeController,
    this.searchfourController,
    this.searchfiveController,
    this.searchsixController,
    this.otpController,
    this.searchModelObj,
  });

  TextEditingController? searchController;

  TextEditingController? searchoneController;

  TextEditingController? searchtwoController;

  TextEditingController? searchthreeController;

  TextEditingController? searchfourController;

  TextEditingController? searchfiveController;

  TextEditingController? searchsixController;

  TextEditingController? otpController;

  SearchModel? searchModelObj;

  @override
  List<Object?> get props => [
        searchController,
        searchoneController,
        searchtwoController,
        searchthreeController,
        searchfourController,
        searchfiveController,
        searchsixController,
        otpController,
        searchModelObj,
      ];
  SearchState copyWith({
    TextEditingController? searchController,
    TextEditingController? searchoneController,
    TextEditingController? searchtwoController,
    TextEditingController? searchthreeController,
    TextEditingController? searchfourController,
    TextEditingController? searchfiveController,
    TextEditingController? searchsixController,
    TextEditingController? otpController,
    SearchModel? searchModelObj,
  }) {
    return SearchState(
      searchController: searchController ?? this.searchController,
      searchoneController: searchoneController ?? this.searchoneController,
      searchtwoController: searchtwoController ?? this.searchtwoController,
      searchthreeController:
          searchthreeController ?? this.searchthreeController,
      searchfourController: searchfourController ?? this.searchfourController,
      searchfiveController: searchfiveController ?? this.searchfiveController,
      searchsixController: searchsixController ?? this.searchsixController,
      otpController: otpController ?? this.otpController,
      searchModelObj: searchModelObj ?? this.searchModelObj,
    );
  }
}
