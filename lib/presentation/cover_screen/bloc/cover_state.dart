// ignore_for_file: must_be_immutable

part of 'cover_bloc.dart';

class CoverState extends Equatable {
  CoverState({this.coverModelObj});

  CoverModel? coverModelObj;

  @override
  List<Object?> get props => [
        coverModelObj,
      ];
  CoverState copyWith({CoverModel? coverModelObj}) {
    return CoverState(
      coverModelObj: coverModelObj ?? this.coverModelObj,
    );
  }
}
