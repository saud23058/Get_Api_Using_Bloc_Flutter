import 'package:equatable/equatable.dart';

import '../models/post_models.dart';
import '../utils/enums.dart';

class PostStates extends Equatable {
  final PostStatus postStatus;
  final List<PostModels> postList;
  final String message;

  const PostStates(
      {this.postStatus=PostStatus.loading,
      this.postList= const <PostModels>[],
      this.message=''});



  PostStates copyWith({PostStatus? postStatus, List<PostModels>? postList, String? message}){
    return PostStates(
      postStatus:postStatus ?? this.postStatus ,
      postList: postList ?? this.postList,
      message: message ?? this.message,
    );
}


  @override
  List<Object?> get props => [postStatus, postList];
}
