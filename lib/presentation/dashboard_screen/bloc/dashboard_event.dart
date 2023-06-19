// ignore_for_file: must_be_immutable
part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardEvent extends Equatable {}

class NetworkStatusChanged extends DashboardEvent {
  @override
  List<Object?> get props => [];
}

class NetworkStatusMonitor extends DashboardEvent {
  @override
  List<Object?> get props => [];
}

class ContentInitialEvent extends DashboardEvent {
  @override
  List<Object?> get props => [];
}

///event for OTP auto fill
class ChangeOTPEvent extends DashboardEvent {
  ChangeOTPEvent({required this.code});
  String code;
  @override
  List<Object?> get props => [code,];
}
