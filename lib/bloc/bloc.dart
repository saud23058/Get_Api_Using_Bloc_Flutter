import 'package:api_using_bloc/bloc/bloc_events.dart';
import 'package:api_using_bloc/bloc/bloc_states.dart';
import 'package:api_using_bloc/repo/post_repo.dart';
import 'package:api_using_bloc/utils/enums.dart';
import 'package:bloc/bloc.dart';

class PostBloc extends Bloc<PostEvents ,PostStates>{
  PostRepo postRepo=PostRepo();
  PostBloc():super(const PostStates()){
    on<PostFetched>(postFetchedApi);
  }

  Future<void> postFetchedApi(PostFetched event, Emitter<PostStates>emit) async {
   await postRepo.fetchPost().then((value) {
      emit(state.copyWith(postStatus: PostStatus.success,
        message: 'Success',
        postList: value
      ));
    }).onError((error, stackTrace) {
      emit(state.copyWith(postStatus: PostStatus.failure,message: error.toString()));
    });
  }
}