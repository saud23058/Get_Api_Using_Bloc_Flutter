import 'package:api_using_bloc/bloc/bloc.dart';
import 'package:api_using_bloc/bloc/bloc_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc_states.dart';
import '../utils/enums.dart';
class PosterScreen extends StatefulWidget {
  const PosterScreen({super.key});

  @override
  State<PosterScreen> createState() => _PosterScreenState();
}

class _PosterScreenState extends State<PosterScreen> {
  @override
  void initState() {

    super.initState();
    context.read<PostBloc>().add(PostFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Api'),),
      body: BlocBuilder<PostBloc, PostStates>(
        builder: (context,state){
          switch(state.postStatus){
            case PostStatus.loading:
              return CircularProgressIndicator();
            case PostStatus.success:
              return ListView.builder(
                  itemCount: state.postList.length,
                  itemBuilder: (context, index){
                    final item =state.postList[index];
                    return ListTile(
                      title: Text(item.email.toString()),
                      subtitle: Text(item.body.toString()),
                    );
                  });
            case PostStatus.failure:
             return Center(child: Text(state.message.toString()));
          }
                 },
      ),
    );
  }
}
