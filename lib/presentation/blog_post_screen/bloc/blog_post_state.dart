// ignore_for_file: must_be_immutable

part of 'blog_post_bloc.dart';

class BlogPostState extends Equatable {
  BlogPostState({
    this.otpController,
    this.blogPostModelObj,
  });

  TextEditingController? otpController;

  BlogPostModel? blogPostModelObj;

  @override
  List<Object?> get props => [
        otpController,
        blogPostModelObj,
      ];
  BlogPostState copyWith({
    TextEditingController? otpController,
    BlogPostModel? blogPostModelObj,
  }) {
    return BlogPostState(
      otpController: otpController ?? this.otpController,
      blogPostModelObj: blogPostModelObj ?? this.blogPostModelObj,
    );
  }
}
