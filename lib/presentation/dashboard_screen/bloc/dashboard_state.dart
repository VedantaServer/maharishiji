// ignore_for_file: must_be_immutable

part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  DashboardState(
      {this.searchController,
      this.otpController,
      this.contentModelObj,
      this.networkStatus});

  String? networkStatus;
  TextEditingController? searchController;
  TextEditingController? otpController;
  DashboardModel? contentModelObj;

  @override
  List<Object?> get props =>
      [searchController, otpController, contentModelObj, networkStatus];

  DashboardState copyWith(
      {TextEditingController? searchController,
      TextEditingController? otpController,
      DashboardModel? contentModelObj,
      String? networkStatus}) {
    return DashboardState(
        searchController: searchController ?? this.searchController,
        otpController: otpController ?? this.otpController,
        contentModelObj: contentModelObj ?? this.contentModelObj,
        networkStatus: networkStatus != null ? 'Internet' : this.networkStatus);
  }
}
