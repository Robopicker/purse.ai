import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:purse_ai_app/DataProvider/user_provider.dart';
import 'package:purse_ai_app/Models/post_model.dart';

part 'post_event.dart';
part 'post_state.dart';

const _postLimit = 20;
const throttleDuration = Duration(milliseconds: 100);

class PostBloc extends Bloc<PostEvent, PostState> {
  final _userProvider = UserProvider();
  PostBloc() : super(PostState()) {
    on<PostFeetched>((event, emit) async {
      try {
        if (state.hasReachedMax) return;
        if (state.status == PostStatus.initial) {
          final posts = await _userProvider.fetchPosts(0);
          return emit(state.copyWidth(
              status: PostStatus.success, hasReachedMax: false, posts: posts));
        } else {
          final posts = await _userProvider.fetchPosts(state.post.length);
          return emit(state.copyWidth(
              status: PostStatus.success,
              hasReachedMax: false,
              posts: state.post..addAll(posts)));
        }
      } catch (e) {
        print(e);
        emit(state.copyWidth(status: PostStatus.failure));
      }
    });
  }
}
