// ignore_for_file: must_be_immutable

part of 'rating_bloc.dart';

class RatingState extends Equatable {
  RatingState({this.ratingModelObj});

  RatingModel? ratingModelObj;

  @override
  List<Object?> get props => [
        ratingModelObj,
      ];
  RatingState copyWith({RatingModel? ratingModelObj}) {
    return RatingState(
      ratingModelObj: ratingModelObj ?? this.ratingModelObj,
    );
  }
}
