import 'package:comment_and_post/features/comment/data/model/comments_model.dart';

class CommentState {
  final List<CommentsModel> comments;
  final bool hasReachedMax;
  final int page;
  final bool isLoading;

  CommentState({
    required this.comments,
    required this.hasReachedMax,
    required this.page,
    required this.isLoading,
  });

  factory CommentState.initial() {
    return CommentState(
      comments: [],
      hasReachedMax: false,
      page: 0,
      isLoading: false,
    );
  }

  CommentState copyWith({
    List<CommentsModel>? comments,
    bool? hasReachedMax,
    int? page,
    bool? isLoading,
  }) {
    return CommentState(
      comments: comments ?? this.comments,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
