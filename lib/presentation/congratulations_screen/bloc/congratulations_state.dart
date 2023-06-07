// ignore_for_file: must_be_immutable

part of 'congratulations_bloc.dart';

class CongratulationsState extends Equatable {
  CongratulationsState({this.congratulationsModelObj});

  CongratulationsModel? congratulationsModelObj;

  @override
  List<Object?> get props => [
        congratulationsModelObj,
      ];
  CongratulationsState copyWith(
      {CongratulationsModel? congratulationsModelObj}) {
    return CongratulationsState(
      congratulationsModelObj:
          congratulationsModelObj ?? this.congratulationsModelObj,
    );
  }
}
