import 'package:comment_and_post/features/comment/data/data_source/comment_datasource.dart';
import 'package:comment_and_post/features/comment/presentation/state/comment_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final commentViewModelProvider =
    StateNotifierProvider<CommentViewModel, CommentState>((ref) {
  final commentDataSource = ref.read(commentDataSourceProvider);
  return CommentViewModel(commentDataSource);
});

class CommentViewModel extends StateNotifier<CommentState> {
  final CommentDataSource _commentDataSource;
  CommentViewModel(
    this._commentDataSource,
  ) : super(
          CommentState.initial(),
        ) {
    getComments();
  }

  Future resetState() async {
    state = CommentState.initial();
    getComments();
  }

  Future getComments() async {
    state = state.copyWith(isLoading: true);
    final currentState = state;
    final page = currentState.page + 1;
    final comments = currentState.comments;
    final hasReachedMax = currentState.hasReachedMax;
    if (!hasReachedMax) {
      // get data from data source
      final result = await _commentDataSource.getComments(page);
      result.fold(
        (failure) =>
            state = state.copyWith(hasReachedMax: true, isLoading: false),
        (data) {
          if (data.isEmpty) {
            state = state.copyWith(hasReachedMax: true);
          } else {
            state = state.copyWith(
              comments: [...comments, ...data],
              page: page,
              isLoading: false,
            );
          }
        },
      );
    }
  }
}
