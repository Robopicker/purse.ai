part of 'post_bloc.dart';

enum PostStatus { initial, success, failure }

class PostState extends Equatable {
  final PostStatus status;
  final List<PostModel> post;
  final bool hasReachedMax;
  const PostState(
      {this.status = PostStatus.initial,
      this.post = const <PostModel>[],
      this.hasReachedMax = false});

  PostState copyWidth({
    PostStatus? status,
    List<PostModel>? posts,
    bool? hasReachedMax,
  }) {
    return PostState(
        status: status ?? this.status,
        post: posts ?? this.post,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }

  @override
  String toString() {
    return '''PostState { status: $status, hasReachedMax: $hasReachedMax, posts: ${post.length} }''';
  }

  @override
  List<Object> get props => [status, post, hasReachedMax];
}
