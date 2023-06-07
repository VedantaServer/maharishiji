// ignore_for_file: must_be_immutable

part of 'blog_post_bloc.dart';

@immutable
abstract class BlogPostEvent extends Equatable {}

class BlogPostInitialEvent extends BlogPostEvent {
  @override
  List<Object?> get props => [];
}

///event for OTP auto fill
class ChangeOTPEvent extends BlogPostEvent {
  ChangeOTPEvent({required this.code});

  String code;

  @override
  List<Object?> get props => [
        code,
      ];
}
