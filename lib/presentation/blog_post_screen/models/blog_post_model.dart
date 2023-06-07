// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [blog_post_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class BlogPostModel extends Equatable {
  BlogPostModel copyWith() {
    return BlogPostModel();
  }

  @override
  List<Object?> get props => [];
}
